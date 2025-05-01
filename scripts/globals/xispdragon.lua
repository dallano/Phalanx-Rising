xi = xi or {}
xi.xispdragon = xi.xispdragon or {}

xi.xispdragon.look =
{
    "0x00000F0300000000000000000000000000000000", -- FAFNIR
    "0x0000600200000000000000000000000000000000", -- TIAMAT
    "0x0000630200000000000000000000000000000000", -- VRTRA
    "0x0000610200000000000000000000000000000000", -- JORM
    "0x0000620200000000000000000000000000000000", -- OURYU
    "0x0000600200000000000000000000000000000000", -- SMOK
}

xi.xispdragon.names =
{
    "George",
    "Dragondeez",
}

xi.xispdragon.info =
    {
        [xi.zone.WEST_RONFAURE] =
        {
            x        = -150,
            y        = -60,
            z        = 250,
            rotation = 226,
            level    = 40,
            skillID  = 260, -- Fafnir
        },
    }

xi.xispdragon.loot =
{
    [40] =
    {
        { item = xi.item.SCROLL_OF_REFRESH,     droprate = 0, }, -- Refresh
        { item = xi.item.SCROLL_OF_ERASE,       droprate = 0, }, -- Erase
        { item = xi.item.SCROLL_OF_PHALANX,     droprate = 0, }, -- Phalanx
        { item = xi.item.SCROLL_OF_UTSUSEMI_NI, droprate = 0, }, -- Utsu: Ni
        { item = xi.item.NONE, droprate = 0, },
        { item = xi.item.NONE, droprate = 0, },
    },
    [50] =
    {

    },
    [60] =
    {

    },
    [70] =
    {

    },
}

xi.xispdragon.spawnDragon = function(zone)
    local table = xi.xispdragon.spawnPos[zone:getID()]
    local info = xi.xispdragon.info[zone:getID()]

    local dragon = zone:insertDynamicEntity({
        objtype               = xi.objType.MOB,
        name                  = xi.xispdragon.names[math.random(1, #xi.xispdragon.names)],
        x                     = info.x,
        y                     = info.y,
        z                     = info.z,
        rotation              = info.rotation,
        look                  = xi.xispdragon.look[math.random(#xi.xispdragon.look)],
        groupId               = 2000,
        groupZoneId           = 210,
        releaseIdOnDisappear  = true,

        onMobSpawn = function(mob)
            mob:setMobLevel(info.level)
            mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
            mob:setMobMod(xi.mobMod.SKILL_LIST, info.skillID)
        end,

        onMobRoam = function(mob)
        end,

        onMobEngage = function(mob, target)
        end,

        onMobFight = function(mob, target)
            -- mob:setMobSkillAttack(0) (Used when in flight to prevent despawn???)
        end,

        onMobDeath = function(mob, player, optParams)
        end,
    })

    dragon:setSpawn(info.x, info.y, info.z, info.rotation)
    dragon:spawn()
end