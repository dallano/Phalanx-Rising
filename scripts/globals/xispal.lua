xi = xi or {}
xi.xispal = xi.xispal or {}

local BODY_OFFSET  = 0x1000
local HANDS_OFFSET = 0x2000
local LEGS_OFFSET  = 0x3000
local FEET_OFFSET  = 0x4000
local MAIN_OFFSET  = 0x5000
local SUB_OFFSET   = 0x6000
local RANGE_OFFSET  = 0x7000




local generateModelID = function(face, race, tier)
    if tier > 16 then
        tier = 0
    end

    local modelID = "0x0100"

    -- Look
    modelID = modelID .. face
    modelID = modelID .. race
    modelID = modelID .. "00"

    -- Equipment
    modelID = modelID .. string.format("%04X", BODY_OFFSET + xi.xispal.squireGearSets[tier].body)
    modelID = modelID .. string.format("%04X", HANDS_OFFSET + xi.xispal.squireGearSets[tier].hands)
    modelID = modelID .. string.format("%04X", LEGS_OFFSET + xi.xispal.squireGearSets[tier].legs)
    modelID = modelID .. string.format("%04X", FEET_OFFSET + xi.xispal.squireGearSets[tier].feet)
    modelID = modelID .. string.format("%04X", MAIN_OFFSET + xi.xispal.squireGearSets[tier].main)
    modelID = modelID .. string.format("%04X", SUB_OFFSET + xi.xispal.squireGearSets[tier].sub)
    modelID = modelID .. string.format("%04X", RANGE_OFFSET)

    modelID = modelID .. "80"

    return modelID
end




local sendMenu = function(player, menuID)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuID)
    end)
end




local levelup = function(pal, player)
    if player:getMainLvl() ~= pal:getMainLvl() then
        pal:setMobLevel(player:getMainLvl())
    end
end




-- Returns a list of IDs of all possible followers
xi.xispal.getFollowers = function(player)
    local followers = {}

    if player:getCharVar('[XISP]squireID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]squireID'))
    end

    if player:getCharVar('[XISP]tankID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]tankID'))
    end

    if player:getCharVar('[XISP]mageID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]mageID'))
    end

    if player:getCharVar('[XISP]damageID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]damageID'))
    end

    if player:getCharVar('[XISP]chocoID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]chocoID'))
    end

    return followers
end




xi.xispal.resetFollowers = function(player)
    local followers =
    {
        player:getCharVar('[XISP]squireID'),
        player:getCharVar('[XISP]tankID'),
        player:getCharVar('[XISP]mageID'),
        player:getCharVar('[XISP]damageID'),
        player:getCharVar('[XISP]chocoID'),
    }

    for _, follower in pairs(followers) do
        if follower ~= 0 then
            local followerMob = GetMobByID(follower)

            if followerMob and followerMob:isSpawned() then
                followerMob:setBehavior(bit.band(followerMob:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                DespawnMob(follower)
            end
        end
    end

    player:setCharVar('[XISP]squireID', 0)
    player:setCharVar('[XISP]tankID', 0)
    player:setCharVar('[XISP]mageID', 0)
    player:setCharVar('[XISP]damageID', 0)
    player:setCharVar('[XISP]chocoID', 0)
end




xi.xispal.follow = function(player, pal)
    if player:getZone() ~= pal:getZone() then
        pal:setBehavior(bit.band(pal:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
        pal:setMobMod(xi.mobMod.NO_DESPAWN, 0)
        DespawnMob(pal:getID())
        return
    end

    -- Prevent them trying to roam back to spawn / despawning
    local pos = pal:getPos()
    pal:setSpawn(pos.x, pos.y, pos.z)

    local followers = xi.xispal.getFollowers(player)

    for followerIndex = #followers, 1, -1 do
        local follower = GetMobByID(followers[followerIndex])

        if follower and follower:isAlive() then
            local leader

            -- If this is the first follower, leader is the player
            if followerIndex == 1 then
                leader = player
            else
                leader = GetMobByID(followers[followerIndex - 1])
                -- If the leader is dead or nil, fall back to player
                if not (leader and leader:isAlive()) then
                    leader = player
                end
            end

            follower:follow(leader, xi.followType.ROAM)
        end
    end
end




xi.xispal.onMobRoam = function(player, pal)
    local pos = pal:getPos()
    pal:setSpawn(pos.x, pos.y, pos.z) -- Fixes pal attempting to path home
    local anim = player:getAnimation()
    pal:setMagicCastingEnabled(false)

    if pal:getSpeed() ~= player:getSpeed() then
        pal:setBaseSpeed(player:getSpeed())
    end

    if player:isEngaged() then
        pal:updateEnmity(player:getTarget())
    else
        xi.xispal.follow(player, pal)
        levelup(pal, player)
    end


    if anim > 0 then
        pal:setAnimation(anim)
    else
        if pal:getAnimation() ~= 0 then
            pal:setAnimation(0)
        end
    end
end




xi.xispal.onMobEngage = function(player, pal, target)
    pal:setMagicCastingEnabled(true)
end




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
                playerArg:delItem(item, 1, 0)
                playerArg:printToPlayer("Thank you! Thank you! Thank you! I can't wait to get started my training with this.", xi.msg.channel.PARTY, pal:getPacketName())
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
        return

    else
        local random   = xi.xisp.seed_random(GetServerVariable('[XISP]ServerSeed'))
        local progress = player:getCharVar('[XISP]squireProg')

        player:setCharVar('[XISP]palItem', random(#xi.xispal.squireItems[progress + 1]))
        local item = xi.xispal.squireItems[progress + 1][player:getCharVar('[XISP]palItem')]

        if player:hasItem(item) then
            player:printToPlayer("You found one! This is just what I was looking for!", xi.msg.channel.PARTY, pal:getPacketName())
            menu.options = dialogue
            sendMenu(player, menu)
        end

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
        elseif chatControl == 1 then
            player:printToPlayer("There are a few things I need in order to continue in my training... Can you help me find them?", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 2)
        elseif chatControl == 2 then
            local itemName = GetItemByID(item):getName():gsub('%_', " ")

            player:printToPlayer("I think a " .. itemName .. " would help me get started! Can you help me find one?", xi.msg.channel.PARTY, pal:getPacketName())
            player:setCharVar('[XISP]chatControl', 1)
        end
    end

end




xi.xispal.spawnYoungSquire = function(player)
    local look = xi.xispal.youngLook[player:getCharVar('[XISP]squireRace')]
    local zone = player:getZone()
    local pos  = player:getPos()

    -- Young squires only allowed in cities
    if zone:getTypeMask() ~= xi.zoneType.CITY then
        return
    end

    if player:getCharVar('[XISP]quest1Var') ~= 1 then
        return
    end

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = xi.xispal.name[player:getCharVar('[XISP]squireName')],
        x                     = pos.x + 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onTrigger = function(player, pal)
            xi.xispal.youngSquireChat(player, pal)
            xi.xispal.youngSquireTrade(player, pal)
        end,

        onMobSpawn = function(pal)
            -- Fun notes --
            -- Anim 90 makes them go super saiyan

            pal:setMobLevel(player:getMainLvl())
            -- pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.STANDBACK)) -- If mage standback?
            pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
            pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.NO_DESPAWN))
            pal:setRoamFlags(xi.roamFlag.SCRIPTED)
        end,

        onMobRoam = function(pal)
            local pos = pal:getPos()
            pal:setSpawn(pos.x, pos.y, pos.z) -- Fixes pal attempting to path home

            if pal:getSpeed() ~= player:getSpeed() then
                pal:setBaseSpeed(player:getSpeed())
            end

            xi.xispal.follow(player, pal)
        end,

        onMobEngage = function(pal, target)
            xi.xispal.onMobEngage(player, pal, target)
        end,

        onMobDeath = function(pal, player, optParams)
            -- Do stuff
        end,
    })

    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    pal:timer(500, function(palArg)
        palArg:spawn()
    end)
    pal:setAllegiance(1)

    player:setCharVar('[XISP]squireID', pal:getID())
end




xi.xispal.spawnSquire = function(player)
    local face = player:getCharVar('[XISP]squireFace')
    local race = player:getCharVar('[XISP]squireRace')
    local look = generateModelID(xi.xispal.face[face], xi.xispal.race[race], player:getCharVar('[XISP]squireTier'))

    local zone = player:getZone()
    local pos  = player:getPos()

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = xi.xispal.name[player:getCharVar('[XISP]squireName')],
        x                     = pos.x + 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            -- Fun notes --
            -- Anim 90 makes them go super saiyan

            pal:setMobLevel(player:getMainLvl())
            pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
            pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.NO_DESPAWN))
            pal:setRoamFlags(xi.roamFlag.SCRIPTED)
        end,

        onMobRoam = function(pal)
            xi.xispal.onMobRoam(player, pal)
        end,

        onMobEngage = function(pal, target)
            xi.xispal.onMobEngage(player, pal, target)
        end,

        onMobDeath = function(pal, player, optParams)
            -- Do stuff
        end,
    })

    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    pal:timer(500, function(palArg)
        palArg:spawn()
    end)
    pal:setAllegiance(1)

    player:setCharVar('[XISP]squireID', pal:getID())
end




xi.xispal.spawnChocobo = function(player)
    if player:getCharVar('[XISP]hasChocobo') == 0 then
        return
    end

    local look = 86 -- Default yellow chocobo
    local zone = player:getZone()
    local pos  = player:getPos()

    if player:getCharVar('[XISP]chocoGrow') < 10 then
        look = 3031 -- Baby Chocobo
    end

    -- Only adults spawn outdoors
    if look == 86 and zone:getTypeMask() ~= xi.zoneType.OUTDOORS then
        return
    end

    -- Only chicks spawn within city walls
    if look == 3031 and zone:getTypeMask() ~= xi.zoneType.CITY then
        return
    end

    local choco = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = "Chocobo",
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(choco)
            choco:setBehavior(bit.bor(choco:getBehavior(), xi.behavior.NO_DESPAWN))
            choco:setRoamFlags(xi.roamFlag.SCRIPTED)
            choco:setBaseSpeed(player:getSpeed())
            choco:setMobMod(xi.mobMod.NO_DESPAWN, 1)
            choco:setAutoAttackEnabled(false)
        end,

        onMobRoam = function(choco)
            xi.xispal.follow(player, choco)
            -- Cute animations
            if math.random(10) <= 2 and choco:getModelId() == 3031 then
                if math.random(2) == 1 then
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_10)
                else
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_00)
                end
            end

        end,

        onTrigger = function(player, choco)
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
                    print('??')
                    player:incrementCharVar('[XISP]chocoGrow', 1)
                    player:setCharVar('[XISP]chocoWait', VanadielUniqueDay() + 1)
                    chocogrow = player:getCharVar('[XISP]chocoGrow')

                    if chocogrow < 1 then
                        player:printToPlayer("Your chocobo seems a little nervous.", xi.msg.channel.SYSTEM_3, ' ')
                    elseif chocogrow < 3 then
                        player:printToPlayer("Your chocobo has begun to warm up to you.", xi.msg.channel.SYSTEM_3, ' ')
                    elseif chocogrow < 5 then
                        player:printToPlayer("Your chocobo refuses to leave your side.", xi.msg.channel.SYSTEM_3, ' ')
                    elseif chocogrow < 9 then
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
                elseif chocogrow < 5 then
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_30)
                elseif chocogrow < 9 then
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_20)
                    choco:independentAnimation(choco, 252, 4)
                else
                    choco:independentAnimation(choco, 251, 4)
                end
            end
        end,
        })

        choco:setSpawn(pos.x + 1, pos.y, pos.z - 1)
        choco:timer(500, function(chocoArg)
            choco:setAllegiance(1)
            chocoArg:spawn()
        end)
        player:setCharVar('[XISP]chocoID', choco:getID())
end




xi.xispal.onZone = function(player)
    xi.xispal.resetFollowers(player)

    player:timer(1000, function(playerArg)
        xi.xispal.spawnChocobo(playerArg)

        if playerArg:getCharVar('[XISP]quest1Var') >= 1 then
            if playerArg:getCharVar('[XISP]squireProg') < 7 then
                xi.xispal.spawnYoungSquire(playerArg)
            else
                xi.xispal.spawnSquire(playerArg)
            end
        end
    end)
end
