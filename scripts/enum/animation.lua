-----------------------------------
-- Animations
-----------------------------------
xi = xi or {}

---@enum xi.animation
xi.animation =
{
    NONE                    = 0,
    ATTACK                  = 1,
    DESPAWN                 = 2,
    DEATH                   = 3,
    CHOCOBO                 = 5,
    FISHING                 = 6,
    -- NOTE: Commented out in core
    -- HEALING                 = 7,
    OPEN_DOOR               = 8,
    CLOSE_DOOR              = 9,
    ELEVATOR_UP             = 10,
    ELEVATOR_DOWN           = 11,
    -- seems to be WALLHACK = 28,
    -- seems to be WALLHACK = 31,
    FISHING_NPC             = 32,
    HEALING                 = 33,
    FISHING_FISH            = 38,
    FISHING_CAUGHT          = 39,
    FISHING_ROD_BREAK       = 40,
    FISHING_LINE_BREAK      = 41,
    FISHING_MONSTER         = 42,
    FISHING_STOP            = 43,
    SYNTH                   = 44,
    SIT                     = 47,
    RANGED                  = 48,
    FISHING_START           = 50,
    NEW_FISHING_START       = 56,
    NEW_FISHING_FISH        = 57,
    NEW_FISHING_CAUGHT      = 58,
    NEW_FISHING_ROD_BREAK   = 59,
    NEW_FISHING_LINE_BREAK  = 60,
    NEW_FISHING_MONSTER     = 61,
    NEW_FISHING_STOP        = 62,
    -- 63 through 72 are used with /sitchair
    -- 73 through 83 sitting on air (guessing future use for more chairs..)
    MOUNT                   = 85,
    -- TRUST                = 90, -- This is the animation for a trust NPC spawning in.
}

xi.animMode =
{
    ITEMS = 1,
    JOB_ABILITIES = 2,
    GENERAL_01  = 3,
    GENERAL_02  = 4,
    GENERAL_03  = 5,
    WEAPONSKILL = 6,
    ENEMY_SKILL = 9,
}

xi.anim = xi.animation

-- 20, 4 reappear
-- 26, 4  = pretty disappear
-- 70, 4  = cool disappear
-- 71, 4  = riverne disappear
-- 72, 4  = riverne reappear
-- 73, 4  = riverne disappear (2)
-- 74, 4  = riverne reappear (2)
-- 75, 4 = pretty disappear
-- 76, 4 = pretty reappear
-- 85, 4 = stylish self player disappear
-- 87, 4 = cactroc Rapido
-- lots here
-- 114, 4 ninja teleport
-- 123, 4 = elegant teleport
-- 128, 4 = goblin rolling dice
-- 201, 4 = gentle teleport
-- 202, 4 = toau teleport
-- 231, 4 = toau reappear
-- 205 - 207 cool german messaging
-- 246, 4 = angel spawn + aura
-- 247, 4 = demon spawn + aura

-- 248, 4 = cool buff


-- 10, 3  = FFX death
-- 45, 3  = Alternative warp
-- 54, 3  = pretty disappear

-- Spawning
-- 86, 3 = Ifrit
-- 87, 3 = Titan
-- 88, 3 = Leviathan
-- 89, 3 = Garuda
-- 90, 3 = Shiva
-- 91, 3 = Ramuh
-- 50, 4 = Fenrir
-- 84, 4 = Diabloso?
-- 98, 4 = ??

-- Despawning
-- 92, 3 = Ifrit
-- 93, 3 = Titan
-- 94, 3 = Leviathan
-- 95, 3 = Garuda
-- 96, 3 = Shiva
-- 97, 3 = Ramuh

-- Rank
-- 100 - 145, 3 Ranking
-- 146 ~ CoP messages