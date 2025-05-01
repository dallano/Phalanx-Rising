-----------------------------------
-- Zone: Kazham (250)
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.NIN

menu =
{
    title = 'In need of a shadow?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setMage(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. I will meet you in the field.", xi.msg.channel.PARTY, "Umbra")
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
    xi.chocobo.initZone(zone)
    xi.chocoboGame.clearRecord(zone)

    -- Umbra (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -50.00,
        y         = -9.00,
        z         = -60.74,
        rotation  = 37,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasMage = player:getCharVar('[XISP]hasMage')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 6 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Strange... the wind shifts when you walk past. You're not like the others.", xi.msg.channel.SAY, table.name)
                    player:timer(4000, function(player)
                        player:printToPlayer("I've watched you from the mists that cling to these docks... you draw attention.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("Good. I prefer to travel with those who move tides, not drift with them.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("My name? Hm. Names are like smoke. They vanish the tighter you grasp.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("But if you must call me something... 'Umbria' will suffice.", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("I know this world. Its alleys, its blades, its whispers. I can be useful.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("Or dangerous. That depends on who points to me and why.", xi.msg.channel.SAY, table.name)
                                        player:timer(8000, function(player)
                                            player:printToPlayer("Take me with you. You'll never see a move I make. Only the results.", xi.msg.channel.SAY, table.name)
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
                        print('first')
                        -- Currently in party
                        if hasMage == 1 and player:getCharVar('[XISP]mageJob') == table.job then
                            print('second')
                            player:printToPlayer("Have I not pleased you, " .. player:getName() .. "?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has mage, but this one isn't in party, or we need to recruit
                        elseif
                            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                            hasMage == 0
                        then
                            print('third')
                            player:printToPlayer("Yes, " .. player:getName() .. "? Are your foes in need of dispatchment?", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                        print('wha')
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                print('who?')
                player:printToPlayer("The winds do not blow in your favor. Nor do the tides.", xi.msg.channel.SAY, table.name)
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
        if prevZone == xi.zone.KAZHAM_JEUNO_AIRSHIP then
            cs = 10002
        end

        player:setPos(-4.000, -3.000, 14.000, 66)
    end

    return cs
end

zoneObject.onTransportEvent = function(player, transport)
    player:startEvent(10000)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 10000 then
        player:setPos(0, 0, 0, 0, 226)
    end
end

return zoneObject
