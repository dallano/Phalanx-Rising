-----------------------------------
-- Zone: Northern_San_dOria (231)
-----------------------------------
local ID = zones[xi.zone.NORTHERN_SAN_DORIA]
require('scripts/quests/flyers_for_regine')
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.WHM

menu =
{
    title = 'Shall I join your party?',
    options = {},
}

dialogue =
{
    {
        'Yes, please.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Excellent. I will take your lead.", xi.msg.channel.PARTY, "Rilea")
        end,
    },
    {
        'Let me think about it.',
        function(player)
            return
        end,
    },
}

menu2 =
{
    title = 'Shall I leave your party?',
    options = {},
}

dialogue2 =
{
    {
        'Take care.',
        function(player)
            xi.xispal.removeMage(player)
        end,
    },
    {
        'On second thought...',
        function(player)
            return
        end,
    },
}

zoneObject.onInitialize = function(zone)
    xi.server.setExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    zone:registerCuboidTriggerArea(1, -7, -3, 110, 7, -1, 155)
    quests.ffr.initZone(zone) -- register trigger areas 2 through 6

    xi.events.harvestFestival.applyHalloweenNpcCostumes(zone:getID())

    -- Rilea (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 139.10,
        y         = 0.00,
        z         = 119.90,
        rotation  = 134,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasMage = player:getCharVar('[XISP]hasMage')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:getRank(player:getNation()) >= 6 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Ah... pardon me, adventurer. Might I have a word, if you would be so kind?", xi.msg.channel.SAY, table.name)

                    player:timer(4000, function(player)
                        player:printToPlayer("My name is Rilea, humble servant of Altana and apprentice to His Highness, Prince Pieuje.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("I have dwelled long within these hallowed halls, devoting my days to healing and prayer...", xi.msg.channel.SAY, table.name)
                            player:printToPlayer("yet the time has come when the needs of the kingdom call me beyond the stone and sanctity of the cathedral.", xi.msg.channel.SAY, table.name)
                            player:timer(8000, function(player)
                                player:printToPlayer("San d'Oria trembles beneath burdens both seen and unseen, and though I am but a single soul, I would offer what strength I have.", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("My arts lie not in blade or arrow, but in light-the light that mends, that shields, that soothes the wounded spirit.", xi.msg.channel.SAY, table.name)
                                player:timer(8000, function(player)
                                    player:printToPlayer("Would you allow me to accompany you on your journey? That I may serve both the light of Altana and the hopes of our noble house?", xi.msg.channel.SAY, table.name)
                                    player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                    npc:setLocalVar('dialogueLock', 0)
                                    return
                                end)
                            end)
                        end)
                    end)
                else
                    if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                        -- Currently in party
                        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                            player:printToPlayer("What do you require of me, " .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has mage, but this one isn't in party, or we need to recruit
                        elseif
                            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                            hasMage == 0
                        then
                            player:printToPlayer("Yes, " .. player:getName() .. "? Are you in need of a healer?", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Forgive me, adventurer. But I am enjoying today's sermons.", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = { -1 }

    if
        player:getCharVar('peaceForTheSpiritCS') == 5 and
        player:getFreeSlotsCount() >= 1
    then
        cs = { 49 }
    end

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(130, -0.2, -3, 160)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()  -- Chateau d'Oraguille access
            local pNation = player:getNation()
            local currentMission = player:getCurrentMission(pNation)

            if
                (pNation == 0 and player:getRank(player:getNation()) >= 2) or
                (pNation > 0 and player:hasCompletedMission(pNation, 5)) or
                (currentMission >= 5 and currentMission <= 9) or
                player:getRank(player:getNation()) >= 3
            then
                player:startEvent(569)
            else
                player:startEvent(568)
            end
        end,
    }

    quests.ffr.onTriggerAreaEnter(player, triggerArea) -- player approaching Flyers for Regine NPCs
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 569 then
        player:setPos(0, 0, -13, 192, 233)
    elseif
        csid == 49 and
        npcUtil.completeQuest(player, xi.questLog.SANDORIA, xi.quest.id.sandoria.PEACE_FOR_THE_SPIRIT, { item = 12513, fame = 60, title = xi.title.PARAGON_OF_RED_MAGE_EXCELLENCE })
    then
        player:setCharVar('peaceForTheSpiritCS', 0)
    elseif csid == 16 then
        player:setCharVar('Wait1DayM8-1_date', 0)
        player:setCharVar('Mission8-1Completed', 1)
    end
end

return zoneObject
