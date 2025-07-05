-- Timeline of pal acquisition and stepping stones:
--      Initially a pal will scale and get better gear as the player does.
--      This will peak, and halt AFTER the player achieves full AF armor
--      Stage 1: Defeating a random HENM (King A - Squire, etc.)
--      Stage 2: Defeating a sky god (Random, Kirin included)
--      Stage 3: Defeating an HENM (Fafnir - Drg, etc.)
--      Stage 4: Defeating Ultima / Omega
--      Stage 5: Unlocking a relic
--
xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.spawnYoungSquire = function(player, zone)
    local look = xi.xispal.youngLook[player:getCharVar('[XISP]squireRace')]
    local pos  = player:getPos()

    if player:getCharVar('[XISP]quest1Var') ~= 1 then
        return
    end

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = xi.xispal.squireName[player:getCharVar('[XISP]squireName')],
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
            pal:setStatus(xi.status.NORMAL)
            xi.xispal.onMobSpawn(pal, player, 1, 1)
            pal:setAutoAttackEnabled(false)
            pal:setUnkillable(true)
        end,

        onMobRoam = function(pal)
            xi.xispal.follow(pal, player)
            xi.xispal.idleYoungSquireChat(pal, player)

            if not player:isAlive() then
                DespawnMob(pal:getID())
            end
        end,
    })

    player:setCharVar('[XISP]squireID', pal:getID())
    pal:setSpawn(pos.x - 1, pos.y, pos.z)
    pal:spawn()
end

xi.xispal.spawnChocobo = function(player, zone)
    local look = 86 -- Default yellow chocobo
    local pos  = player:getPos()
    local name = "Chocobo"

    if player:getCharVar('[XISP]chocoGrow') < 10 then
        name = "Baby Chocobo"
        look = 3031 -- Baby Chocobo
    end

    -- Alternatively check for zones we don't want chocobo in
    if
        player:getStatusEffect(xi.effect.MOUNTED) ~= nil or
        (look == 86 and zone:getTypeMask() ~= xi.zoneType.OUTDOORS)
    then
        return
    end


    local choco = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        -- allegiance            = xi.allegiance.PLAYER,
        name                  = name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = 0 + math.random(0, 360),
        look                  = look,
        groupId               = 1016,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onTrigger = function(player, choco)
            xi.xispal.chocoboTrigger(player, choco)
        end,

        onMobSpawn = function(choco)
            xi.xispal.onMobSpawn(choco, player, 1, 1)
            choco:setStatus(xi.status.NORMAL)
            choco:setAutoAttackEnabled(false)
            choco:setUnkillable(true)
            choco:setLocalVar('isChoco', 1)
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
    choco:spawn()
end

xi.xispal.spawnSquire = function(player, zone)
    local face = player:getCharVar('[XISP]squireFace')
    local race = player:getCharVar('[XISP]squireRace')
    local lvl  = player:getMainLvl()
    local tier = 0

    if xi.xispal.hasCompletedAF(player) and lvl >= 60 then
        tier = 4
    elseif lvl >= 40 then
        tier = 3
    elseif lvl >= 30 then
        tier = 2
    elseif lvl >= 20 then
        tier = 1
    end

    local look = xi.xispal.generateModelID(xi.xispal.face[face], xi.xispal.race[race], xi.xispal.squireGearSets[tier])

    local pos  = player:getPos()

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = xi.xispal.squireName[player:getCharVar('[XISP]squireName')],
        x                     = pos.x + 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = xi.xispal.groupID[race],
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            pal:setLocalVar('spawnTime', os.time())
            xi.xispal.onMobSpawn(pal, player, race, pal:getMainJob())
            player:setCharVar('[XISP]squireIdleChat', os.time() + math.random(25, 45))
            pal:setLocalVar('isSquire', 1)
        end,

        onMobRoam = function(pal)
            xi.xispal.onMobRoam(pal, player)
            xi.xispal.idleSquireChat(pal, player)
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

        onbMobDespawn = function(pal)
            print(pal:getLocalVar('spawnTime') - os.time())
        end,
    })

    player:setCharVar('[XISP]squireID', pal:getID())
    pal:setSpawn(pos.x + 1, pos.y, pos.z)
    pal:spawn()
end

xi.xispal.spawnKnight = function(player, zone)
    local tier = 0
    local lvl  = player:getMainLvl()

    if xi.xispal.hasCompletedAF(player) and lvl >= 60 then
        tier = 2
    elseif lvl >= 50 then
        tier = 1
    end

    local table = xi.xispal.palInfo[player:getCharVar('[XISP]knightJob')]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.knightGearSets[table.job][tier])
    local pos   = player:getPos()

    -- Don't spawn in zones where their NPC is stationed.
    if zone:getID() == table.zone then
        return
    end

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = table.name,
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z + 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = table.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            pal:changeJob(table.job)
            xi.xispal.onMobSpawn(pal, player, table.race, table.job)
            pal:setLocalVar('isKnight', 1)
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
    pal:setSpawn(pos.x - 1, pos.y, pos.z - 1)
    pal:spawn()
end

xi.xispal.spawnMage = function(player, zone)
    local table = xi.xispal.palInfo[player:getCharVar('[XISP]mageJob')]
    local look  = xi.xispal.generateModelID(xi.xispal.face[table.face], xi.xispal.race[table.race], xi.xispal.mageGearSets[table.job])
    local pos   = player:getPos()

    -- Don't spawn in zones where their NPC is stationed.
    if zone:getID() == table.zone then
        return
    end

    local pal = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = table.name,
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z - 1,
        rotation              = pos.rotation,
        look                  = look,
        groupId               = table.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(pal)
            pal:changeJob(table.job)
            xi.xispal.onMobSpawn(pal, player, table.race, table.job)
            pal:setAutoAttackEnabled(false)
            pal:setLocalVar('isMage', 1)
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

    player:setCharVar('[XISP]mageID', pal:getID())
    pal:setSpawn(pos.x - 1, pos.y, pos.z + 1)
    pal:spawn()
end

xi.xispal.spawnWyvern = function(pal)
    local zone = pal:getZone()
    local pos  = pal:getPos()

    local healingBreath = function(wyvern)
        local master = wyvern:getMaster()
        local lvl    = master:getMainLvl()
        local hpp    = master:getHPP()
        local skill  = 621 -- Healing Breath
        local healAmount = 80

        if master and master:isAlive() and hpp < 50 and wyvern:getLocalVar('breathCooldown') < os.time() then
            wyvern:setLocalVar('breathCooldown', os.time() + 20)

            if lvl >= 40 then
                skill = 623
                healAmount = 250
            elseif lvl >= 20 then
                skill = 622
                healAmount = 150
            end

            healAmount = healAmount + lvl * 0.9

            wyvern:independentAnimation(master, skill, xi.animMode.ENEMY_SKILL)
            xi.mobskills.mobHealMove(master, healAmount)
        end
    end

    local wyvern = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = "Tatang",
        x                     = pos.x - 1,
        y                     = pos.y,
        z                     = pos.z - 1,
        rotation              = pos.rotation,
        look                  = 761,
        groupId               = 1016,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(wyvern)
            wyvern:setMobLevel(wyvern:getMaster():getMainLvl() - 2)
            wyvern:addMobMod(xi.mobMod.NO_DESPAWN, 1)
        end,

        onMobRoam = function(wyvern)
            healingBreath(wyvern)
        end,

        onMobFight = function(wyvern, target)
            healingBreath(wyvern)
        end,
    })
    return wyvern
end

xi.xispal.spawnAvatar = function(pal, player)
    local avatarToSummon = {}
    local avatarData =
    {
        { name = "Carbuncle", look = 16, quest = { xi.questLog.WINDURST,    xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW }, spell = 296, skillID = 2031, },
        { name = "Fenrir",    look = 17, quest = { xi.questLog.WINDURST,    xi.quest.id.windurst.THE_MOONLIT_PATH },     spell = 297, skillID = 325,  },
        { name = "Ifrit",     look = 18, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_FIRE },        spell = 298, skillID = 2013, },
        { name = "Titan",     look = 19, quest = { xi.questLog.BASTOK,      xi.quest.id.bastok.TRIAL_BY_EARTH },         spell = 299, skillID = 2029, },
        { name = "Leviathan", look = 20, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_WATER },       spell = 300, skillID = 2028, },
        { name = "Garuda",    look = 21, quest = { xi.questLog.OUTLANDS,    xi.quest.id.outlands.TRIAL_BY_WIND },        spell = 301, skillID = 2026, },
        { name = "Shiva",     look = 22, quest = { xi.questLog.SANDORIA,    xi.quest.id.sandoria.TRIAL_BY_ICE },         spell = 302, skillID = 2025, },
        { name = "Ramuh",     look = 23, quest = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING }, spell = 303, skillID = 2027, },
    }
    local zone  = pal:getZone()
    local pos   = pal:getPos()
    local summon = nil

    -- Build table of possible summons
    for i, sum in pairs(avatarData) do
        if
            player:hasCompletedQuest(sum.quest[1], sum.quest[2]) or
            player:hasSpell(sum.spell) or
            i == 1 -- Always include Carbuncle
        then
            table.insert(avatarToSummon, sum)
        end
    end
    -- Select one at random
    summon = avatarToSummon[math.random(1, #avatarToSummon)]

    local avatar = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = summon.name,
        x                     = pos.x + math.random(1, 2),
        y                     = pos.y,
        z                     = pos.z + math.random(1, 2),
        rotation              = pos.rotation,
        look                  = summon.look,
        groupId               = 1015,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,

        onMobSpawn = function(avatar)
            avatar:setStatus(xi.status.NORMAL)
            avatar:setMobLevel(player:getMainLvl() - 2)
            avatar:setMobMod(xi.mobMod.SKILL_LIST, summon.skillID)
            avatar:setMod(xi.mod.REGAIN, 100) -- Could use rebalancing

            avatar:timer(5000, function(avatarArg)
                avatarArg:setTP(3000) -- Use ability right out of the gates
            end)

        end,

        onMobWeaponSkillPrepare = function(avatar, target)
            local master = avatar:getMaster()
            if master then
                master:independentAnimation(master, 94, 2)
            end
        end,
    })

    return avatar
end
