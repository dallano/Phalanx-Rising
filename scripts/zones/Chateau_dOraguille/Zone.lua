-----------------------------------
-- Zone: Chateau_dOraguille (233)
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.DRG

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
            xi.xispal.setKnight(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. It is time to undo my father's wrong doings.", xi.msg.channel.PARTY, "Emilien")
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
    zone:registerCuboidTriggerArea(1, -95, 0, 75, -85, 5, 85)        -- Garden area near Chalvatot
    zone:registerCuboidTriggerArea(2, -87, -1.75, 55.5, -81, -1, 60) -- Stairs approaching Garden

    -- Emilien (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = 39.50,
        y         = -3.00,
        z         = -4.00,
        rotation  = 126,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasKnight = player:getCharVar('[XISP]hasKnight')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 3 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Greetings, noble adventurer. Allow me to introduce myself. I am Cyranuce's son, Emilien.", xi.msg.channel.SAY, table.name)
                    player:timer(3000, function(player)
                        player:printToPlayer("Thought my name holds little meaning in the wake of the debt my family owes you.", xi.msg.channel.SAY, table.name)

                        player:timer(3000, function(player)
                            player:printToPlayer("You courage and unwavering resolve saved my family and brought light to a dark fate.", xi.msg.channel.SAY, table.name)

                            player:timer(3000, function(player)
                                player:printToPlayer("For weeks now, I have wrestled with how I might best repay such mercy and kindess.", xi.msg.channel.SAY, table.name)

                                player:timer(3000, function(player)
                                    player:printToPlayer("I have chosen my path - not merely as a shield for my kin, but as your loyal knight", xi.msg.channel.SAY, table.name)

                                    player:timer(3000, function(player)
                                        player:printToPlayer("If you will have me, I wish to stand by your side in all battles to come, to guard your back", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("and fight with the honor you've bestowed my family.", xi.msg.channel.SAY, table.name)

                                        player:timer(6000, function(player)
                                            player:printToPlayer("Let me be your Dragoon, and further rid the curse placed upon my family.", xi.msg.channel.SAY, table.name)
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
                            player:printToPlayer("Hail, " .. player:getName() .. ". How am I to be of service?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has knight, but this one isn't in party,  or we need to recruit
                        elseif
                            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                            hasKnight == 0
                        then
                            player:printToPlayer("Good day, " .. player:getName() .. ". How can I be of service?", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Good day, adventurer. Please leave me to my duties.", xi.msg.channel.SAY, table.name)
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
        player:setPos(14.872, 8.918, 24.002, 255)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
