-----------------------------------
-- Zone: Upper_Jeuno (244)
-----------------------------------
---@type TZone
local zoneObject = {}

local menu = {}
local menu2 = {}
local dialogue = {}
local dialogue2 = {}
local palJob = xi.job.PLD

menu =
{
    title = 'In need my services?',
    options = {},
}

dialogue =
{
    {
        'I am.',
        function(player)
            xi.xispal.setKnight(player, xi.xispal.palInfo[palJob])
            player:printToPlayer("Understood. Let us be on our way.", xi.msg.channel.PARTY, "Isolde")
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
    title = 'Leave your party?',
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

    -- Isolde (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][0])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -30.5,
        y         = -1.50,
        z         = 9.50,
        rotation  = 182,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasKnight = player:getCharVar('[XISP]hasKnight')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 3 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)
                    player:printToPlayer("You've the look of one who walks the path with purpose, or at least, with courage.", xi.msg.channel.SAY, table.name)
                    player:timer(4000, function(player)
                        player:printToPlayer("I am a daughter of San d'Oria, trained beneath cathedral spires and battlefield sun alike.", xi.msg.channel.SAY, table.name)
                        player:timer(4000, function(player)
                            player:printToPlayer("Though my name bears no weight, I have vowed to raise it high on virtue and steel.", xi.msg.channel.SAY, table.name)
                            player:timer(4000, function(player)
                                player:printToPlayer("This chapel offers peace, but peace does little for the family I serve and the faith I keep.", xi.msg.channel.SAY, table.name)
                                player:timer(4000, function(player)
                                    player:printToPlayer("I believe the Goddess places trials before us not to hinder, but to shape us.", xi.msg.channel.SAY, table.name)
                                    player:timer(4000, function(player)
                                        player:printToPlayer("Perhaps you are one such trial, or a calling. Either way, I choose not to ignore it.", xi.msg.channel.SAY, table.name)
                                        player:printToPlayer("Allow me to walk beside you. I will guard you, and by doing so, guard my vow.", xi.msg.channel.SAY, table.name)
                                        player:timer(4000, function(player)
                                            player:printToPlayer("Together, let us earn a legacy that echoes far beyond these chapel walls.", xi.msg.channel.SAY, table.name)
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
                            player:printToPlayer("I enjoy coming to this church when my busy life allows it.", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has knight, but this one isn't in party, or we need to recruit
                        elseif
                            (hasKnight == 1 and player:getCharVar('[XISP]knightJob') ~= table.job) or
                            hasKnight == 0
                        then
                            player:printToPlayer("There you are. I was just beginning to worry about you.", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later. I must attend to my duties.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("Hi there. Did you need something?", xi.msg.channel.SAY, table.name)
            end
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(46.2, -5, -78, 172)
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
