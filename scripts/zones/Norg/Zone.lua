-----------------------------------
-- Zone: Norg (252)
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.SAM

menu =
{
    title = 'You need me?',
    options = {},
}

dialogue =
{
    {
        'I do.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. Let us press onward, young 'in.", xi.msg.channel.PARTY, "Yamagi")
        end,
    },
    {
        'Not right now.',
        function(player)
            return
        end,
    },
}

menu2 =
{
    title = 'Can I get back to drinking?',
    options = {},
}

dialogue2 =
{
    {
        'Take care.',
        function(player)
            xi.xispal.removeKnight(player)
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
    xi.chocobo.initZone(zone)
    zone:registerCuboidTriggerArea(1, -24, 0, -59, -15, 1, -50)  -- Near the SSG exit

    -- Yamagi (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 46.40,
        y         = -6.30,
        z         = 15.00,
        rotation  = 81,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasKnight = player:getCharVar('[XISP]hasKnight')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 3 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)
                    player:printToPlayer("Oi! That stance... you're no greenhorn. Samurai, ain't ya?", xi.msg.channel.SAY, table.name)
                    player:timer(4000, function(player)
                        player:printToPlayer("Heh! Thought I smelled steel and honor. Haven't seen a new of us in years!", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("I'm an ol' vet. Used to swing steel so fast it made the wind jealous... now I just swing bottle of Tavnazian ale.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("But you? You've got a certain fire. That itch for battle. I can see it in your blade.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("Makes my old blood stir. Maybe it's time I dust off the blade, eh?", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("What say you, samurai? Let an old warrior tag along? I won't get in your way.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("Or maybe I will! Gives me more to laugh at between battles.", xi.msg.channel.SAY, table.name)
                                        player:timer(4000, function(player)
                                            player:printToPlayer("Let's make the ground shake again-like the old days!", xi.msg.channel.SAY, table.name)
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
                        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == table.job then
                            player:printToPlayer("What is it, " .. player:getName() .. "? Come to have a drink?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has knight, but this one isn't in party, or we need to recruit
                        elseif
                            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                            hasKnight == 0
                        then
                            player:printToPlayer("" .. player:getName() .. "! Come have a nice cold Tavnazian ale.", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Do I know you? Sorry, but leave me be.", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-19.238, -2.163, -63.964, 187)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()  -- An Undying Pledge cs trigger
            if player:getCharVar('anUndyingPledgeCS') == 1 then
                player:startEvent(226)
            end
        end,
    }
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 226 then
        player:setCharVar('anUndyingPledgeCS', 2)
    end
end

return zoneObject
