-----------------------------------
-- Zone: Lower_Jeuno (245)
-----------------------------------
local ID = zones[xi.zone.LOWER_JEUNO]
local lowerJeunoGlobal = require('scripts/zones/Lower_Jeuno/globals')
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.BRD

menu =
{
    title = 'Can I come with you?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Yay! You won't regret it!", xi.msg.channel.PARTY, "Thessa")
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
    title = 'Are you leaving me here?',
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
    zone:registerCuboidTriggerArea(1, 23, 0, -43, 44, 7, -39) -- Inside Tenshodo HQ. TODO: Find out if this is used other than in ZM 17 (not anymore). Remove if not.
    xi.chocobo.initZone(zone)

    -- Thessa (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -21.40,
        y         = -0.10,
        z         = -65.00,
        rotation  = 201,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasMage = player:getCharVar('[XISP]hasMage')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end
            print(table.quest[1], table.quest[2])
            print(table.quest)
            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 6 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Ah, hello... sorry, I didn't mean to bother you.", xi.msg.channel.SAY, table.name)
                    player:timer(4000, function(player)
                        player:printToPlayer("I just... noticed your gear. You've clearly seen the world.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("I'm... a bard. Or at least, I hope to be. I've trained, quietly, here in town.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("But I haven't had the courage to leave on my own. Not yet.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("The songs I want to write, they need real stories. Real people.", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("If you'd let me come with you… I'd do my best to support you.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("Quietly, of course. I don't need the spotlight. Just a place to begin.", xi.msg.channel.SAY, table.name)
                                        player:timer(4000, function(player)
                                            player:printToPlayer("May I follow you? Just until I find the courage to stand on my own.", xi.msg.channel.SAY, table.name)
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
                            player:printToPlayer("Yes, " .. player:getName() .. "? Care to hear a paeon while you rest?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has mage, but this one isn't in party, or we need to recruit
                        elseif
                            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                            hasMage == 0
                        then
                            player:printToPlayer("" .. player:getName() .. "! What are you doing here?", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Care to hear a ballad? Ms. Almobankha just started.", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    local month = JstMonth()
    local day = JstDayOfTheMonth()

    -- Retail start/end dates vary, I am going with Dec 5th through Jan 5th.
    if
        (month == 12 and day >= 5) or
        (month == 1 and day <= 5)
    then
        player:changeMusic(0, 239)
        player:changeMusic(1, 239)
        -- No need for an 'else' to change it back outside these dates as a re-zone will handle that.
    end

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(41.2, -5, 84, 85)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onGameHour = function(zone)
    local vanadielHour = VanadielHour()
    local playerOnQuestId = GetServerVariable('[JEUNO]CommService')

    -- Community Service Quest
    -- 7AM: it's daytime. turn off all the lights
    if vanadielHour == 7 then
        for i = 0, 11 do
            local lamp = GetNPCByID(ID.npc.STREETLAMP_OFFSET + i)

            if lamp then
                lamp:setAnimation(xi.anim.CLOSE_DOOR)
            end
        end

    -- 8PM: make quest available
    -- notify anyone in zone with membership card that zauko is recruiting
    elseif vanadielHour == 18 then
        SetServerVariable('[JEUNO]CommService', 0)
        local players = zone:getPlayers()
        for name, player in pairs(players) do
            if player:hasKeyItem(xi.ki.LAMP_LIGHTERS_MEMBERSHIP_CARD) then
                player:messageSpecial(ID.text.ZAUKO_IS_RECRUITING)
            end
        end

    -- 9PM: notify the person on the quest that they can begin lighting lamps
    elseif vanadielHour == 21 then
        local playerOnQuest = GetPlayerByID(GetServerVariable('[JEUNO]CommService'))
        if playerOnQuest then
            playerOnQuest:startEvent(114)
        end

    -- 1AM: if nobody has accepted the quest yet, NPC Vhana Ehgaklywha takes up the task
    -- she starts near Zauko and paths all the way to the Rolanberry exit.
    -- xi.path.flag.WALLHACK because she gets stuck on some terrain otherwise.
    elseif vanadielHour == 1 then
        if playerOnQuestId == 0 then
            local npc = GetNPCByID(ID.npc.VHANA_EHGAKLYWHA)
            if not npc then
                return
            end

            npc:clearPath()
            npc:setStatus(0)
            npc:initNpcAi()
            npc:setPos(xi.path.first(lowerJeunoGlobal.lampPath))
            npc:pathThrough(lowerJeunoGlobal.lampPath, bit.bor(xi.path.flag.PATROL, xi.path.flag.WALLHACK))
        end
    end
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
