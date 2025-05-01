-----------------------------------
-- Zone: Heavens_Tower
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.BLM

menu =
{
    title = 'Are you in need?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. Let us be on our way. And might we be quick about it?", xi.msg.channel.PARTY, "Vivio")
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
    title = 'Can I tend to my duties?',
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
    zone:registerCuboidTriggerArea(1, -1, -1, -35, 1, 1, -33)
    zone:registerCuboidTriggerArea(2, 6, -46, -30, 8, -44, -28)

    -- Vivio (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 6.2,
        y         = 32,
        z         = 1.48,
        rotation  = 230,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasMage = player:getCharVar('[XISP]hasMage')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:getRank(player:getNation()) >= 6 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Careful where you step! These saplings are more delicate than they appear.", xi.msg.channel.SAY, table.name)
                    player:timer(2000, function(player)
                        player:printToPlayer("I'm tasked with their care. Every leaf and every root must be watched and nurtured.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("The Mother Tree speaks in silence. Her needs are endless, and her wisdom vast.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("However, I've been told my duties no longer end beneath the soil.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("Many suffer beyond these walls. Adventurers stretched thin, far from any sanctuary.", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("I struggle with the thought of leaving. But the Star Sybil insists I go where I'm needed.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("And something in you... suggests this is the right soil to plant my next step.", xi.msg.channel.SAY, table.name)
                                        player:timer(4000, function(player)
                                            player:printToPlayer("If you'll have me, I'll lend you my spells. For the world above, and the roots below.", xi.msg.channel.SAY, table.name)
                                            player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                            npc:setLocalVar('dialogueLock', 0)
                                            return
                                        end)
                                    end)
                                end)
                            end)
                        end)
                    end)
                else
                    if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                        -- Currently in party
                        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                            player:printToPlayer("Yes, my friend" .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has mage, but this one isn't in party, or we need to recruit
                        elseif
                            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                            hasMage == 0
                        then
                            player:printToPlayer("You're back! See how far these saplings have come?", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Careful where you step! What are you doing down here anyways?", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(0, 0, 22, 192)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()  -- Heaven's Tower exit portal
            player:startEvent(41)
        end,

        [2] = function()  -- Warp directly back to the first floor.
            player:startEvent(83)
        end,
    }
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 41 then
        player:setPos(0, -17, 135, 60, 239)
    end
end

return zoneObject
