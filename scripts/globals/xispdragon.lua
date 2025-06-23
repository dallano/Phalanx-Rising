xi = xi or {}
xi.xispdragon = xi.xispdragon or {}

xi.xispdragon.info =
{
    [1] = -- Low Level dragons
    {
        { look = 1935, skillID = 266,  level = 45, }, -- Red wyvern
        { look = 2245, skillID = 265,  level = 45, }, -- Green Wyvern
        { look = 2387, skillID = 1140, level = 45, }, -- Blue wyvern
        { look = 318,  skillID = 1139, level = 45, }, -- Black Wyvern
    },
    [2] = -- High Level dragons
    {
        { look = 783, skillID = 260, level = 75, }, -- FAFNIR
        { look = 608, skillID = 393, level = 75, }, -- TIAMAT
        { look = 611, skillID = 391, level = 75, }, -- VRTRA
        { look = 609, skillID = 392, level = 75, }, -- JORM
        { look = 610, skillID = 259, level = 75, }, -- OURYU
        { look = "0x0000600200000000000000000000000000000000", skillID = 874, } -- SMOK
    },
}

xi.xispdragon.names =
{
    "Ashvhar",  "Brimfang", "Cindresh", "Drakthar", "Ebonmaw", "Fireskorn", "Gloomash", "Hellsing",
    "Icevorn",  "Jhorvex", "Karnith", "Lazuryn", "Mordrake", "Nivhess", "Onyxen", "Pyraxis", "Quellak", "Ravmage",
    "Searloch", "Thornak", "Umbrith", "Vulkhar", "Wrathos", "Xaldrik", "Ysmirak", "Zenthra", "Aegvorn", "Blaziel",
    "Cravash",  "Drelgath", "Elvaxor", "Fyrskal", "Garnyth", "Harkrax", "Ignivar", "Jurnash", "Kyranok", "Lygrash",
    "Maelrix",  "Nozdrel", "Ormigon", "Pharvix", "Qundral", "Rysshar", "Skaarok", "Thavrix", "Ulmigon", "Vaelgor",
    "Wyrgarth", "Xendrith", "Yalgron", "Zarvokk", "Arzuron", "Belmorn", "Crythix", "Draxorn", "Elyskar","Faelgor",
    "Grivash",  "Haemrok", "Ironskyr", "Javhorn", "Kezrath", "Lokgrim", "Mournex", "Narthal", "Ogrymon", "Pyrmoth",
    "Quavrix",  "Rexigar", "Sinthyr", "Tazroth", "Urghast", "Vyrmoth", "Wrothak", "Xyzakon", "Yhrisak", "Zolven",
    "Ankrath",  "Braknor", "Cazroth", "Durnval", "Ergron", "Flamrok", "Gharzon", "Hexovar", "Iskaran", "Jaelgor",
    "Kroven",   "Larvok", "Mazgron", "Nyvakar", "Othlarn", "Praxion", "Quornix", "Rhazgul", "Sythrak", "Torgrax",
    "Ulvreth",  "Vorgrim", "Wyrrash", "Xarnok", "Yzareth", "Zindral", "Auvronyx", "Baskrath", "Corthuun", "Drazmeth",
    "Elarion",  "Falkvyr", "Gorvhal", "Hyrnix", "Isvalar", "Jurnyx", "Krozmir", "Lirvash", "Myzthor", "Nalkryn",
    "Ozravan",  "Phaldrak", "Quethys", "Rymvark", "Sylkran", "Tharnyx", "Ulgryth", "Varnok", "Wynthal","Xorthin",
    "Yarnak",   "Zulkrin", "Averusk", "Brimorn", "Calvok", "Durnak", "Eylgar", "Fralnix", "Gavron", "Harkral","Iveros",
    "Jundrel",  "Khaelin", "Lorgrax", "Molthin", "Nyvarn", "Opharon", "Pryntar", "Qyvenar", "Ralkosh", "Skarnyx",
    "Thazruk",  "Ulzakar", "Vorgrax", "Wyrnth", "Xandrek", "Yvelgon", "Zurkash", "Aethros", "Bolgrim", "Cyrkarn", "Droxyl",
    "Egvorn",   "Fylnar", "Goreth", "Haskor", "Inzrak", "Jelgrim", "Kyrval", "Lumith", "Morvex", "Nyzrak", "Orlyth",
    "Pygron",   "Qarnyx", "Ruzgar", "Synrel", "Tavrak", "Ungroth", "Vayrion", "Wenthak", "Xorvak", "Yazven", "Zynthor",
    "Azgron",   "Balvok", "Cindrak", "Drenos", "Ethalor", "Furvak", "Gralkor", "Hymnix", "Izrakel", "Jorvas", "Kellnix", "Lorvak",
    "Myrron",   "Narkesh", "Ormin", "Pavrix", "Quarth", "Rylnax", "Sornak", "Tylroth", "Urvath",
    "Viskor",   "Wulvok", "Xarven", "Yorvik", "Zaldrak",
}

xi.xispdragon.spawnInfo =
    {
        [1] =
        {
            -- Level 40 Dragons
            { x = -142, y = 0,     z = -510, rotation = 213, zone = xi.zone.WEST_RONFAURE,        },
            { x = 556,  y = -50,   z = 175,  rotation = 107, zone = xi.zone.EAST_RONFAURE,        },
            { x = 182,  y = 24,    z = 343,  rotation = 78,  zone = xi.zone.LA_THEINE_PLATEAU,    },
            { x = -43,  y = 4,     z = -677, rotation = 196, zone = xi.zone.EAST_SARUTABARUTA,    },
            { x = -50,  y = -16.5, z = 4,    rotation = 190, zone = xi.zone.WEST_SARUTABARUTA,    },
            { x = -301, y = 7.5,   z = 249,  rotation = 47,  zone = xi.zone.TAHRONGI_CANYON,      },
            { x = 301,  y = -61,   z = 534,  rotation = 195, zone = xi.zone.NORTH_GUSTABERG,      },
            { x = 150,  y = 1,     z = -653, rotation = 205, zone = xi.zone.SOUTH_GUSTABERG,      },
            { x = -660, y = 7,     z = 150,  rotation = 224, zone = xi.zone.KONSCHTAT_HIGHLANDS,  },
            { x = 218,  y = 8,     z = 61,   rotation = 200, zone = xi.zone.ROLANBERRY_FIELDS,    },
            { x = -594, y = -16,   z = 115,  rotation = 54,  zone = xi.zone.BATALLIA_DOWNS,       },
            { x = -260, y = 8,     z = 55,   rotation = 200, zone = xi.zone.SAUROMUGUE_CHAMPAIGN, },
        },
        [2] =
        {
            -- Level 75 Dragons
            { x = 387,  y = 0,   z = -265, rotation = 161, zone = xi.zone.BEAUCEDINE_GLACIER,    },
            { x = 75,   y = -24, z = -126, rotation = 216, zone = xi.zone.XARCABARD,             },
            { x = 273,  y = -20, z = 567,  rotation = 113, zone = xi.zone.BIBIKI_BAY,            },
            { x = -138, y = -15, z = 617,  rotation = 5,   zone = xi.zone.MISAREAUX_COAST,       },
            { x = 421,  y = -7,  z = 173,  rotation = 121, zone = xi.zone.LUFAISE_MEADOWS,       },
            { x = -400, y = 0,   z = 317,  rotation = 46,  zone = xi.zone.WESTERN_ALTEPA_DESERT, },
            { x = 250,  y = -8,  z = 350,  rotation = 110, zone = xi.zone.EASTERN_ALTEPA_DESERT, },
            { x = 64,   y = 0.5, z = -121, rotation = 162, zone = xi.zone.CAPE_TERIGGAN,         },
            { x = 290,  y = 4,   z = 217,  rotation = 136, zone = xi.zone.YUHTUNGA_JUNGLE,       },
            { x = 300,  y = -1,  z = -446, rotation = 63 , zone = xi.zone.YHOATOR_JUNGLE,        },
            { x = 0,    y = -8,  z = -115, rotation = 63 , zone = xi.zone.ROMAEVE,               },
        },

    }

local drawIn = function(mob, target)
    local spawnPos = mob:getSpawnPos()
    local drawInTable =
    {
        condition = target:checkDistance(spawnPos) >= 18,
        positon = mob:getPos(),
        wait = 3,
    }

    if drawInTable.condition then
        mob:setMobMod(xi.mobMod.NO_MOVE, 1)
        utils.drawIn(target, drawInTable)
    else
        mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    end
end

xi.xispdragon.spawnDragon = function(zone, tier, index)
    local info      = xi.xispdragon.info[tier][math.random(1, #xi.xispdragon.info[tier])]
    local name      = xi.xispdragon.names[math.random(1, #xi.xispdragon.names)]
    local spawnInfo = xi.xispdragon.spawnInfo[tier][index]
    local groupID   = 2000

    if tier == 2 then
        groupID = 2001
    end

    local dragon = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = name,
        x                     = spawnInfo.x,
        y                     = spawnInfo.y,
        z                     = spawnInfo.z,
        rotation              = spawnInfo.rotation,
        look                  = info.look,
        groupId               = groupID,
        groupZoneId           = 210,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            zone:setLocalVar('[XISP]dragonSpawned', 1) -- Used for Dragon watchers
            mob:setLocalVar('[XISP]isDragon', tier)
            print("XISP DEBUG: Spawning dragon in zone: " .. zone:getName())
            mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 2700) -- Despawns after 45 minutes of being idle
            mob:setMobMod(xi.mobMod.SKILL_LIST, info.skillID)
            mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
            mob:setMobMod(xi.mobMod.NO_MOVE, 0)

            if tier == 1 then
                mob:setMobMod(xi.mobMod.WEAPON_BONUS, 10)
                mob:setMobMod(xi.mobMod.GIL_MIN, 5000)
                mob:setMobMod(xi.mobMod.GIL_MAX, 10000)
                mob:addMod(xi.mod.ATT, 25)
            else
                mob:setMobMod(xi.mobMod.WEAPON_BONUS, 25)
                mob:setMobMod(xi.mobMod.GIL_MIN, 10000)
                mob:setMobMod(xi.mobMod.GIL_MAX, 20000)
                mob:addMod(xi.mod.ATT, 150)
            end
        end,

        onMobRoam = function(mob)
        end,

        onMobEngage = function(mob, target)
        end,

        onMobFight = function(mob, target)
            drawIn(mob, target)
        end,

        onMobDespawn = function(mob, player, optParams)
            zone:setLocalVar('[XISP]dragonSpawned', 0)
        end,
    })

    dragon:setSpawn(spawnInfo.x, spawnInfo.y, spawnInfo.z, spawnInfo.rotation)
    dragon:spawn()
end

xi.xispdragon.spawnHandler = function()
    local tier   = 1

    if math.random(1, 100) < 20 then
        tier = 2
    end

    if GetServerVariable('[XISP]DragonRespawn') < os.time() then
        local dragonTable = xi.xispdragon.spawnInfo[tier]
        local index       = math.random(1, #dragonTable)
        local dragon      = dragonTable[index]

        if GetServerVariable('[XISP]DragonZoneRespawn' .. dragon.zone) < os.time() then
            -- (Keep in mind dragons despawn in 45 minutes if not touched)
            SetServerVariable('[XISP]DragonZoneRespawn' .. dragon.zone, os.time() + 86400) -- Individual timer of 24 hours
            SetServerVariable('[XISP]DragonRespawn', os.time() + 10800 + math.random(-1200, 1200)) -- Try to spawn a dragon every ~3 hours
            xi.xispdragon.spawnDragon(GetZone(dragon.zone), tier, index)
        end
    end
end

-- Don't immediately spawn a dragon. Give the server start some time.
xi.xispdragon.startTimer = function()
    if GetServerVariable('[XISP]DragonRespawn') < os.time() then
        SetServerVariable('[XISP]DragonRespawn', os.time() + math.random(600, 900))
    end
end

xi.xispdragon.initNPC = function(zone, pos)
    local name =
    {
        "Dracile", "Thaurion", "Caedmar", "Verlande", "Mauclaire", "Orrilant", "Evrant", "Renauld", "Chavelle", "Travanche",
    }
    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = name[math.random(1, #name)],
        look      = '0x010003035A105A205A305A405A50D26000700000',
        x         = pos.x,
        y         = pos.y,
        z         = pos.z,
        rotation  = pos.rotation,
        widescan  = 1,

        onTrigger  = function(player, npc)
            xi.xispdragon.onTrigger(player, npc)
        end,
    })
end

xi.xispdragon.onTrigger = function(player, npc)
    local debug = false

    if debug then
        xi.xispdragon.spawnDragon(GetZone(111), 2, 1)
        return
    end

    for _, group in pairs(xi.xispdragon.spawnInfo) do
        for _, dragon in pairs(group) do
            if GetZone(dragon.zone):getLocalVar('[XISP]dragonSpawned') == 1 then
                local zoneName = GetZone(dragon.zone):getName()
                zoneName = zoneName:gsub("%_", " ")
                zoneName = string.gsub(" " .. zoneName, "%W%l", string.upper):sub(2)

                player:printToPlayer("Adventurer! We must amass the dragoons! A dragon was spotted in " .. zoneName .. "!", 0, npc:getPacketName())
                return
            end
        end
    end

    player:printToPlayer("I'm sorry, we haven't been able to track any dragons at the moment.", 0, npc:getPacketName())
end