xi = xi or {}
xi.xispal = xi.xispal or {}

-- Pals will be similar to the player in that they possess 2/3 the SJ lvl compared to 75.
-- Ex. 75/49 -- 50/33 -- 25 / 16

-- Lists are organized per section based on priority. The higher up on the list, the more it will be prioritized.

xi.xispal.white =
{
    BUFF =
    {
        -- High priority buffs
        { spell = xi.magic.spell.REFRESH,   effect = xi.effect.REFRESH,      cost = 0, lvl = { [xi.job.WHM] = 63, [xi.job.RDM] = 41, }}, -- Refresh

        -- Na spells
        { spell = xi.magic.spell.POISONA,  effect = xi.effect.POISON,        cost = 0, lvl = { [xi.job.WHM] = 6,  [xi.job.RDM] = 10, }}, -- Poisona
        { spell = xi.magic.spell.PARALYNA, effect = xi.effect.PARALYSIS,     cost = 0, lvl = { [xi.job.WHM] = 9,  [xi.job.RDM] = 14, }}, -- Paralyna
        { spell = xi.magic.spell.BLINDNA,  effect = xi.effect.BLINDNESS,     cost = 0, lvl = { [xi.job.WHM] = 14, [xi.job.RDM] = 22, }}, -- Blindna
        { spell = xi.magic.spell.SILENA,   effect = xi.effect.SILENCE,       cost = 0, lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 29, }}, -- Silena
        { spell = xi.magic.spell.CURSNA,   effect = xi.effect.CURSE_I,       cost = 0, lvl = { [xi.job.WHM] = 29, [xi.job.RDM] = 44, }}, -- Cursna
        { spell = xi.magic.spell.STONA,    effect = xi.effect.PETRIFICATION, cost = 0, lvl = { [xi.job.WHM] = 39, [xi.job.RDM] = 60, }}, -- Stona

        -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIND,          cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.WEIGHT,        cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DIA,           cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BIO,           cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.BURN,          cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SHOCK,         cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.CHOKE,         cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DROWN,         cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.RASP,          cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.FROST,         cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.SLOW,          cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.STR_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.DEX_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.AGI_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.MND_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.INT_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase
        { spell = xi.magic.spell.ERASE,    effect = xi.effect.CHR_DOWN,      cost = 0, lvl = { [xi.job.WHM] = 32, [xi.job.RDM] = 49, }}, -- Erase

        -- Other Buffs
        { spell = xi.magic.spell.HASTE,     effect = xi.effect.HASTE,        cost = 0, lvl = { [xi.job.WHM] = 40, [xi.job.RDM] = 48, }}, -- Haste
        { spell = xi.magic.spell.BLINK,     effect = xi.effect.BLINK,        cost = 0, lvl = { [xi.job.WHM] = 19, [xi.job.RDM] = 23, }}, -- Blink
        { spell = xi.magic.spell.STONESKIN, effect = xi.effect.STONESKIN,    cost = 0, lvl = { [xi.job.WHM] = 28, [xi.job.RDM] = 31, }}, -- Stoneskin

        -- Protect / Shell
        { spell = xi.magic.spell.PROTECT_V,   effect = xi.effect.PROTECT,    cost = 0, lvl = { [xi.job.WHM] = 75, }}, -- Protect V
        { spell = xi.magic.spell.SHELL_V,     effect = xi.effect.SHELL,      cost = 0, lvl = { [xi.job.WHM] = 75, }}, -- Shell V
        { spell = xi.magic.spell.PROTECT_IV,  effect = xi.effect.PROTECT,    cost = 0, lvl = { [xi.job.WHM] = 63, [xi.job.RDM] = 63, [xi.job.PLD] = 0, }}, -- Protect IV
        { spell = xi.magic.spell.SHELL_IV,    effect = xi.effect.SHELL,      cost = 0, lvl = { [xi.job.WHM] = 68, [xi.job.RDM] = 68, [xi.job.PLD] = 0, }}, -- Shell IV
        { spell = xi.magic.spell.PROTECT_III, effect = xi.effect.PROTECT,    cost = 0, lvl = { [xi.job.WHM] = 47, [xi.job.RDM] = 47, [xi.job.PLD] = 0, }}, -- Protect III
        { spell = xi.magic.spell.SHELL_III,   effect = xi.effect.SHELL,      cost = 0, lvl = { [xi.job.WHM] = 57, [xi.job.RDM] = 57, [xi.job.PLD] = 0, }}, -- Shell III
        { spell = xi.magic.spell.PROTECT_II,  effect = xi.effect.PROTECT,    cost = 0, lvl = { [xi.job.WHM] = 27, [xi.job.RDM] = 27, [xi.job.PLD] = 0, }}, -- Protect II
        { spell = xi.magic.spell.SHELL_II,    effect = xi.effect.SHELL,      cost = 0, lvl = { [xi.job.WHM] = 37, [xi.job.RDM] = 37, [xi.job.PLD] = 0, }}, -- Shell II
        { spell = xi.magic.spell.PROTECT,     effect = xi.effect.PROTECT,    cost = 0, lvl = { [xi.job.WHM] = 7,  [xi.job.RDM] = 7,  [xi.job.PLD] = 0, }}, -- Protect
        { spell = xi.magic.spell.SHELL,       effect = xi.effect.SHELL,      cost = 0, lvl = { [xi.job.WHM] = 17, [xi.job.RDM] = 17, [xi.job.PLD] = 0, }}, -- Shell
    },

    ENFEEBLE =
    {
        { spell = xi.magic.spell.SILENCE,  effect = xi.effect.SILENCE,      cost = 0, lvl = { [xi.job.WHM] = 15, [xi.job.RDM] = 18, }}, -- Silence
        { spell = xi.magic.spell.PARALYZE, effect = xi.effect.PARALYSIS,    cost = 0, lvl = { [xi.job.WHM] = 4,  [xi.job.RDM] = 6,  }}, -- Paralyze
        { spell = xi.magic.spell.SLOW,     effect = xi.effect.SLOW,         cost = 0, lvl = { [xi.job.WHM] = 13, [xi.job.RDM] = 13, }}, -- Slow
        { spell = xi.magic.spell.DIA_II,   effect = xi.effect.DIA,          cost = 0, lvl = { [xi.job.WHM] = 36, [xi.job.RDM] = 31, }}, -- Dia 2
        { spell = xi.magic.spell.DIA,      effect = xi.effect.DIA,          cost = 0, lvl = { [xi.job.WHM] = 3,  [xi.job.RDM] = 1,  }}, -- Dia
    },

    CURE =
    {
        { spell = xi.magic.spell.CURE_V,   threshold = 350, cost = 0, lvl = { [xi.job.WHM] = 61, }}, -- Cure IV
        { spell = xi.magic.spell.CURE_IV,  threshold = 250, cost = 0, lvl = { [xi.job.WHM] = 41, [xi.job.RDM] = 0, [xi.job.PLD] = 0, }}, -- Cure IV
        { spell = xi.magic.spell.CURE_III, threshold = 180, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 0, [xi.job.PLD] = 0, }}, -- Cure III
        { spell = xi.magic.spell.CURE_II,  threshold = 100, cost = 0, lvl = { [xi.job.WHM] = 11, [xi.job.RDM] = 0, [xi.job.PLD] = 0, }}, -- Cure II
        { spell = xi.magic.spell.CURE,     threshold = 45,  cost = 0, lvl = { [xi.job.WHM] = 1,  [xi.job.RDM] = 0, [xi.job.PLD] = 0, }}, -- Cure
    },

    REGEN =
    {
        { spell = xi.magic.spell.REGEN_III, effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 66, }}, -- Regen III
        { spell = xi.magic.spell.REGEN_II,  effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 44, }}, -- Regen II
        { spell = xi.magic.spell.REGEN,     effect = xi.effect.REGEN, cost = 0, lvl = { [xi.job.WHM] = 21, [xi.job.RDM] = 21, }}, -- Regen
    },

    RAISE =
    {
        { spell = xi.magic.spell.RAISE_II, power = 3, castTime = 13000, lvl = { [xi.job.WHM] = 75, }}, -- Raise III
        { spell = xi.magic.spell.RAISE_II, power = 2, castTime = 14000, lvl = { [xi.job.WHM] = 56, }}, -- Raise II
        { spell = xi.magic.spell.RAISE,    power = 1, castTime = 15000, lvl = { [xi.job.WHM] = 25, [xi.job.RDM] = 38, }}, -- Raise
    }
}

xi.xispal.black =
{
    ELEMENTAL =
    {

    },

    ENFEEBLE =
    {
        { spell = xi.magic.spell.BLIND,  effect = xi.effect.BLINDNESS, cost = 0, lvl = { [xi.job.BLM] = 0, [xi.job.RDM] = 0, }}, -- Poison
        { spell = xi.magic.spell.POISON, effect = xi.effect.POISON,    cost = 0, lvl = { [xi.job.BLM] = 0, [xi.job.RDM] = 0, }}, -- Blind
    },
}
