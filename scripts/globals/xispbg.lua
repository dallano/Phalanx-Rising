xi = xi or {}
xi.xispbg = xi.xispbg or {}

xi.xispbg.handleLoot = function(zone, level, player)
    lootPool = {}

    -- Typical Loot
    for i, group in ipairs(xi.xispbg.lootTables[level]) do
        if math.random(1, 100) <= group.CHANCE then
            local item = group[1][math.random(1, #group[1])]
            table.insert(lootPool, item)
        end
    end

    -- Zone specific Loot
    for _, specialGroup in ipairs(xi.xispbg.zoneInfo[zone:getID()].SPECIAL_LOOT) do
        if math.random(1, 100) <= specialGroup.CHANCE then
            local item = specialGroup[1][math.random(1, #specialGroup[1])]
            if not player:hasItem(item) then
                table.insert(lootPool, item)
            end
        end
    end

    -- If no item, give gil instead
    if #lootPool > 0 then
        flag = false
        for _, item in pairs(lootPool) do
            player:addTreasure(item)
        end
    else
        npcUtil.giveCurrency(player, 'gil', math.random(100, 150) * (level - 5))
        -- 30% chance for EXP as well
        if math.random(1, 10) <= 3 then
            player:addExp(math.random(40, 75) * (level - 10))
        end
    end
end


xi.xispbg.spawnChest = function(zone, level, pos, player)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 1, 4)

    local chest = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Treasure Chest",
        x = posX,
        y = pos.y,
        z = posZ,
        rotation = pos.rotation,
        look = xi.xispbg.models.CHEST,

        onTrigger = function(player, chest)
            if chest:getLocalVar('isOpen') == 0 then
                -- Check if mobs are still alive
                for _, variables in pairs(chest:getLocalVars()) do
                    mobID = chest:getLocalVar(variables.varname)
                    if
                        mobID > 100 and -- Filter out unrelated variables
                        GetMobByID(mobID) ~= nil and
                        GetMobByID(mobID):isAlive()
                    then
                        player:printToPlayer("There are still monsters about!", xi.msg.channel.NS_SAY, "")
                        return
                    end
                end

                chest:setLocalVar('isOpen', 1)
                chest:entityAnimationPacket(xi.animationString.OPEN_CRATE_GLOW)
                xi.xispbg.handleLoot(zone, level, player)
            end
        end,
    })
    chest:setStatus(xi.status.NORMAL)
    chest:setLocalVar('[XISP]bgFlag', 1)
    return chest
end


xi.xispbg.spawnTorch = function(zone, pos)
    local torch = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = xi.xispbg.models.TORCH,
        namevis = false,
    })
    torch:setStatus(xi.status.NORMAL)
    torch:setLocalVar('[XISP]bgFlag', 1)
    torch:setUntargetable(true)
    torch:setAlwaysRender(true)
end


xi.xispbg.spawnBanner = function(zone, pos)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 6, 8)

    local banner = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = posX,
        y = pos.y,
        z = posZ,
        rotation = math.random(0, 249),
        look = xi.xispbg.models.BANNER,
        namevis = false,
    })
    banner:setStatus(xi.status.NORMAL)
    banner:setLocalVar('[XISP]bgFlag', 1)
    banner:setUntargetable(true)
    banner:setAlwaysRender(true)
end


xi.xispbg.spawnCampfire = function(zone, pos)
    local campfire = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = math.random(0, 249),
        look = xi.xispbg.models.CAMMPFIRE,
        namevis = false,
    })
    campfire:setStatus(xi.status.NORMAL)
    campfire:setLocalVar('[XISP]bgFlag', 1)
    campfire:setUntargetable(true)
    campfire:setAlwaysRender(true)
end


xi.xispbg.spawnCamp = function(zone, level, pos)
    -- Spawn Decorations
    xi.xispbg.spawnCampfire(zone, pos)
    xi.xispbg.spawnBanner(zone, pos)

    -- Generate Torches in a guaranteed circle around camp
    local newPos = { x = 0, y = 0, z = 0, }
    newPos.y = pos.y
    newPos.x = pos.x + math.random(8, 10)
    newPos.z = pos.z + math.random(8, 10)
    xi.xispbg.spawnTorch(zone, newPos)
    newPos.x = pos.x + math.random(8, 10)
    newPos.z = pos.z - math.random(8, 10)
    xi.xispbg.spawnTorch(zone, newPos)
    newPos.x = pos.x - math.random(8, 10)
    newPos.z = pos.z + math.random(8, 10)
    xi.xispbg.spawnTorch(zone, newPos)
    newPos.x = pos.x - math.random(8, 10)
    newPos.z = pos.z - math.random(8, 10)
    xi.xispbg.spawnTorch(zone, newPos)
end


xi.xispbg.spawnAlly = function(zone, pos, level)
    local table      = xi.xispbg.zoneInfo[zone:getID()]
    local info       = table.ALLIES[math.random(1, #table.ALLIES)]

    local ally = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        allegiance            = xi.allegiance.PLAYER,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(ally)
            if info.spellList > 0 then
                ally:setSpellList(info.spellList)
            end
            ally:setMobMod(xi.mobMod.SKILL_LIST, info.skillList)
            ally:setLocalVar('[XISP]bgFlag', 1)
            ally:setMod(xi.mod.REGEN, 300)
            ally:changeJob(info.job)
            ally:setMobLevel(level)
            ally:setUnkillable(true)
        end,

        onMobEngage = function(ally, target)
            target:updateEnmity(ally)
        end,
    })
    ally:setSpawn(pos.x, pos.y, pos.z)
    return ally
end


xi.xispbg.spawnMobDeco = function(zone, pos, level)
    local table      = xi.xispbg.zoneInfo[zone:getID()]
    local info       = table.MOBS[math.random(1, #table.MOBS)]

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,
        namevis               = false,

        onMobSpawn = function(mob)
            mob:changeJob(info.job)
            mob:setMobLevel(level)

            mob:setSpellList(info.spellList)
            mob:setLocalVar('[XISP]bgFlag', 1)
            mob:setMod(xi.mod.REGEN, 300)
            mob:setUnkillable(true)
        end,
    })
    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end


xi.xispbg.generateMob = function(zone, pos, level)
    local table      = xi.xispbg.zoneInfo[zone:getID()]
    local info       = table.MOBS[math.random(1, #table.MOBS)] -- Pick a random mob from table

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = pos.x,
        y                     = pos.y,
        z                     = pos.z,
        rotation              = pos.rotation,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            local newLevel = level + math.random(2, 3)
            if level == 15 then newLevel = level + math.random(-2, 0) end -- Players will typically be solo / only with a squire at this point
            mob:setMobLevel(newLevel)
            mob:changeJob(info.job)

            mob:addStatusEffectEx(xi.effect.LEVEL_RESTRICTION, xi.effect.LEVEL_RESTRICTION, level, 0, 0, 0, 0, 0, xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION)
            mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 10)
            mob:setSpellList(info.spellList)
            mob:setLocalVar('[XISP]bgFlag', 1)
        end,
    })

    mob:addListener('DEATH', 'BATTLEFIELD_MOB_DEATH', function(mobArg, player)
        local zone = mobArg:getZone()

        zone:setLocalVar('mobsKilled', zone:getLocalVar('mobsKilled') + 1)

        if zone:getLocalVar('mobsKilled') >= zone:getLocalVar('mobsRequired') then
            xi.xispbg.completeBattlefield(player)
        else
            -- Try to spawn an NM
            if math.random(1, 100) < 5 then
                local nm = xi.xispbg.generateNM(zone, mobArg:getPos(), level)
                nm:spawn()
                nm:updateEnmity(player)
            end
        end
    end)

    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end


xi.xispbg.generateNM = function(zone, pos, level)
    local posX, posZ = xi.xisp.getPointAroundLoc(pos, 2, 5)
    local table      = xi.xispbg.zoneInfo[zone:getID()]
    local info       = table.NMS[math.random(1, #table.NMS)] -- Pick a random mob from table
    local rot        = math.random(0, 249)

    local mob = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = info.name,
        x                     = posX,
        y                     = pos.y,
        z                     = posZ,
        rotation              = rot,
        look                  = info.look,
        groupId               = info.groupID,
        groupZoneId           = xi.zone.GM_HOME,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            local newLevel = level + math.random(1, 3)
            if level == 15 then newLevel = level - 2 end
            mob:addStatusEffectEx(xi.effect.LEVEL_RESTRICTION, xi.effect.LEVEL_RESTRICTION, level, 0, 0, 0, 0, 0, xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION)
            mob:setMobLevel(newLevel)
            mob:changeJob(info.job)
            mob:setMobMod(xi.mobMod.EXP_BONUS, math.random(10, 15) * level)
            mob:setMobMod(xi.mobMod.GIL_MIN, 10 * level)
            mob:setMobMod(xi.mobMod.GIL_MAX, 15 * level)
            mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 5)
            mob:setLocalVar('[XISP]bgFlag', 1)
            mob:setSpellList(info.spellList)
        end,
    })
    mob:setSpawn(pos.x, pos.y, pos.z)
    return mob
end


local menu = {}
local dialogue = {}

menu =
{
    title = "Are you ready for battle?",
    options = {}
}

dialogue =
{
    {
        "I am.",
        function(playerArg)
            SetServerVariable('[XISP]battlefieldCooldown', os.time() + 43200) -- 12 hour cooldown
            playerArg:getZone():setLocalVar('[XISP]battlefieldInProgress', 1)
            playerArg:setLocalVar('inBattle', 1) -- Used for chocobo mount music
            xi.xispbg.beginBattle(playerArg)
        end,
    },
    {
        'Not yet.',
        function(playerArg)
        end,
    },
}


xi.xispbg.spawnNPC = function(zone, pos)
    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Warden",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = 1315,

        onTrigger = function(player, npc)
            xi.xispbg.initZone(player, npc)
        end
    })
    npc:setStatus(xi.status.NORMAL)
end


xi.xispbg.initZone = function(player, npc)
    local debug = false

    local requirements = xi.xispbg.zoneInfo[player:getZone():getID()].REQUIREMENTS

    if GetServerVariable('[XISP]battlefieldCooldown') < os.time() or debug then
        -- Check requirements of battlefield before allowing it to begin
        if player:getMainLvl() < requirements.LEVEL then
            player:printToPlayer("Adventurer, build up your strength. I do not see your potential in aiding us in this fight.", 0, npc:getPacketName())
            return
        elseif player:getRank(player:getNation()) < requirements.RANK then
            player:printToPlayer("Adventurer, build up rank in your nation before you can be recognized in this conflict.", 0, npc:getPacketName())
            return
        end

        player:printToPlayer("Halt, adventurer! Shadows stir beyond the horizon, beastmen gather in force. Steel thy blade, for war is nearly upon us!", 0, npc:getPacketName())
        menu.options = dialogue
        xi.xisp.sendMenu(player, menu)

    elseif player:getZone():getLocalVar('[XISP]battlefieldInProgress') == 1 then
        player:printToPlayer("Beastmen forces have breached the outer line! The kingdom needs you. Take up arms and drive them back before all is lost! Move out!", 0, npc:getPacketName())

    else
        player:printToPlayer("The land lies quiet, friend. No horns nor warcries echo today. Enjoy the stillness. Vanadiel knows rare peace.", 0, npc:getPacketName())
    end
end


xi.xispbg.beginBattle = function(player)
    local zone = player:getZone()
    local info = xi.xispbg.zoneInfo[zone:getID()]
    local maxMobs = 0

    -- Give player and party shared battlefield level sync
    player:addStatusEffectEx(xi.effect.LEVEL_RESTRICTION, xi.effect.LEVEL_RESTRICTION, info.LEVEL, 0, 0, 0, 0, 0, xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION)
    for _, member in pairs(xi.xispal.getParty(player)) do
        member:addStatusEffectEx(xi.effect.LEVEL_RESTRICTION, xi.effect.LEVEL_RESTRICTION, info.LEVEL, 0, 0, 0, 0, 0, xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION)
        member:timer(2000, function(memberArg)
            memberArg:setMobMod(xi.mobMod.DONT_ROAM_HOME, 1) -- For some reason these get reset
            memberArg:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
            memberArg:setMobMod(xi.mobMod.NO_DESPAWN, 1)
            memberArg:setMobMod(xi.mobMod.ROAM_COOL, 0)
            memberArg:setMobMod(xi.mobMod.NO_REST, 1)
        end)
    end

    -- Setup the decos + spawn mobs
    for _, camp in pairs(info.CAMPS) do
        local chest = xi.xispbg.spawnChest(zone, info.LEVEL, camp.pos)
        xi.xispbg.spawnCamp(zone, info.LEVEL, camp.pos)

        maxMobs = maxMobs + camp.numMobs

        -- Spawn mobs for each numMobs in camp
        for i = 1, camp.numMobs do
            local pos = camp.pos
            pos.x, pos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 5)
            pos.rotation = math.random(0, 249)
            local mob = xi.xispbg.generateMob(zone, pos, info.LEVEL)
            mob:spawn()
            chest:setLocalVar('tetheredMob' .. i, mob:getID())
        end
    end

    zone:setLocalVar('mobsRequired', maxMobs)

    -- Setup allies and deco mobs
    for _, camp in pairs(info.DEFENDER_CAMPS) do
        for i = 1, camp.numGroups do
            local newPos = { x = 0, y = 0, z = 0, }
            newPos.y = camp.pos.y
            newPos.x, newPos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 10)
            newPos.rotation = math.random(0, 249)
            local ally = xi.xispbg.spawnAlly(zone, newPos, info.LEVEL)

            newPos.x, newPos.z = xi.xisp.getPointAroundLoc(camp.pos, 2, 10)
            newPos.rotation = math.random(0, 249)
            local decoMob = xi.xispbg.spawnMobDeco(zone, newPos, info.LEVEL)

            ally:spawn()
            decoMob:spawn()
            ally:updateEnmity(decoMob)
        end
    end

    player:changeMusic(0, 247) -- Night Music
    player:changeMusic(1, 247) -- Day Music
    player:changeMusic(2, 247) -- Battle Music
    -- Mount music handled in mounted.lua
end


xi.xispbg.resetZone = function(player)
    player:timer(1000, function(playerArg)
        local zone = player:getZone()

        zone:setLocalVar('[XISP]battlefieldInProgress', 0)

        -- Give players some time to open last crate
        for _, npc in pairs(zone:getNPCs()) do
            if npc:getLocalVar('[XISP]bgFlag') == 1 then
                npc:setAlwaysRender(false)
                npc:setStatus(xi.status.DISAPPEAR)
            end
        end

        for _, mob in pairs(zone:getMobs()) do
            if mob:getLocalVar('[XISP]bgFlag') == 1 then
                DespawnMob(mob:getID())
            end
        end
    end)
end


xi.xispbg.completeBattlefield = function(player)
    local zone = player:getZone()

    for _, mob in pairs(zone:getMobs()) do
        if mob:getLocalVar('[XISP]bgFlag') == 1 then
            DespawnMob(mob:getID())
        end
    end

    zone:setLocalVar('[XISP]battlefieldInProgress', 0)

    player:changeMusic(0, 120)
    player:changeMusic(1, 120)
    player:changeMusic(2, zone:getSoloBattleMusic()) -- Normal Combat Music
    local pos = xi.xispbg.zoneInfo[zone:getID()].DEFENDER_CAMPS[1].pos

    player:setLocalVar('inBattle', 0)
    player:setCharVar('[XISP]battlefieldsCompleted', player:getCharVar('[XISP]battlefieldsCompleted') + 1) -- Use this somewhere maybe?
    player:delStatusEffect(xi.effect.LEVEL_RESTRICTION)

    for _, member in pairs(xi.xispal.getParty(player)) do
        member:delStatusEffect(xi.effect.LEVEL_RESTRICTION)
    end

    local fireworks = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "   ",
        x = pos.x,
        y = pos.y,
        z = pos.z,
        rotation = pos.rotation,
        look = "0x0000470100000000000000000000000000000000",
    })

    fireworks:setStatus(xi.status.NORMAL)
    fireworks:setAlwaysRender(true)
    fireworks:setUntargetable(true)

    fireworks:timer(60000, function(fireworksArg)
        fireworksArg:setStatus(xi.status.DISAPPEAR)
        fireworksArg:setAlwaysRender(false)
    end)
end
