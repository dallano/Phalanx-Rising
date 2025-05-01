xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.spawnYoungSquire = function(player)
    local look = xi.xispal.youngLook[player:getCharVar('[XISP]squireRace')]
    local zone = player:getZone()
    local pos  = player:getPos()

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
            if xi.xispal.youngSquireTrade(player, pal) then
                xi.xispal.youngSquireChat(player, pal)
            end
        end,

        onMobSpawn = function(pal)
            xi.xispal.onMobSpawn(pal, player)
        end,

        onMobRoam = function(pal)
            xi.xispal.follow(pal, player)

            if player:isEngaged() and pal:getLocalVar('engageChat') == 0 then
                player:printToPlayer("Go get 'em, Master " .. player:getName() .. "!", xi.msg.channel.PARTY, pal:getPacketName())
                pal:setLocalVar('engageChat', 1)
            elseif not player:isEngaged() then
                pal:setLocalVar('engageChat', 0)
            end
        end,

        onMobDeath = function(pal, player, optParams)
            -- Do stuff
        end,
    })

    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    pal:timer(500, function(palArg)
        palArg:spawn()
    end)

    player:setCharVar('[XISP]squireID', pal:getID())
end

xi.xispal.spawnChocobo = function(player)
    local look = 86 -- Default yellow chocobo
    local zone = player:getZone()
    local pos  = player:getPos()
    local name = "Chocobo"

    if player:getCharVar('[XISP]chocoGrow') < 10 then
        name = "Baby Chocobo"
        look = 3031 -- Baby Chocobo
    end

    -- Only adults spawn outdoors
    if look == 86 and zone:getTypeMask() ~= xi.zoneType.OUTDOORS then
        return
    end

    local choco = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1004,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onTrigger = function(player, choco)
            xi.xispal.chocoboTrigger(player, choco)
        end,

        onMobSpawn = function(choco)
            choco:setBehavior(bit.bor(choco:getBehavior(), xi.behavior.STANDBACK))
            xi.xispal.onMobSpawn(choco, player)
            choco:setAutoAttackEnabled(false)
        end,

        onMobRoam = function(choco)
            xi.xispal.follow(choco, player)
            -- Cute animations
            if math.random(10) <= 2 and choco:getModelId() == 3031 then
                if math.random(2) == 1 then
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_10)
                else
                    choco:entityAnimationPacket(xi.animationString.SPECIAL_00)
                end
            end

        end,
        })

    player:setCharVar('[XISP]chocoID', choco:getID())
    choco:setSpawn(pos.x + 1, pos.y, pos.z - 1)

    choco:timer(500, function(chocoArg)
        chocoArg:spawn()
    end)
end

xi.xispal.spawnSquire = function(player)
    local face = player:getCharVar('[XISP]squireFace')
    local race = player:getCharVar('[XISP]squireRace')
    local look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], player:getCharVar('[XISP]squireTier'), 'Squire')

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
            xi.xispal.onMobSpawn(pal, player)
            -- pal:changeJob(xi.job.RDM)
        end,

        onMobRoam = function(pal)
            xi.xispal.onMobRoam(pal, player)
        end,

        onMobEngage = function(pal, target)
            xi.xispal.onMobEngage(pal, target, player)
        end,

        onMobFight = function(pal, target)
            xi.xispal.onMobFight(pal, target, player)
        end,

        onMobDeath = function(pal, player, optParams)
            -- Do stuff
        end,
    })

    player:setCharVar('[XISP]squireID', pal:getID())
    pal:setSpawn(pos.x - 1, pos.y, pos.z)

    pal:timer(500, function(palArg)
        palArg:spawn()
    end)

end

xi.xispal.spawnKnight = function(player)
    local face = player:getCharVar('[XISP]knightFace')
    local race = player:getCharVar('[XISP]knightRace')
    local look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], player:getCharVar('[XISP]knightTier'), 'Knight')

    local zone = player:getZone()
    local pos  = player:getPos()

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = xi.xispal.name[player:getCharVar('[XISP]knightName')],
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            xi.xispal.onMobSpawn(pal, player)
            pal:changeJob(player:getCharVar('[XISP]knightJob'))
        end,

        onMobRoam = function(pal)
            xi.xispal.onMobRoam(pal, player)
        end,

        onMobEngage = function(pal, target)
            xi.xispal.onMobEngage(pal, target, player)
        end,

        onMobFight = function(pal, target)
            xi.xispal.onMobFight(pal, target, player)
        end,

        onMobDeath = function(pal, player, optParams)
            xi.xispal.onMobDeath(pal, player)
        end,
    })

    player:setCharVar('[XISP]knightID', pal:getID())
    pal:setSpawn(pos.x - 1, pos.y, pos.z)

    pal:timer(500, function(palArg)
        palArg:spawn()
    end)
end

xi.xispal.spawnMage = function(player)
    local face = player:getCharVar('[XISP]mageFace')
    local race = player:getCharVar('[XISP]mageRace')
    local look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], player:getCharVar('[XISP]mageTier'), 'Mage')

    local zone = player:getZone()
    local pos  = player:getPos()

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = xi.xispal.name[player:getCharVar('[XISP]mageName')],
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z - 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = 1000,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            xi.xispal.onMobSpawn(pal, player)
            -- pal:changeJob(player:getCharVar('[XISP]mageJob'))
        end,

        onMobRoam = function(pal)
            xi.xispal.onMobRoam(pal, player)
        end,

        onMobEngage = function(pal, target)
            xi.xispal.onMobEngage(pal, target, player)
        end,

        onMobFight = function(pal, target)
            xi.xispal.onMobFight(pal, target, player)
        end,

        onMobDeath = function(pal, player, optParams)
            xi.xispal.onMobDeath(pal, player)
        end,
    })

    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    player:setCharVar('[XISP]mageID', pal:getID())

    pal:timer(500, function(palArg)
        palArg:spawn()
    end)
end
