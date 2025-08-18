-----------------------------------
-- Zone: Metalworks (237)
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.DRK

menu =
{
    title = 'In need of a knight?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Very well. I will meet you outside.", xi.msg.channel.PARTY, "Yaric")
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
    title = 'Can I get back to my post?',
    options = {},
}

dialogue2 =
{
    {
        'Yes, thank you.',
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
    -- Yaric (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -29.0,
        y         = 0,
        z         = -4.5,
        rotation  = 240,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasKnight = player:getCharVar('[XISP]hasKnight')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 3 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)
                    player:printToPlayer("I don't mind the soot... It comes with the job when you're posted near the smelters.", xi.msg.channel.SAY, table.name)
                    player:timer(1000, function(player)
                        player:printToPlayer("They call it 'honest work.' Maybe it is. But I feel these walls closing in.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("Every hammer strike echoes in my chest. Not from pride, but a longing.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("I've trained. Drilled. Waited. But adventure? It never reaches us grunts.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("And yet, here you are. Living what I only dream of between shifts.", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("I won't lie. I want out. Not to run, but to matter. To *fight* for Bastok.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("But asking feels... wrong. I have orders. I have a duty to my post.", xi.msg.channel.SAY, table.name)
                                        player:timer(4000, function(player)
                                            player:printToPlayer("Still... if you'd let me stand beside you, I'd show you my worth. No regrets.", xi.msg.channel.SAY, table.name)
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
                            player:printToPlayer("What is it, " .. player:getName() .. "? What brings us to the Metalworks?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has knight, but this one isn't in party, or we need to recruit
                        elseif
                            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                            hasKnight == 0
                        then
                            player:printToPlayer("" .. player:getName() .. "? I trust there is no problem..", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Welcome to the Metalworks. Please behave yourself.", xi.msg.channel.SAY, table.name)
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
        player:setPos(-9.168, 0, 0.001, 128)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    if player:hasKeyItem(xi.ki.MESSAGE_TO_JEUNO_BASTOK) then
        player:changeMusic(0, 161)   --  Despair
        player:changeMusic(1, 161)   --  Despair
    end
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
