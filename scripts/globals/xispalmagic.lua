xi = xi or {}
xi.xispal = xi.xispal or {}

-- Pals will be similar to the player in that they possess 2/3 the SJ lvl compared to 75.
-- Ex. 75/49 -- 50/33 -- 25 / 16

-- Lists are organized per section based on priority. The higher up on the list, the more it will be prioritized.

xi.xispal.white =
{
    NA   =
    {
        -- Na spells
        { spell = xi.magic.spell.POISONA,  effect = xi.effect.POISON,        lvl = { [xi.job.WHM] = 6,  [xi.job.RDM] = 12, }, },
        { spell = xi.magic.spell.PARALYNA, effect = xi.effect.PARALYSIS,     lvl = { [xi.job.WHM] = 9,  [xi.job.RDM] = 18, }, },
        { spell = xi.magic.spell.BLINDNA,  effect = xi.effect.BLINDNESS,     lvl = { [xi.job.WHM] = 14, [xi.job.RDM] = 28, }, },
        { spell = xi.magic.spell.SILENA,   effect = xi.effect.SILENCE,       lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 38, }, },
        { spell = xi.magic.spell.CURSNA,   effect = xi.effect.CURSE_I,       lvl = { [xi.job.WHM] = 29, [xi.job.RDM] = 58, }, },
        { spell = xi.magic.spell.STONA,    effect = xi.effect.PETRIFICATION, lvl = { [xi.job.WHM] = 39, },                    },

        -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIND,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.WEIGHT,   lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DIA,      lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIO,      lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BURN,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SHOCK,    lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.CHOKE,    lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DROWN,    lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.RASP,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.FROST,    lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SLOW,     lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.STR_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DEX_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.AGI_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.MND_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.INT_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.CHR_DOWN, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 64, }, },
    },

    BUFF =
    {
        -- High priority buffs
        { spell = xi.magic.spell.REFRESH,   effect = xi.effect.REFRESH, lvl = { [xi.job.RDM] = 41, }, selfOnly = true, }, -- Refresh

        -- Other Buffs
        { spell = xi.magic.spell.HASTE,     effect = xi.effect.HASTE,     lvl = { [xi.job.WHM] = 40, [xi.job.RDM] = 48, }, combatOnly = true, }, -- Haste
        { spell = xi.magic.spell.BLINK,     effect = xi.effect.BLINK,     lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 23, [xi.job.BLM] = 46 }, combatOnly = true, selfOnly = true, }, -- Blink
        { spell = xi.magic.spell.STONESKIN, effect = xi.effect.STONESKIN, lvl = { [xi.job.WHM] = 28, [xi.job.RDM] = 31, [xi.job.BLM] = 68 }, combatOnly = true, selfOnly = true, }, -- Stoneskin

        -- Protect / Shell
        { spell = xi.magic.spell.PROTECTRA_V,   effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 75, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_V,     effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 75, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA_IV,  effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 63, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_IV,    effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 68, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA_III, effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 47, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_III,   effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 57, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA_II,  effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 27, }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA_II,    effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 37, }, selfOnly = true, },
        { spell = xi.magic.spell.PROTECTRA,     effect = xi.effect.PROTECT, lvl = { [xi.job.WHM] = 7,  }, selfOnly = true, },
        { spell = xi.magic.spell.SHELLRA,       effect = xi.effect.SHELL,   lvl = { [xi.job.WHM] = 17, }, selfOnly = true, },

        { spell = xi.magic.spell.PROTECT_IV,    effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 63, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_IV,      effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 68, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT_III,   effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 47, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_III,     effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 57, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT_II,    effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 27, }, selfOnly = true },
        { spell = xi.magic.spell.SHELL_II,      effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 37, }, selfOnly = true },
        { spell = xi.magic.spell.PROTECT,       effect = xi.effect.PROTECT, lvl = { [xi.job.RDM] = 7,  }, selfOnly = true },
        { spell = xi.magic.spell.SHELL,         effect = xi.effect.SHELL,   lvl = { [xi.job.RDM] = 17, }, selfOnly = true },
    },

    ENFEEBLE =
    {
        { spell = xi.magic.spell.SILENCE,  effect = xi.effect.SILENCE,   immunity = xi.immunity.SILENCE,  lvl = { [xi.job.WHM] = 15, [xi.job.RDM] = 18, } }, -- Silence
        { spell = xi.magic.spell.DIA_II,   effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl = { [xi.job.WHM] = 36, [xi.job.RDM] = 31, } }, -- Dia 2
        { spell = xi.magic.spell.DIA,      effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl = { [xi.job.WHM] = 3,  [xi.job.RDM] = 1,  } }, -- Dia
        { spell = xi.magic.spell.PARALYZE, effect = xi.effect.PARALYSIS, immunity = xi.immunity.PARALYZE, lvl = { [xi.job.WHM] = 4,  [xi.job.RDM] = 6,  } }, -- Paralyze
        { spell = xi.magic.spell.SLOW,     effect = xi.effect.SLOW,      immunity = xi.immunity.SLOW,     lvl = { [xi.job.WHM] = 13, [xi.job.RDM] = 13, } }, -- Slow
    },

    CURE =
    {
        { spell = xi.magic.spell.CURE_V,   threshold = 400, cost = 0, lvl = { [xi.job.WHM] = 61, } }, -- Cure IV
        { spell = xi.magic.spell.CURE_IV,  threshold = 350, cost = 0, lvl = { [xi.job.WHM] = 41, [xi.job.RDM] = 0, [xi.job.PLD] = 55, } }, -- Cure IV
        { spell = xi.magic.spell.CURE_III, threshold = 180, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 0, [xi.job.PLD] = 30, } }, -- Cure III
        { spell = xi.magic.spell.CURE_II,  threshold = 100, cost = 0, lvl = { [xi.job.WHM] = 11, [xi.job.RDM] = 0, [xi.job.PLD] = 17, } }, -- Cure II
        { spell = xi.magic.spell.CURE,     threshold = 35,  cost = 0, lvl = { [xi.job.WHM] = 1,  [xi.job.RDM] = 0, [xi.job.PLD] = 5,  } }, -- Cure
    },

    REGEN =
    {
        { spell = xi.magic.spell.REGEN_III, effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 66, } }, -- Regen III
        { spell = xi.magic.spell.REGEN_II,  effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 44, } }, -- Regen II
        { spell = xi.magic.spell.REGEN,     effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 21, } }, -- Regen
    },

    RAISE =
    {
        { spell = xi.magic.spell.RAISE_II, power = 3, castTime = 13000, lvl = { [xi.job.WHM] = 75, } }, -- Raise III
        { spell = xi.magic.spell.RAISE_II, power = 2, castTime = 14000, lvl = { [xi.job.WHM] = 56, } }, -- Raise II
        { spell = xi.magic.spell.RAISE,    power = 1, castTime = 15000, lvl = { [xi.job.WHM] = 25, [xi.job.RDM] = 38, [xi.job.PLD] = 50, } }, -- Raise
    }
}

xi.xispal.black =
{
    ELEMENTAL =
    {
        { spell = xi.magic.spell.THUNDER_IV,   hppThreshold = 40, lvl = { [xi.job.BLM] = 66, } },
        { spell = xi.magic.spell.BLIZZARD_IV,  hppThreshold = 40, lvl = { [xi.job.BLM] = 64, } },
        { spell = xi.magic.spell.FIRE_IV,      hppThreshold = 40, lvl = { [xi.job.BLM] = 62, } },
        { spell = xi.magic.spell.AERO_IV,      hppThreshold = 40, lvl = { [xi.job.BLM] = 59, } },
        { spell = xi.magic.spell.WATER_IV,     hppThreshold = 40, lvl = { [xi.job.BLM] = 55, } },
        { spell = xi.magic.spell.STONE_IV,     hppThreshold = 40, lvl = { [xi.job.BLM] = 51, } },
        { spell = xi.magic.spell.THUNDER_III,  hppThreshold = 30, lvl = { [xi.job.BLM] = 66, [xi.job.RDM] = 75 } },
        { spell = xi.magic.spell.BLIZZARD_III, hppThreshold = 30, lvl = { [xi.job.BLM] = 64, [xi.job.RDM] = 73 } },
        { spell = xi.magic.spell.FIRE_III,     hppThreshold = 30, lvl = { [xi.job.BLM] = 62, [xi.job.RDM] = 71 } },
        { spell = xi.magic.spell.AERO_III,     hppThreshold = 30, lvl = { [xi.job.BLM] = 59, [xi.job.RDM] = 69 } },
        { spell = xi.magic.spell.WATER_III,    hppThreshold = 30, lvl = { [xi.job.BLM] = 55, [xi.job.RDM] = 67 } },
        { spell = xi.magic.spell.STONE_III,    hppThreshold = 30, lvl = { [xi.job.BLM] = 51, [xi.job.RDM] = 65 } },
        { spell = xi.magic.spell.THUNDER_II,   hppThreshold = 20, lvl = { [xi.job.BLM] = 46, [xi.job.RDM] = 60 } },
        { spell = xi.magic.spell.BLIZZARD_II,  hppThreshold = 20, lvl = { [xi.job.BLM] = 42, [xi.job.RDM] = 55 } },
        { spell = xi.magic.spell.FIRE_II,      hppThreshold = 20, lvl = { [xi.job.BLM] = 38, [xi.job.RDM] = 50 } },
        { spell = xi.magic.spell.AERO_II,      hppThreshold = 20, lvl = { [xi.job.BLM] = 34, [xi.job.RDM] = 45 } },
        { spell = xi.magic.spell.WATER_II,     hppThreshold = 20, lvl = { [xi.job.BLM] = 30, [xi.job.RDM] = 40 } },
        { spell = xi.magic.spell.STONE_II,     hppThreshold = 20, lvl = { [xi.job.BLM] = 26, [xi.job.RDM] = 35 } },
        { spell = xi.magic.spell.THUNDER,      hppThreshold = 5,  lvl = { [xi.job.BLM] = 22, [xi.job.RDM] = 30 } },
        { spell = xi.magic.spell.BLIZZARD,     hppThreshold = 5,  lvl = { [xi.job.BLM] = 17, [xi.job.RDM] = 25 } },
        { spell = xi.magic.spell.FIRE,         hppThreshold = 5,  lvl = { [xi.job.BLM] = 13, [xi.job.RDM] = 19 } },
        { spell = xi.magic.spell.AERO,         hppThreshold = 5,  lvl = { [xi.job.BLM] = 9,  [xi.job.RDM] = 14 } },
        { spell = xi.magic.spell.WATER,        hppThreshold = 5,  lvl = { [xi.job.BLM] = 5,  [xi.job.RDM] = 9  } },
        { spell = xi.magic.spell.STONE,        hppThreshold = 5,  lvl = { [xi.job.BLM] = 1,  [xi.job.RDM] = 4  } },
    },

    ENFEEBLE =
    {
        [xi.job.BLM] =
        {
            { spell = xi.magic.spell.BURN,      effect = xi.effect.BURN,  immunity = xi.immunity.NONE, lvl = { [xi.job.BLM] = 24, } },
            { spell = xi.magic.spell.SHOCK,     effect = xi.effect.SHOCK, immunity = xi.immunity.NONE, lvl = { [xi.job.BLM] = 16, } },
            { spell = xi.magic.spell.CHOKE,     effect = xi.effect.CHOKE, immunity = xi.immunity.NONE, lvl = { [xi.job.BLM] = 20, } },
        },
        [xi.job.DRK] =
        {
            { spell = xi.magic.spell.ABSORB_TP,                                    lvl = { [xi.job.DRK] = 45, } },
            { spell = xi.magic.spell.ABSORB_ACC, effect = xi.effect.ACCURACY_DOWN, lvl = { [xi.job.DRK] = 61, } },
            { spell = xi.magic.spell.ABSORB_STR, effect = xi.effect.STR_DOWN,      lvl = { [xi.job.DRK] = 43, } },
            { spell = xi.magic.spell.ABSORB_DEX, effect = xi.effect.DEX_DOWN,      lvl = { [xi.job.DRK] = 41, } },
            { spell = xi.magic.spell.ABSORB_VIT, effect = xi.effect.VIT_DOWN,      lvl = { [xi.job.DRK] = 35, } },
        },
        [xi.job.RDM] =
        {
            { spell = xi.magic.spell.SILENCE,   effect = xi.effect.SILENCE,   immunity = xi.immunity.SILENCE,  lvl = { [xi.job.RDM] = 18, } },
            { spell = xi.magic.spell.BLIND,     effect = xi.effect.BLINDNESS, immunity = xi.immunity.BLIND,    lvl = { [xi.job.RDM] = 5,  } },
            { spell = xi.magic.spell.POISON_II, effect = xi.effect.POISON,    immunity = xi.immunity.POISON,   lvl = { [xi.job.RDM] = 46, } },
            { spell = xi.magic.spell.POISON,    effect = xi.effect.POISON,    immunity = xi.immunity.POISON,   lvl = { [xi.job.RDM] = 8,  } },
            { spell = xi.magic.spell.BIO_II,    effect = xi.effect.BIO,       immunity = xi.immunity.NONE,     lvl = { [xi.job.RDM] = 36, } },
            { spell = xi.magic.spell.BIO,       effect = xi.effect.BIO,       immunity = xi.immunity.NONE,     lvl = { [xi.job.RDM] = 10, } },
            { spell = xi.magic.spell.DIA_II,    effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl = { [xi.job.RDM] = 31, } },
            { spell = xi.magic.spell.DIA,       effect = xi.effect.DIA,       immunity = xi.immunity.NONE,     lvl = { [xi.job.RDM] = 1,  } },
            { spell = xi.magic.spell.PARALYZE,  effect = xi.effect.PARALYSIS, immunity = xi.immunity.PARALYZE, lvl = { [xi.job.RDM] = 6,  } },
            { spell = xi.magic.spell.SLOW,      effect = xi.effect.SLOW,      immunity = xi.immunity.SLOW,     lvl = { [xi.job.RDM] = 13, } },
        },
    },
}

xi.xispal.ninjutsu =
{
    [1] = -- Utsusemi
    {
        { spell = xi.magic.spell.UTSUSEMI_NI,   effect = xi.effect.COPY_IMAGE, lvl = 37, timer = 'ni',   recast = 60},
        { spell = xi.magic.spell.UTSUSEMI_ICHI, effect = xi.effect.COPY_IMAGE, lvl = 11, timer = 'ichi', recast = 40},
    },
    [2] = -- Elemental Wheel
    {
        { spell = xi.magic.spell.SUITON_SAN, lvl = 75, timer = 'suiton', recast = 80, },
        { spell = xi.magic.spell.RAITON_SAN, lvl = 75, timer = 'raiton', recast = 80, },
        { spell = xi.magic.spell.DOTON_SAN,  lvl = 75, timer = 'doton',  recast = 80, },
        { spell = xi.magic.spell.HUTON_SAN,  lvl = 75, timer = 'huton',  recast = 80, },
        { spell = xi.magic.spell.HYOTON_SAN, lvl = 75, timer = 'hyoton', recast = 80, },
        { spell = xi.magic.spell.KATON_SAN,  lvl = 75, timer = 'katon',  recast = 80, },

        { spell = xi.magic.spell.SUITON_NI, lvl = 40, timer = 'suiton', recast = 80, },
        { spell = xi.magic.spell.RAITON_NI, lvl = 40, timer = 'raiton', recast = 80, },
        { spell = xi.magic.spell.DOTON_NI,  lvl = 40, timer = 'doton',  recast = 80, },
        { spell = xi.magic.spell.HUTON_NI,  lvl = 40, timer = 'huton',  recast = 80, },
        { spell = xi.magic.spell.HYOTON_NI, lvl = 40, timer = 'hyoton', recast = 80, },
        { spell = xi.magic.spell.KATON_NI,  lvl = 40, timer = 'katon',  recast = 80, },

        { spell = xi.magic.spell.SUITON_ICHI, lvl = 15, timer = 'suiton', recast = 80, },
        { spell = xi.magic.spell.RAITON_ICHI, lvl = 15, timer = 'raiton', recast = 80, },
        { spell = xi.magic.spell.DOTON_ICHI,  lvl = 15, timer = 'doton',  recast = 80, },
        { spell = xi.magic.spell.HUTON_ICHI,  lvl = 15, timer = 'huton',  recast = 80, },
        { spell = xi.magic.spell.HYOTON_ICHI, lvl = 15, timer = 'hyoton', recast = 80, },
        { spell = xi.magic.spell.KATON_ICHI,  lvl = 15, timer = 'katon',  recast = 80, },
    },
}

xi.xispal.songs =
{
    [1] = -- Enhancing
    {
        -- Ballads
        { spell = xi.magic.spell.MAGES_BALLAD_II, effect = xi.effect.BALLAD, lvl = 55, },
        { spell = xi.magic.spell.MAGES_BALLAD,    effect = xi.effect.BALLAD, lvl = 25, },
        -- Paeons
        { spell = xi.magic.spell.ARMYS_PAEON_V,   effect = xi.effect.PAEON, lvl = 65, },
        { spell = xi.magic.spell.ARMYS_PAEON_IV,  effect = xi.effect.PAEON, lvl = 45, },
        { spell = xi.magic.spell.ARMYS_PAEON_III, effect = xi.effect.PAEON, lvl = 35, },
        { spell = xi.magic.spell.ARMYS_PAEON_II,  effect = xi.effect.PAEON, lvl = 15, },
        { spell = xi.magic.spell.ARMYS_PAEON,     effect = xi.effect.PAEON, lvl = 5,  },
        -- Minuet
        { spell = xi.magic.spell.VALOR_MINUET_IV,  effect = xi.effect.MINUET, lvl = 63, },
        { spell = xi.magic.spell.VALOR_MINUET_III, effect = xi.effect.MINUET, lvl = 43, },
        { spell = xi.magic.spell.VALOR_MINUET_II,  effect = xi.effect.MINUET, lvl = 23, },
        { spell = xi.magic.spell.VALOR_MINUET,     effect = xi.effect.MINUET, lvl = 3, },
        -- Minne
        { spell = xi.magic.spell.KNIGHTS_MINNE_IV,  effect = xi.effect.MINNE, lvl = 61, },
        { spell = xi.magic.spell.KNIGHTS_MINNE_III, effect = xi.effect.MINNE, lvl = 41, },
        { spell = xi.magic.spell.KNIGHTS_MINNE_II,  effect = xi.effect.MINNE, lvl = 21, },
        { spell = xi.magic.spell.KNIGHTS_MINNE,     effect = xi.effect.MINNE, lvl = 1, },
        -- Madrigal
        { spell = xi.magic.spell.BLADE_MADRIGAL, effect = xi.effect.MADRIGAL, lvl = 51, },
        { spell = xi.magic.spell.SWORD_MADRIGAL, effect = xi.effect.MADRIGAL, lvl = 11, },
        -- March
        { spell = xi.magic.spell.VICTORY_MARCH,   effect = xi.effect.MARCH, lvl = 60, },
        { spell = xi.magic.spell.ADVANCING_MARCH, effect = xi.effect.MARCH, lvl = 29, },
    },
    [2] = -- Enfeebling
    {
        -- Elegy
        { spell = xi.magic.spell.CARNAGE_ELEGY,     effect = xi.effect.ELEGY, lvl = 59, },
        { spell = xi.magic.spell.BATTLEFIELD_ELEGY, effect = xi.effect.ELEGY, lvl = 39, },
        -- Finale
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.DEFENSE_BOOST,  lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.ATTACK_BOOST,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.EVASION_BOOST,  lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.ACCURACY_BOOST, lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.BLAZE_SPIKES,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.ICE_SPIKES,     lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.SHOCK_SPIKES,   lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.ACCURACY_BOOST, lvl = 33, },
        { spell = xi.magic.spell.MAGIC_FINALE, effect = xi.effect.ACCURACY_BOOST, lvl = 33, },
    },
    [3] = -- Threnodies
    {
        { spell = xi.magic.spell.LIGHTNING_THRENODY, effect = xi.effect.THRENODY, lvl = 24, },
        { spell = xi.magic.spell.ICE_THRENODY,       effect = xi.effect.THRENODY, lvl = 22, },
        { spell = xi.magic.spell.FIRE_THRENODY,      effect = xi.effect.THRENODY, lvl = 20, },
        { spell = xi.magic.spell.WIND_THRENODY,      effect = xi.effect.THRENODY, lvl = 18, },
        { spell = xi.magic.spell.WATER_THRENODY,     effect = xi.effect.THRENODY, lvl = 16, },
        { spell = xi.magic.spell.EARTH_THRENODY,     effect = xi.effect.THRENODY, lvl = 14, },
    },
    [4] = -- Mazurka
    {
        { spell = xi.magic.spell.RAPTOR_MAZURKA,  effect = xi.effect.MAZURKA, lvl = 37, },
        { spell = xi.magic.spell.CHOCOBO_MAZURKA, effect = xi.effect.MAZURKA, lvl = 73, },
    },
}

xi.xispal.checkNa = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getMPP() < 5 then
        return
    end

    local spells    = xi.xispal.white.NA
    local na        = nil
    local target    = nil
    local extraTime = 0

    for _, member in pairs(party) do
        if member:getHPP() < 50 then -- Dump if a player is in need of a cure
            return
        end

        for _, spell in pairs(spells) do
            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                member:hasStatusEffect(spell.effect)
            then
                na = spell.spell
                target = member
                break
            end
        end
    end

    if target and na then
        xi.xispal.castSpell(pal, na, target, job, extraTime)
        return
    end
end

xi.xispal.checkCure = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) then
        return
    end

    local spells    = xi.xispal.white.CURE
    local target    = nil
    local cure      = nil
    local extraTime = 0

    for _, member in pairs(party) do
        if member:isAlive() and pal:checkDistance(member) <= 20 then
            -- For each member, check if they need a cure
            for _, spell in pairs(spells) do
                -- First check if we can cast this spell
                if spell.lvl[job] and lvl >= spell.lvl[job] then
                    local threshold = spell.threshold

                    -- Ignore Cure I over lvl 30
                    if lvl > 30 and spell.spell == xi.magic.spell.CURE then
                        break
                    end

                    -- Jobs other than whm will heal with more specific behaviors
                    if job == xi.job.RDM then
                        threshold = threshold * 1.5
                    elseif job == xi.job.PLD and member ~= pal then
                        threshold = threshold * 2
                    end

                    if member:getMaxHP() - member:getHP() > threshold then
                        cure   = spell.spell
                        target = member
                        break -- Break searching for the spell to cast
                    end
                end
            end
        end

        if target and cure then
            xi.xispal.castSpell(pal, cure, target, job, extraTime)
            return
        end
    end
end


xi.xispal.checkDrain = function(pal, target, lvl)
    if xi.xispal.checkCast(pal) or pal:getLocalVar('drainRecast') > os.time() then
        return
    end

    if
        target and
        not target:isUndead() and
        pal:isEngaged() and
        pal:getHPP() <= 95 and
        lvl >= 12
    then
        pal:setLocalVar('drainRecast', os.time() + 60)
        xi.xispal.castSpell(pal, 245, target, pal:getMainJob(), 0)
    end
end


-- Logic:
-- Each round to determine which spell to cast will do the following:
-- First check if we can cast the spell or not, then next is to see the recommended
-- HPP threshold in which we should be casting. We will then build a table until
-- we have 6 or less spells, then cast one of the spells at random.
xi.xispal.checkElemental = function(pal, player, job, lvl)
    if
        xi.xispal.checkCast(pal) or
        (job == xi.job.RDM and pal:getMPP() < 60) or
        (job == xi.job.BLM and pal:getMPP() < 30) or
        pal:getLocalVar('elementalRecast') > os.time()
    then
        return
    end

    local target = nil

    for _, member in pairs(xi.xispal.getParty(player)) do
        if member:isEngaged() then
            target = member:getTarget()
        end
    end

    if target == nil then
        return
    end

    local hpp       = target:getHPP()
    local maxSpells = 6
    local spells    = {}

    for _, spell in pairs(xi.xispal.black.ELEMENTAL) do
        local threshold = math.max(5, spell.hppThreshold - target:getMainLvl() / 10)
        if #spells >= maxSpells then
            break
        else
            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                hpp >= threshold
            then
                table.insert(spells, spell.spell)
            end
        end
    end

    local spellToCast = spells[math.random(1, #spells)]

    if target and spellToCast then
        local recast    = math.random(10, 15)
        local extraTime = 5

        if job == xi.job.RDM then
            recast = math.random(30, 40)
        end
        -- pal:setLocalVar('elementalRecast', os.time() + recast) -- Don't cast enfeeb spells too frequently
        xi.xispal.castSpell(pal, spellToCast, target, job, extraTime)
        pal:setLocalVar('elementalRecast', os.time() + recast)
        return
    end
end


-- Enfeeble casting will go through all possible spells to be cast, then
-- cast one at random from the needed list.
xi.xispal.checkEnfeeble = function(pal, job, lvl)
    local target = pal:getTarget()

    if
        xi.xispal.checkCast(pal) or
        target == nil or pal:getMPP() < 25 or
        pal:getLocalVar('enfeebRecast') > os.time()
    then
        return
    end

    local table     = xi.xispal.black.ENFEEBLE[job]
    local extraTime = 0
    local specTime  = 0 -- Used by DRK
    local enfeeb    = nil

    if table then
        if job == xi.job.RDM or job == xi.job.BLM then
            for _, spell in pairs(table) do
                if
                    pal:getLocalVar('spellRecast' .. spell.spell) < os.time() and -- Check recast
                    spell.lvl[job] and lvl >= spell.lvl[job] and -- Check level
                    not target:hasImmunity(spell.immunity) and -- Check immunity
                    not target:getStatusEffect(spell.effect) -- Check effect
                then
                    enfeeb = spell.spell
                    break
                end
            end

        elseif job == xi.job.DRK then
            for _, spell in pairs(table) do
                if
                    pal:getLocalVar('spellRecast' .. spell.spell) < os.time() and
                    spell.lvl[job] and lvl >= spell.lvl[job]
                then

                    if -- Special case for absorb TP
                        spell.spell == xi.magic.spell.ABSORB_TP and
                        pal:getTP() < 1000
                    then
                        specTime = 30 -- Casts absorb TP much more often
                        enfeeb = spell.spell
                        break
                    else
                        if not target:hasStatusEffect(spell.effect) then
                            specTime = 300 -- Only casts each absorb every 5 minutes
                            enfeeb = spell.spell
                            break
                        end
                    end
                end
            end
        end
    end

    if target and enfeeb then
        pal:setLocalVar('spellRecast' .. enfeeb, os.time() + math.random(15, 20) + specTime)
        pal:setLocalVar('enfeebRecast', os.time() + math.random(10, 15))
        xi.xispal.castSpell(pal, enfeeb, target, job, extraTime)
        return
    end
end


xi.xispal.checkBuff = function(pal, party, job, lvl)
    if xi.xispal.checkCast(pal) or pal:getLocalVar('buffTimer') > os.time() then
        return
    end

    local spells    = xi.xispal.white.BUFF
    local buff      = nil
    local target    = nil
    local specTime  = 30
    local extraTime = 0

    for _, member in pairs(party) do
        if -- Dump if a player is in need and we're a healer
            (member:getHPP() < 75 and job == xi.job.WHM) or
            member:getHPP() < 40 or
            not member:isAlive()
        then
            return
        end

        for _, spell in pairs(spells) do
            if
                spell.lvl[job] and lvl >= spell.lvl[job] and
                pal:getLocalVar('spellRecast' .. spell.spell) < os.time()
            then
                -- Self spell logic
                if spell.selfOnly then
                    if
                        member == pal and
                        ((spell.spell == xi.magic.spell.REFRESH and pal:getMPP() < 100) or
                        (spell.combatOnly == true and pal:isEngaged()) or
                        not pal:hasStatusEffect(spell.effect) and spell.effect == xi.effect.PROTECT or
                        not pal:hasStatusEffect(spell.effect) and spell.effect == xi.effect.SHELL)
                    then
                        specTime = 180
                        target = pal
                        buff = spell.spell
                        break
                    end

                -- Default logic
                else
                    if
                        not member:hasStatusEffect(spell.effect) and
                        ((spell.combatOnly and member:isEngaged()) or
                        (spell.combatOnly == nil))
                    then
                        buff = spell.spell
                        target = member
                        break
                    end
                end
            end
        end

        if target then
            break
        end
    end

    if target and buff then
        pal:setLocalVar('spellRecast' .. buff, os.time() + specTime)
        pal:setLocalVar('buffTimer', os.time() + math.random(10, 20))
        xi.xispal.castSpell(pal, buff, target, job, extraTime)
        return
    end
end


xi.xispal.checkSongs = function(pal, party, job, lvl, player)
    if xi.xispal.checkCast(pal) then
        return
    end

    -- Song tailored for player
    if pal:getLocalVar('playerSong') < os.time() then
        player:setLocalVar('playerSong', os.time() + 45)
    end

    -- Song tailored for party

end


xi.xispal.checkNinjutsu = function(pal, job, lvl)
    if xi.xispal.checkCast(pal) then
        return
    end

    for _, spell in pairs(xi.xispal.ninjutsu[1]) do -- Shadows
        if
            pal:getLocalVar(spell.timer) < os.time() and
            not pal:hasStatusEffect(spell.effect) and
            lvl >= spell.lvl
        then
            pal:setLocalVar(spell.timer, os.time() + spell.recast)
            xi.xispal.castSpell(pal, spell.spell, pal, job, 0)
            return
        end
    end

    if not pal:isEngaged() then
        return
    end

    for _, spell in pairs(xi.xispal.ninjutsu[2]) do -- Elemental Wheel
        if
            pal:getLocalVar(spell.timer) < os.time() and
            lvl >= spell.lvl
        then
            pal:setLocalVar(spell.timer, os.time() + spell.recast)
            xi.xispal.castSpell(pal, spell.spell, pal:getTarget(), job, 0)
            return
        end
    end
end


-- Each casting class has their own priorty of casting, therefore it was more
-- simple to just do if statements or switch based on the pal's job
xi.xispal.checkMagic = function(pal, player)
    if
        xi.xispal.checkCast(pal) or
        pal:getZone():getTypeMask() == xi.zoneType.CITY or
        pal:getAnimation() == 5
    then
        return
    end

    local party  = xi.xispal.getParty(player)
    local job    = pal:getMainJob()
    local lvl    = pal:getMainLvl()
    local target = pal:getTarget()

    table.insert(party, player) -- Don't forget to include the player

    if job == xi.job.WHM then
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkCure(pal, party, job, lvl)
        xi.xispal.checkBuff(pal, party, job, lvl)
        return

    elseif job == xi.job.PLD then
        xi.xispal.checkCure(pal, party, job, lvl)
        return

    elseif job == xi.job.RDM then
        xi.xispal.checkBuff(pal, party, job, lvl)
        xi.xispal.checkEnfeeble(pal, job, lvl)
        xi.xispal.checkCure(pal, party, job, lvl)
        xi.xispal.checkNa(pal, party, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)
        return

    elseif job == xi.job.BLM then
        xi.xispal.checkEnfeeble(pal, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)
        xi.xispal.checkBuff(pal, party, job, lvl)
        xi.xispal.checkDrain(pal, target, lvl)
        return

    elseif job == xi.job.DRK then
        xi.xispal.checkDrain(pal, target, lvl)
        xi.xispal.checkEnfeeble(pal, job, lvl)
        xi.xispal.checkElemental(pal, player, job, lvl)
        return

    elseif job == xi.job.BRD then
        xi.xispal.checkSongs(pal, party, job, lvl, player)
        return

    elseif job == xi.job.NIN then
        xi.xispal.checkNinjutsu(pal, job, lvl)
        return

    else
        return
    end
end


xi.xispal.castSpell = function(pal, spell, target, job, extraTime)
    -- Stand still to cast, this is reset in onMobRoam
    if pal:getCurrentAction() == xi.action.ROAMING then
        pal:setBaseSpeed(0)
    end

    pal:setLocalVar('[XISP]canRest', os.time() + 12)

    -- Add a small timer here to prevent sliding while casting
    pal:timer(250, function(palArg)
        -- Add a small delay to cast if pal was resting
        if xi.xispal.stopResting(palArg) then
            palArg:timer(1500, function(palArg2)
                xi.xispal.setRecast(palArg2, job, extraTime)
                palArg2:castSpell(spell, target)
            end)
        else
            xi.xispal.setRecast(palArg, job, extraTime)
            palArg:castSpell(spell, target)
        end
    end)
end


xi.xispal.checkCast = function(pal)
    return pal:getCurrentAction() == xi.action.MAGIC_CASTING or pal:getLocalVar('[XISP]spellRecast') > os.time()
end


-- Sets the speed in which a pal casts spells. This is based on their job
-- The var extraTime allows fluctuation if needed (say a pal is weakened or low HP
-- and doesn't want to pull more agro, they don't have stoneskin up, etc.)
xi.xispal.setRecast = function(pal, job, extraTime)
    if extraTime == nil then
        extraTime = 0
    end

    local jobTable =
    {
        [xi.job.WHM] = 5,
        [xi.job.RDM] = 7,
        [xi.job.PLD] = 10,
        [xi.job.BLM] = 15,
        [xi.job.DRK] = 20,
        [xi.job.NIN] = 15,
        [xi.job.BRD] = 20,
    }

    pal:setLocalVar('[XISP]spellRecast', jobTable[job] + os.time() + extraTime)
end
