xi = xi or {}
xi.xispal = xi.xispal or {}

-- Returns true if dialogue should be skip passed trading an item
xi.xispal.youngSquireTrade = function(player, pal)
    local menu = {}
    local dialogue = {}

    menu =
    {
        title = 'Can I have it...?',
        options = {},
    }

    dialogue =
    {
        {
            'Of course!',
            function(playerArg)
                local item = xi.xispal.squireItems[player:getCharVar('[XISP]squireProg') + 1][player:getCharVar('[XISP]palItem')]
                for i = xi.inv.INVENTORY, xi.inv.WARDROBE8 do -- inventory locations enums
                    if player:hasItem(item, i) then
                        player:delItem(item, 1, i)
                        break
                    end
                end
                playerArg:printToPlayer("Thank you! Thank you! Thank you! I can't wait to start my training with this.", xi.msg.channel.PARTY, pal:getPacketName())
                playerArg:setCharVar('[XISP]palTimer1', VanadielUniqueDay() + 1)
                playerArg:incrementCharVar('[XISP]squireProg', 1)
            end,
        },
        {
            'Let me think about it.',
            function(playerArg)
            end,
        },
    }

    if player:getCharVar('[XISP]palTimer1') > VanadielUniqueDay() then
        return true

    else
        local random   = xi.xisp.seed_random(GetServerVariable('[XISP]ServerSeed'))
        local progress = player:getCharVar('[XISP]squireProg')

        player:setCharVar('[XISP]palItem', random(#xi.xispal.squireItems[progress + 1]))
        local item = xi.xispal.squireItems[progress + 1][player:getCharVar('[XISP]palItem')]

        if player:hasItem(item) then
            player:printToPlayer("You found a " .. GetItemByID(item):getName():gsub('%_', " ") .. "! This is just what I was looking for!", xi.msg.channel.PARTY, pal:getPacketName())
            menu.options = dialogue
            xi.xisp.sendMenu(player, menu)
            return false
        end

        return true
    end
end

xi.xispal.youngSquireChat = function(player, pal)
    local random      = xi.xisp.seed_random(GetServerVariable('[XISP]ServerSeed'))
    local progress    = player:getCharVar('[XISP]squireProg')
    local chatControl = player:getCharVar('[XISP]chatControl')
    local wait        = player:getCharVar('[XISP]palTimer1')

    -- This generation will always be the same based on the server seed
    player:setCharVar('[XISP]palItem', random(#xi.xispal.squireItems[progress + 1]))
    local item = xi.xispal.squireItems[progress + 1][player:getCharVar('[XISP]palItem')]

    if progress == 6 then
        player:printToPlayer("Master I've completed my training. I'm ready to join you in the field. Can we go see our nation's recruiter?", xi.msg.channel.PARTY, pal:getPacketName())
        return
    end

    if wait > VanadielUniqueDay() then
        player:printToPlayer("I've been deep in my studies, Master " .. player:getName() .. "!", xi.msg.channel.PARTY, pal:getPacketName())
    else
        if chatControl == 0 then
            player:printToPlayer("Hi, " .. player:getName() .. "! It's so very nice to meet you.", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 1)
            return
        elseif chatControl == 1 then
            player:printToPlayer("There are a few things I need in order to continue in my training... Can you help me find them?", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 2)
            return
        elseif chatControl == 2 then
            local itemName = GetItemByID(item):getName():gsub('%_', " ")

            player:printToPlayer("I think a " .. itemName .. " would help me get started! Can you help me find one?", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 1)
            return
        end
    end
end





xi.xispal.chocoboTrigger = function(player, choco)
    local chocogrow = player:getCharVar('[XISP]chocoGrow')
    local model     = choco:getModelId()
    local duration   = 360

    if model == 86 then -- Adult
        -- Check if player has any agro first.
        player:delStatusEffectSilent(xi.effect.MOUNTED)
        player:addStatusEffectEx(xi.effect.MOUNTED, xi.effect.MOUNTED, xi.mount.CHOCOBO, 0, 1800, 0, duration, true)
        choco:setBehavior(bit.band(choco:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
        DespawnMob(choco:getID())

    elseif model == 3031 then
        if player:getCharVar('[XISP]chocoWait') <= VanadielUniqueDay() then
            player:setCharVar('[XISP]chocoGrow', chocogrow + 1)
            player:setCharVar('[XISP]chocoWait', VanadielUniqueDay() + 1)
            chocogrow = player:getCharVar('[XISP]chocoGrow')

            if chocogrow < 1 then
                player:printToPlayer("Your chocobo seems a little nervous.", xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow < 3 then
                player:printToPlayer("Your chocobo has begun to warm up to you.", xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow < 6 then
                player:printToPlayer("Your chocobo refuses to leave your side.", xi.msg.channel.SYSTEM_3, ' ')
            elseif chocogrow <= 9 then
                player:printToPlayer("Your chocobo has come to adore you.", xi.msg.channel.SYSTEM_3, ' ')
            else
                -- Chocobo all grown up!
                choco:entityAnimationPacket(xi.animationString.SPECIAL_20)
            end
        end

        if chocogrow < 1 then
            choco:entityAnimationPacket(xi.animationString.SPECIAL_00)
        elseif chocogrow < 3 then
            choco:entityAnimationPacket(xi.animationString.SPECIAL_30)
        elseif chocogrow < 6 then
            choco:entityAnimationPacket(xi.animationString.SPECIAL_30)
        elseif chocogrow <= 9 then
            choco:entityAnimationPacket(xi.animationString.SPECIAL_20)
            choco:independentAnimation(choco, 252, 4)
        else
            choco:independentAnimation(choco, 251, 4)
        end
    end
end