-----------------------------------
-- Zone: Windurst_Walls (239)
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
            player:printToPlayer("Excellent. Let us harness the powers of the avatars together.", xi.msg.channel.PARTY, "Irving")
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
    zone:registerCuboidTriggerArea(1, -2, -17, 140, 2, -16, 142)

    -- Irving (XISP)
    local table = xi.xispal.palInfo[palJob]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = table.name,
        look      = look,
        x         = -17.00,
        y         = -12.00,
        z         = 241.00,
        rotation  = 163,
        widescan  = 1,

        onTrigger  = function(player, npc)
            local hasMage = player:getCharVar('[XISP]hasMage')

            if npc:getLocalVar('dialogueLock') == 1 then
                return
            end

            if player:hasCompletedQuest(table.quest[1], table.quest[2]) and player:getRank(player:getNation()) >= 6 then
                if player:getCharVar('[XISP]' .. table.name .. 'FirstDialogue') == 0 and npc:getLocalVar('dialogueLock') == 0 then
                    npc:setLocalVar('dialogueLock', 1)

                    player:printToPlayer("Ah, another summoner... I could feel your presence before I laid eyes on you. The air shifts when one who commands ", xi.msg.channel.SAY, table.name)
                    player:printToPlayer("the astral steps into view.", xi.msg.channel.SAY, table.name)
                    player:timer(6000, function(player)
                        player:printToPlayer("I am Irving. No, not of noble blood, though the name does carry a certain flair, doesn't it?", xi.msg.channel.SAY, table.name)

                        player:timer(2000, function(player)
                            player:printToPlayer("I walk the path of the avatars not as a servant, but as one chosen - recognized. The astral lords know me.", xi.msg.channel.SAY, table.name)
                            player:printToPlayer("Not as their master, not as an equal, but as the inevitable. And I sense that you too have tasted a fraction of their power.", xi.msg.channel.SAY, table.name)

                            player:timer(6000, function(player)
                                player:printToPlayer("You and I, together, could do what few dare even dream. The prime avatars hide their strength behind", xi.msg.channel.SAY, table.name)
                                player:printToPlayer("trials and riddles, but I believe they await kindred flames. Two summoners, aligned not in submission, but in purpose.", xi.msg.channel.SAY, table.name)

                                player:timer(6000, function(player)
                                    player:printToPlayer("What say you? Shall we shake the heavens until even Bahamut stirs?", xi.msg.channel.SAY, table.name)
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
                            player:printToPlayer("What is it, " .. player:getName() .. ". What is our next challenge?", xi.msg.channel.PARTY, table.name)
                            menu2.options = dialogue2
                            xi.xisp.sendMenu(player, menu2)

                        -- Player has mage, but this one isn't in party, or we need to recruit
                        elseif
                            (hasMage == 1 and player:getCharVar('[XISP]mageJob') ~= table.job) or
                            hasMage == 0
                        then
                            player:printToPlayer("" .. player:getName() .. ", allow me", xi.msg.channel.SAY, table.name)
                            menu.options = dialogue
                            xi.xisp.sendMenu(player, menu)

                        else -- Shouldn't be reached. But a fail-safe
                            player:printToPlayer("Good day, ".. player:getName() .. ". Please come back later, I am busy.", xi.msg.channel.SAY, table.name)
                        end
                    end
                end
            else
                player:printToPlayer("I don't have the time for idle chat. I must seek out their power.", xi.msg.channel.SAY, table.name)
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
        local position = math.random(1, 5) - 123
        player:setPos(-257.5, -5.05, position, 0)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()  -- Heaven's Tower enter portal
            player:startEvent(86)
        end,
    }
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 86 then
        player:setPos(0, 0, -22.40, 192, 242)
    end
end

return zoneObject
