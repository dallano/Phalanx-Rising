xi = xi or {}
xi.xispal = xi.xispal or {}

--------------------------- Planning -----------------------------------------------------------------------
--- Squire: Player takes on squire. Squire interacts with player based
---         on mission progress. Dialogue to hint where player should go
---
--- Knight: The player is granted a knight certificate after defeating their first dragon. This certificate
---         grants the player to take on a knight into their party, and allows the player to choose which job
---         the knight is based on where they decide to recruit them from.
---
---         Sandoria: Dragoon     //   Paladin
---         Bastok:   Dark Knight //   Warrior
---         Windurst: Ranger      //   Monk
---         Norg:     Samurai     //   Ninja?
---
--- Mage:
---         Sandoria: White Mage
---         Windurst: Black Mage // Summoner (Would be sick and doable with a lot of hard work)
---
---
---
----------------------------------------------------------------------------------------------------------------

local BODY_OFFSET  = 0x1000
local HANDS_OFFSET = 0x2000
local LEGS_OFFSET  = 0x3000
local FEET_OFFSET  = 0x4000
local MAIN_OFFSET  = 0x5000
local SUB_OFFSET   = 0x6000
local RANGE_OFFSET = 0x7000

xi.xispal.generateModelID = function(face, race, tier, pal)
    local gearSets =
    {
        ["Squire"] = xi.xispal.squireGearSets[tier],
        ["Knight"] = xi.xispal.knightGearSets[tier],
        ["Mage"]   = xi.xispal.mageGearSets[tier],
    }

    local table = gearSets[pal]

    if tier > 16 then
        tier = 0
    end

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

    if player:getCharVar('[XISP]damageID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]damageID'))
    end

    if player:getCharVar('[XISP]chocoID') ~= 0 then
        table.insert(followers, player:getCharVar('[XISP]chocoID'))
    end

    return followers
end


-- Returns table of pals as entities. Discludes chocobo.
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
            pal:setBehavior(bit.band(pal:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
            DespawnMob(pal:getID())
            print("Successfully despawned pal: " .. pal:getPacketName())
        end
    end

    player:setCharVar('[XISP]squireID', 0)
    player:setCharVar('[XISP]knightID', 0)
    player:setCharVar('[XISP]mageID', 0)
    player:setCharVar('[XISP]damageID', 0)
    player:setCharVar('[XISP]chocoID', 0)
end


xi.xispal.resurrect = function(player)
    local party = xi.xispal.getParty(player)
    local pal

    for _, member in pairs(party) do
        if member and not member:isAlive() then
            pal = member
            break
        end
    end

    if pal and not pal:isAlive() then
        pal:independentAnimation(pal, 12, 4)

        pal:timer(6000, function(palArg)
            palArg:hideName(true)
            palArg:entityAnimationPacket('stnd')
        end)

        pal:timer(10000, function(palArg)
            palArg:hideName(false)
            palArg:resetAI()
            palArg:independentAnimation(palArg, 76, 4)
            palArg:setHP(palArg:getMaxHP() * 0.33)
            palArg:setMP(palArg:getMaxMP() * 0.33)
            palArg:setAnimation(0)
            pal:stun(10000)
        end)
    end
end


xi.xispal.raisePlayer = function(pal, player)
    local job = pal:getMainJob()
    local lvl = pal:getMainLvl()

    if pal:getLocalVar('isCasting') == 1 or player:hasRaiseTractorMenu() then
        return
    end

    if player and player:isDead() then
        pal:setLocalVar('isCasting', 1)
        local spell
        for _, raise in pairs(xi.xispal.white.RAISE) do
            if raise.lvl[job] and lvl >= raise.lvl[job] then
                spell = raise
            end
        end

        pal:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_START)
        pal:timer(spell.castTime, function(palArg)
            pal:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_STOP)
            palArg:independentAnimation(player, spell.spell, 0)
            player:sendRaise(spell.power)
            palArg:timer(20 * 1000, function(palArg2)
                palArg2:setLocalVar('isCasting', 0)
            end)
        end)
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


xi.xispal.follow = function(pal, player)
    -- Debug (If left unhooked with player, despawn pal)
    if not player or player:getZone() ~= pal:getZone() then
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
                -- If the target is dead or nil, fall back to player
                if not (leader and leader:isAlive()) then
                    leader = player
                end
            end

            follower:follow(leader, xi.followType.ROAM)
        end
    end
end


xi.xispal.isCaster = function(pal)
    local job = pal:getMainJob()
    return (job == xi.job.WHM or job == xi.job.BLM)
end


-- WIP until I'm able to figure out how to allow to change target flags
xi.xispal.checkRegen = function(pal, player, party, job, lvl)
    -- local spells = xi.xispal.white.REGEN
    -- local regen
    -- local target

    -- -- Find level appropriate regen
    -- for _, spell in pairs(spells) do
    --     if spell.lvl[job] and lvl >= spell.lvl[job] then
    --         regen = spell
    --     end
    -- end

    -- -- Cast on party member in need
    -- for _, member in pairs(party) do
    --     local hpp = member:getHPP()

    --     -- First ensure no party member is in dire need of cure
    --     if hpp < 50 then
    --         return
    --     end
    --     -- Otherwise proceed to find appropriate member within healthy HP range
    --     if
    --         hpp <= 95 and
    --         hpp >= 65 and
    --         not player:hasStatusEffect(regen.effect)
    --     then
    --         target = member
    --         break
    --     end
    -- end

    -- pal:castSpell(regen.spell, target)
end


xi.xispal.checkCure = function(pal, player, party, job, lvl)
    local spells = xi.xispal.white.CURE
    local cure

    for _, member in pairs(party) do
    end
end


xi.xispal.checkElemental = function(pal, target, player, job, lvl)
    local spells = xi.xispal.black.ELEMENTAL
end


-- Enfeeble casting will go through all possible spells to be cast, then
-- cast one at random from the needed list.
xi.xispal.checkEnfeeble = function(pal, target, player, job, lvl)
    local whiteSpells = xi.xispal.white.ENFEEBLE
    local blackSpells = xi.xispal.black.ENFEEBLE
end


xi.xispal.checkBuff = function(pal, player, party, job, lvl)
    local spells = xi.xispal.white.BUFF

    for _, member in pairs(party) do
    end
end


-- Priority of casting:
--  1: Regen
--  2: Cure
--  3: Buffs
--  4: Debuffs
--  5: Elemental
xi.xispal.checkMagic = function(pal, player)
    local party = xi.xispal.getParty(player)
    local job   = pal:getMainJob()
    local lvl   = pal:getMainLvl()

    table.insert(party, player)

    if
        job ~= xi.job.WHM and
        job ~= xi.job.RDM and
        job ~= xi.job.PLD and
        job ~= xi.job.BLM and
        job ~= xi.job.DRK
    then
        return
    end

    if pal:getCurrentAction() == xi.action.MAGIC_CASTING then
        return
    end

    -- Cure / Buff / Regen Section
    if job == xi.job.PLD or job == xi.job.WHM or job == xi.job.RDM then
        if job ~= xi.job.PLD then
            xi.xispal.checkRegen(pal, player, party, job, lvl)
        end

        xi.xispal.checkCure(pal, player, party, job, lvl)
        xi.xispal.checkBuff(pal, player, party, job, lvl)
    end

    -- Enfeeble / Elemental Section
    if pal:isEngaged() then
        local target = pal:getTarget()

        if job ~= xi.job.PLD then
            xi.xispal.checkEnfeeble(pal, target, player, job, lvl)
        end

        if job ~= xi.job.PLD and job ~= xi.job.WHM then
            xi.xispal.checkEnfeeble(pal, target, player, job, lvl)
        end
    end
end


xi.xispal.checkAbility = function(pal, player)
end


xi.xispal.checkWeaponSkill = function(pal, target, player)
end


xi.xispal.onMobSpawn = function(pal, player)
    pal:setMobLevel(player:getMainLvl())
    pal:setMobMod(xi.mobMod.NO_DESPAWN, 1)
    pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.NO_DESPAWN))
    pal:setRoamFlags(xi.roamFlag.SCRIPTED)

    if xi.xispal.isCaster(pal) then
        pal:setBehavior(bit.bor(pal:getBehavior(), xi.behavior.STANDBACK))
    end
end


xi.xispal.onMobRoam = function(pal, player)
    if player:isDead() then
        xi.xispal.raisePlayer(pal, player)
    else
        if not player or player:getZone() ~= pal:getZone() then
            if player:isAlive() then
                pal:setBehavior(bit.band(pal:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                pal:setMobMod(xi.mobMod.NO_DESPAWN, 0)
                DespawnMob(pal:getID())
            end
        else
            local anim = player:getAnimation()
            local pos  = player:getPos()
            pal:setSpawn(pos.x, pos.y, pos.z) -- Fixes pal attempting to path home

            xi.xispal.levelSync(pal, player)
            xi.xispal.follow(pal, player)
            xi.xispal.checkMagic(pal, player)

            -- Rest if not casting spells, low MP, and player is nearby
            if
                (xi.xispal.isCaster(pal) or pal:getMainJob() == xi.job.RDM) and
                pal:getMPP() < 90 and
                pal:checkDistance(player) < 20
            then
                pal:setAnimation(xi.animation.HEALING)
            else
                if anim > 0 then
                    pal:setAnimation(anim)
                else
                    if pal:getAnimation() ~= 0 then
                        pal:setAnimation(0)
                    end
                end
            end
        end
    end
end


xi.xispal.onMobEngage = function(pal, target, player)
end


xi.xispal.onMobFight = function(pal, target, player)
    xi.xispal.checkMagic(pal, player)
    xi.xispal.checkAbility(pal, player)
    xi.xispal.checkWeaponSkill(pal, target, player)
end


xi.xispal.onZone = function(player)
    xi.xispal.resetFollowers(player)

    -- Delay used in order to get access to player:getZone()
    player:timer(1000, function(playerArg)
        -- Spawn Chocobo
        if player:getCharVar('[XISP]hasChocobo') == 1 then
            xi.xispal.spawnChocobo(playerArg)
        end

        -- Spawn Squire
        if playerArg:getCharVar('[XISP]quest1Var') >= 1 then
            if playerArg:getCharVar('[XISP]squireProg') < 7 then
                xi.xispal.spawnYoungSquire(playerArg)
            else
                xi.xispal.spawnSquire(playerArg)
            end
        end

        -- Spawn Knight
        if playerArg:getCharVar('[XISP]hasKnight') >= 1 then
            xi.xispal.spawnKnight(playerArg)
        end

        -- Spawn Mage
        if playerArg:getCharVar('[XISP]hasMage') >= 1 then
            xi.xispal.spawnMage(playerArg)
        end
    end)
end
