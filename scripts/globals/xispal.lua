xi = xi or {}
xi.xispal = xi.xispal or {}

--------------------------- Planning -----------------------------------------------------------------------
--- Squire: Player takes on squire. Squire interacts with player based
---         on mission progress. Dialogue to hint where player should go
---
--- Knight:
---         Sandoria: Dragoon     (behavior: unfinished)
---         Bastok:   Dark Knight (behavior: unfinished)
---         Windurst: Monk        (behavior: unfinished)
---         Norg:     Samurai     (behavior: unfinished) -- Dialogue could use love
---         Jeuno:    Paladin     (behavior: unfinished)
---
--- Mage:
---         Sandoria: White Mage (DONE)
---         Windurst: Black Mage (behavior: unfinished)
---         Bastok:   Summoner   (DONE)
---         Kazham:   Ninja      (DONE)
---         Bard:     Jeuno      (behavior: unfinished)
---
---
--- Mods that may come in handy:
---     HP_HEAL, CLEAR_MIND, MP_HEAL - Used in resting
----------------------------------------------------------------------------------------------------------------

local BODY_OFFSET  = 0x1000
local HANDS_OFFSET = 0x2000
local LEGS_OFFSET  = 0x3000
local FEET_OFFSET  = 0x4000
local MAIN_OFFSET  = 0x5000
local SUB_OFFSET   = 0x6000
local RANGE_OFFSET = 0x7000

xi.xispal.generateModelID = function(face, race, table)
    local modelID = "0x0100"

    -- Look
    modelID = modelID .. face
    modelID = modelID .. race
    modelID = modelID .. "00"

    -- Equipment
    modelID = modelID .. string.format("%04X", BODY_OFFSET + table.body)
    modelID = modelID .. string.format("%04X", HANDS_OFFSET + table.hands)
    modelID = modelID .. string.format("%04X", LEGS_OFFSET + table.legs)
    modelID = modelID .. string.format("%04X", FEET_OFFSET + table.feet)
    modelID = modelID .. string.format("%04X", MAIN_OFFSET + table.main)
    modelID = modelID .. string.format("%04X", SUB_OFFSET + table.sub)
    modelID = modelID .. string.format("%04X", RANGE_OFFSET)

    modelID = modelID .. "80"

    return modelID
end


-- Returns a table of IDs of all possible followers
xi.xispal.getFollowers = function(player)
    local followers = {}

    if player:getCharVar('[XISP]squireID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]squireID'))
    end

    if player:getCharVar('[XISP]knightID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]knightID'))
    end

    if player:getCharVar('[XISP]mageID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]mageID'))
    end

    if player:getCharVar('[XISP]chocoID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]chocoID'))
    end

    return followers
end

xi.xispal.setKnight = function(player, table)
    DespawnMob(player:getCharVar('[XISP]knightID')) -- Remove old one if any
    player:setCharVar('[XISP]hasKnight', 1)
    player:setCharVar('[XISP]knightFace', table.face)
    player:setCharVar('[XISP]knightRace', table.race)
    player:setCharVar('[XISP]knightJob', table.job)
end

xi.xispal.removeKnight = function(player)
    player:setCharVar('[XISP]hasKnight', 0)
    player:setCharVar('[XISP]knightFace', 0)
    player:setCharVar('[XISP]knightRace', 0)
    player:setCharVar('[XISP]knightJob', 0)
    DespawnMob(player:getCharVar('[XISP]knightID'))
end

xi.xispal.setMage = function(player, table)
    DespawnMob(player:getCharVar('[XISP]mageID')) -- Remove old one if any
    player:setCharVar('[XISP]hasMage', 1)
    player:setCharVar('[XISP]mageFace', table.face)
    player:setCharVar('[XISP]mageRace', table.race)
    player:setCharVar('[XISP]mageJob', table.job)
end

xi.xispal.removeMage = function(player)
    DespawnMob(player:getCharVar('[XISP]mageID'))
    player:setCharVar('[XISP]hasMage', 0)
    player:setCharVar('[XISP]mageFace', 0)
    player:setCharVar('[XISP]mageRace', 0)
    player:setCharVar('[XISP]mageJob', 0)
end

-- Returns table of pals as entities. Disclude chocobo.
xi.xispal.getParty = function(player)
    local party = {}

    if player:getCharVar('[XISP]squireID') ~= 0 then
        table.insert(party, GetMobByID(player:getCharVar('[XISP]squireID')))
    end

    if player:getCharVar('[XISP]knightID') ~= 0 then
        table.insert(party, GetMobByID(player:getCharVar('[XISP]knightID')))
    end

    if player:getCharVar('[XISP]mageID') ~= 0 then
        table.insert(party, GetMobByID(player:getCharVar('[XISP]mageID')))
    end

    return party
end


xi.xispal.resetFollowers = function(player)
    local party = xi.xispal.getFollowers(player)

    print("Resetting xispal followers:")
    for _, member in pairs(party) do
        local pal = GetMobByID(member)

        if pal and pal:isSpawned() then
            -- Store HP values / alive dead here
            pal:setBehavior(bit.band(pal:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
            DespawnMob(pal:getID())

            if pal:getPet() then
                DespawnMob(pal:getPet():getID())
                print("Successfully despawned pet: " .. pal:getPacketName())
            end

            print("Successfully despawned pal: " .. pal:getPacketName())
        end
    end

    player:setCharVar('[XISP]squireID', 0)
    player:setCharVar('[XISP]knightID', 0)
    player:setCharVar('[XISP]mageID', 0)
    player:setCharVar('[XISP]chocoID', 0)
end


xi.xispal.updateFollowers = function(player)
    player:timer(5000, function(playerArg)
        for _, member in pairs(xi.xispal.getParty(player)) do
            member:independentAnimation(member, 2, 3)
        end
    end)
end


xi.xispal.resurrect = function(player)
    local pal

    for _, member in pairs(xi.xispal.getParty(player)) do
        if member and not member:isAlive() then
            pal = member
            break
        end
    end

    if pal and not pal:isAlive() then
        pal:independentAnimation(pal, 12, 4)

        pal:timer(6000, function(palArg)
            palArg:hideName(true)
            palArg:entityAnimationPacket(xi.animationString.EFFECT_RAISE_PLAYER)
        end)

        pal:timer(10000, function(palArg)
            palArg:hideName(false)
            palArg:resetAI()
            palArg:independentAnimation(palArg, 2, 3)
            palArg:setHP(palArg:getMaxHP() * 0.33)
            palArg:setMP(palArg:getMaxMP() * 0.33)
            palArg:setAnimation(0)
            palArg:stun(4000)
        end)
    end
end


xi.xispal.raisePlayer = function(pal, player)
    local job = pal:getMainJob()
    local lvl = pal:getMainLvl()

    if
        pal:getLocalVar('isCasting') == 1 or
        player:hasRaiseTractorMenu() or
        pal:getCurrentAction() == xi.action.MAGIC_CASTING
    then
        return
    end

    if pal:hasStatusEffect(xi.effect.HEALING) then
        pal:delStatusEffect(xi.effect.HEALING)
        return
    end

    if player and player:isDead() and pal:getMP() > 150 then
        pal:setLocalVar('isCasting', 1)
        pal:setAnimation(0)

        local spell = nil
        for _, raise in pairs(xi.xispal.white.RAISE) do
            if raise.lvl[job] and lvl >= raise.lvl[job] then
                spell = raise
            end
        end

        if spell and pal:checkDistance(player) <= 20 then
            pal:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_START)
            pal:timer(spell.castTime, function(palArg)
                palArg:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_STOP)
                palArg:independentAnimation(player, spell.spell, 0)

                player:sendRaise(spell.power)
                palArg:setMP(palArg:getMP() - 150)

                palArg:timer(20 * 1000, function(palArg2)
                    palArg2:setLocalVar('isCasting', 0)
                end)
            end)
        end
    end
end


xi.xispal.levelSync = function(pal, player)
    -- Ensure we're the same level as player
    if player:getMainLvl() ~= pal:getMainLvl() then
        pal:setMobLevel(player:getMainLvl())
    end

    -- Add to battlefield i player is in one.
    local effect = player:getStatusEffect(xi.effect.BATTLEFIELD)
    if effect then
        pal:addStatusEffect(effect)
    end
end


xi.xispal.hasCompletedAF = function(player)
    for _, quest in pairs(xi.xispal.afQuests) do
        if player:hasCompletedQuest(quest[1], quest[2]) then
            return true
        end
    end
    return false
end


xi.xispal.follow = function(pal, player)
    local followers = xi.xispal.getFollowers(player)

    for followerIndex = #followers, 1, -1 do
        if followers[followerIndex] > 0 then
            local follower = GetMobByID(followers[followerIndex])

            -- Only check for ourselves.
            if follower and follower == pal then
                local leader

                -- If this is the first follower, leader is the player
                if followerIndex == 1 then
                    leader = player
                else
                    leader = GetMobByID(followers[followerIndex - 1])

                    -- If the target is dead, nil or resting, fall back to player
                    if leader then
                        if
                            not leader:isAlive() or
                            leader:hasStatusEffect(xi.effect.HEALING) or
                            leader:getCurrentAction() == xi.action.MAGIC_CASTING
                        then
                            leader = player
                        end
                    end
                end

                -- Don't pursue leader if we're healing. Will adjust if player goes above 15 yalms
                if
                    not follower:hasStatusEffect(xi.effect.HEALING) and
                    follower:getCurrentAction() ~= xi.action.MAGIC_CASTING and
                    leader
                then
                    follower:follow(leader, xi.followType.ROAM)
                else
                    follower:unfollow()
                end
            end
        end
    end
end


xi.xispal.isCaster = function(pal)
    local job = pal:getMainJob()

    if not pal:isPC() then
        return (job == xi.job.WHM or job == xi.job.BLM or job == xi.job.SMN or job == xi.job.BRD or job == xi.job.NIN)
    end
end


xi.xispal.checkAbility = function(pal, player)
end


xi.xispal.checkWeaponSkill = function(pal, target, player)
end


-- A pal should be told to stop resting before any action is called upon them
-- This can be readily used with xi.xispal.stopResting(pal)
-- After a pal stops resting, they will be unable to do so for another 5 seconds
-- Some logic is handled in healing.lua + xi.xispal.follow
xi.xispal.rest = function(pal, player, palID)
    if
        (pal:getHP() >= pal:getMaxHP() and pal:getMP() >= pal:getMaxMP()) or
        pal:getLocalVar('[XISP]canRest') > os.time() or
        pal:getCurrentAction() ~= xi.action.ROAMING or
        pal:checkDistance(player) >= 15 or
        pal:getAnimation() == 5 -- Mounted Chocobo
    then
        -- Delete healing if any of these conditions are met
        if pal:getStatusEffect(xi.effect.HEALING) then
            pal:delStatusEffectSilent(xi.effect.HEALING)
        end
        return
    end

    if not pal:hasStatusEffect(xi.effect.HEALING) then
        pal:addStatusEffect(xi.effect.HEALING, 0, 10, 0, 0)
    end
end


-- This should be checked before casting spells to ensure not casting while resting
xi.xispal.stopResting = function(pal)
    if pal:getStatusEffect(xi.effect.HEALING) then
        pal:delStatusEffectSilent(xi.effect.HEALING)
        return true
    else
        return false
    end
end


xi.xispal.calculateStats = function(pal, race, job)
    local raceTable = xi.xispal.statInfo.RACE[race]
    local jobTable  = xi.xispal.statInfo.JOB[job]
    local lvl = pal:getMainLvl()

    local raceHP = raceTable.HPbase + ((lvl - 1) * raceTable.HPgrowth)
    local jobHP  = jobTable.HPbase + ((lvl - 1) * jobTable.HPbase)

    local raceMP = raceTable.MPbase + ((lvl - 1) * raceTable.MPgrowth)
    local jobMP  = jobTable.MPbase + ((lvl - 1) * jobTable.MPbase)

    pal:setMaxHP(math.floor(raceHP + jobHP))
    pal:setMaxMP(math.floor(raceMP + jobMP))
end


xi.xispal.checkPet = function(pal, player)
    local job = pal:getMainJob()
    local pos = pal:getPos()

    if job ~= xi.job.DRG and job ~= xi.job.SMN then
        return
    end

    if pal:getLocalVar('[XISP]spellRecast') > os.time() then
        return
    end

    if job == xi.job.DRG then
        if
            pal:getLocalVar('petSummon') < os.time() and
            pal:getPet() == nil
        then
            pal:setLocalVar('petSummon', os.time() + 900)
            local wyvern = xi.xispal.spawnWyvern(pal)

            wyvern:setSpawn(pos.x + 1, pos.y, pos.z)
            pal:setPet(wyvern)
            pal:spawnPet()
            pal:independentAnimation(pal, 94, 2)
        end
    end

    if job == xi.job.SMN then
        if
            pal:getLocalVar('petSummon') < os.time() and
            pal:isEngaged() and
            pal:getPet() == nil
        then
            pal:setLocalVar('petSummon', os.time() + 60)
            pal:entityAnimationPacket(xi.animationString.CAST_SUMMONER_START)

            pal:timer(5000, function(palArg)
                local avatar = xi.xispal.spawnAvatar(pal, player)

                if avatar then
                    avatar:setSpawn(pos.x + math.random(1, 2), pos.y, pos.z + math.random(1, 2))
                    palArg:entityAnimationPacket(xi.animationString.CAST_SUMMONER_STOP)
                    palArg:setPet(avatar)
                    palArg:spawnPet()
                end
            end)

        elseif not pal:isEngaged() and pal:getPet() then
            pal:timer(2000, function(palArg)
                if palArg:getPet():isAlive() then
                    palArg:independentAnimation(palArg, 94, 2)
                    palArg:getPet():setHP(0)
                end
            end)
        end
    end
end


xi.xispal.onMobSpawn = function(pal, player, race, job)
    pal:setLocalVar('[XISP]spellRecast', os.time() + math.random(7, 12))
    xi.xispal.calculateStats(pal, race, job)
    pal:setMobLevel(player:getMainLvl())

    if xi.xispal.isCaster(pal) then
        pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.STANDBACK))
        pal:setAutoAttackEnabled(false)
    end

    -- Update Model
    pal:timer(400, function(palArg)
        player:sendEntityUpdateToPlayer(pal, xi.entityUpdate.ENTITY_SPAWN, xi.updateType.UPDATE_LOOK)
        palArg:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1)
        palArg:setMobMod(xi.mobMod.NO_DESPAWN, 1)
        palArg:setMobMod(xi.mobMod.NO_REST, 1)
        palArg:setMobMod(xi.mobMod.IDLE_DESPAWN, 9999)
        palArg:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
        palArg:setMobMod(xi.mobMod.ROAM_COOL, 0)
        palArg:setLocalVar('[XISP]isPal', 1)
    end)
end


xi.xispal.onMobRoam = function(pal, player)
    if player:isDead() then
        xi.xispal.raisePlayer(pal, player)
    else
        if player then
            local anim = player:getAnimation()

            if player:isEngaged() then
                pal:setAnimation(0)
                pal:updateEnmity(player:getTarget())
                return
            end

            -- Update movement speed after force stop from spell cast
            if pal:getBaseSpeed() == 0 and pal:getCurrentAction() ~= xi.action.MAGIC_CASTING then
                pal:setBaseSpeed(player:getBaseSpeed())
            end

            xi.xispal.rest(pal, player)
            xi.xispal.follow(pal, player) -- Rest logic is needed in follow
            xi.xispal.checkMagic(pal, player)
            xi.xispal.levelSync(pal, player)
            xi.xispal.checkPet(pal, player)

            if pal:getStatusEffect(xi.effect.HEALING) == nil then
                if anim > 0 and anim ~= 33 then -- Resting is handled in xi.xispal.rest
                    pal:setAnimation(anim)
                else
                    pal:setAnimation(0)
                end
            end
        end
    end
end


xi.xispal.onMobEngage = function(pal, target, player)
end


xi.xispal.onMobFight = function(pal, target, player)
    if
        target:hasStatusEffect(xi.effect.SLEEP_I) or
        target:hasStatusEffect(xi.effect.BIND) or
        target:hasStatusEffect(xi.effect.LULLABY) or
        target:hasStatusEffect(xi.effect.SLEEP_II)
    then
        pal:disengage()
        return
    end

    xi.xispal.checkMagic(pal, player)
    xi.xispal.checkAbility(pal, player)
    xi.xispal.checkWeaponSkill(pal, target, player)
    xi.xispal.checkPet(pal, player)
end


xi.xispal.onMobDeath = function(pal, player)
    pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.NO_DESPAWN))
end


xi.xispal.onZone = function(player)
    xi.xispal.resetFollowers(player)

    -- Delay used in order to get access to player:getZone()
    player:timer(200, function(playerArg)
        local zone = playerArg:getZone()
        -- Spawn Chocobo
        if playerArg:getCharVar('[XISP]hasChocobo') == 1 then
            xi.xispal.spawnChocobo(playerArg, zone)
        end

        -- Spawn Squire
        if playerArg:getCharVar('[XISP]quest1Var') >= 1 then
            if playerArg:getCharVar('[XISP]squireProg') < 7 then
                xi.xispal.spawnYoungSquire(playerArg, zone)
            else
                xi.xispal.spawnSquire(playerArg, zone)
            end
        end

        -- Spawn Knight
        if playerArg:getCharVar('[XISP]hasKnight') >= 1 then
            xi.xispal.spawnKnight(playerArg, zone)
        end

        -- Spawn Mage
        if playerArg:getCharVar('[XISP]hasMage') >= 1 then
            xi.xispal.spawnMage(playerArg, zone)
        end
    end)
end
