xi = xi or {}
xi.xispal = xi.xispal or {}

local sendMenu = function(player, menuID)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuID)
    end)
end

local menu1 = {}
local dialogue1 = {}

local menu2 = {}
local dialogue2 = {}

menu1 =
{
    title = 'Would you like to raise a new chocobo?',
    options = {},
}

dialogue1 =
{
    {
        'Can\'t wait!',
        function(playerArg)
            if playerArg:getCharVar('[XISP]hasChocobo') == 1 then
                playerArg:printToPlayer("It appears you already have a chocobo.", xi.msg.channel.SAY, ' ')
            else
                playerArg:printToPlayer("Congratulations on your new chocobo! All the best to you both.", xi.msg.channel.SAY, ' ')
                playerArg:setCharVar('[XISP]hasChocobo', 1)
                playerArg:setCharVar('[XISP]chocoGrow', 0)
                playerArg:setCharVar('[XISP]hasEgg', 0)
                xi.xispal.spawnChocobo(playerArg)
            end
        end,
    },
    {
        'On second thought...',
        function(playerArg)
        end,
    },
}

-- Starting over for when colored chocobos are worked out
-- This would allow players to try for colored chocobos
menu2 =
{
    title = 'Are you sure? This will ',
    options = {}
}

dialogue2 =
{

}

xi.xispal.onChocoboTrade = function(player, npc, trade)
    local name = npc:getName()

    if trade then
        if -- TODO (Each egg type gives different color)
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_FAINTLY_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_SLIGHTLY_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_A_BIT_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_A_LITTLE_WARM) or
            npcUtil.tradeHasExactly(trade, xi.item.CHOCOBO_EGG_SOMEWHAT_WARM)
        then
            if player:getCharVar('[XISP]hasChocobo') == 1 then
                player:printToPlayer("It looks like you already have a chocobo.", xi.msg.channel.SAY, name)
            else
                player:printToPlayer("A new chocobo egg? How wonderful! I will hold onto it for you.", xi.msg.channel.SAY, name)
                player:setCharVar('[XISP]hasEgg', 1)
                player:confirmTrade()
            end
        end
    end
end

xi.xispal.onChocoboTrigger = function(player, npc)
    if player:getCharVar('[XISP]hasEgg') == 1 then
        menu1.options = dialogue1
        sendMenu(player, menu1)
    end
end
