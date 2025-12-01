-----------------------------------
-- Zone: Port_Windurst (240)
-----------------------------------
local ID = zones[xi.zone.PORT_WINDURST]
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.THF

menu =
{
    title = 'You need me or something?',
    options = {},
}

dialogue =
{
    {
        'Unfortunately I do',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Let's get a move on!.", xi.msg.channel.PARTY, "Ayala")
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
    title = 'You want me to scram?',
    options = {},
}

dialogue2 =
{
    {
        'Later!',
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
    xi.server.setExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    -- Ayala (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

    local pos = { x = 190, y = -12, z = 232, rotation = 51 }
    xi.xispdragon.initNPC(zone, pos) -- XISP

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -184.56,
        y         = -4.00,
        z         = 93.76,
        rotation  = 61,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasKnight = player:getCharVar('[XISP]hasKnight')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:getRank(player:getNation()) >= 3 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Well now... Look at you. Clean boots, eyes full of purpose. You've got that whole 'I'm going to change the world' look to you.", xi.msg.channel.SAY, table.name)
                    player:timer(4000, function(player)
                        player:printToPlayer("Name's Ayala. I'm what you might call a... facilitator of fortunes. I've got a knack of finding things other don't even know they've lost.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("And you? You look like someone who opens doors. Me? I slip through 'em.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("See, we could be useful to each other. You've got strength, presence-enough to get us into places most wouldn't dare tread.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("I've got eyes for opportunity and hands quicker than a Sahagin in shallow water. You like loot? I do.", xi.msg.channel.SAY, table.name)
                                    player:printToPlayer("You like not dying in a pit full of goblin firetraps? I like that too.", xi.msg.channel.SAY, table.name)
                                    player:timer(8000, function(player)
                                        player:printToPlayer("Stick with me and you won't just see the riches of Vanadiel-you'll own them. so what do you say? Partners?", xi.msg.channel.SAY, table.name)
                                        player:setCharVar('[XISP]' .. table.name .. 'FirstDialogue', 1)
                                        npc:setLocalVar('dialogueLock', 0)
                                        return
                                    end)
                                end)
                            end)

                        end)
                    end)
                else
                    if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 1 then
                        -- Currently in party
                        if hasKnight == 1 and player:getCharVar('[XISP]knightJob') == table.job then
                            player:printToPlayer("Yes, " .. player:getName() .. ". Whaddya want?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has knight, but this one isn't in party, or we need to recruit
                        elseif
                            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                            hasKnight == 0
                        then
                            player:printToPlayer("Oh, " .. player:getName() .. "! About that gil I owe you...", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Scram, kid! I'm trying to get some fish.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Scram, kid! Can't you see I'm doing something here? That fish looks delicious...", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = { -1 }

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        if prevZone == xi.zone.PORT_JEUNO then
            player:setPos(228.000, -3.000, 76.000, 160)
        else
            local position = math.random(1, 5) + 195
            player:setPos(position, -15.56, 258, 65)
        end
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTransportEvent = function(player, transport)
    player:startEvent(10002)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 10002 then
        player:setPos(0, 0, 0, 0, xi.zone.PORT_JEUNO)
    end
end

return zoneObject
