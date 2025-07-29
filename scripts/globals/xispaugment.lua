xi = xi or {}
xi.xisp = xi.xisp or {}

xi.xisp.augments =
{
    -- Low Level Augments (One allowed per item)
    [1] =
    {
        [3222] = -- Stat Augments (Balance)
        {
            { augmentID = 512, value = 0, name = "STR +1", },
            { augmentID = 513, value = 0, name = "DEX +1", },
            { augmentID = 514, value = 0, name = "VIT +1", },
            { augmentID = 515, value = 0, name = "AGI +1", },
            { augmentID = 516, value = 0, name = "INT +1", },
            { augmentID = 517, value = 0, name = "MND +1", },
            { augmentID = 518, value = 0, name = "CHR +1", },
        },

        [3226] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,  value = 0, name = "MP Recovered While Healing +1", },
            { augmentID = 35,  value = 0, name = "Magic Accuracy +1", },
            { augmentID = 133, value = 0, name = "Magic Attack +1", },
            { augmentID = 17,  value = 2, name = "HP and MP +3", },
            { augmentID = 9,   value = 4, name = "MP +5", },
        },

        [3214] = -- Combat Augments (Ardor)
        {
            { augmentID = 69,  value = 1, name = "Ranged Acc. and Ranged Attk. +2", },
            { augmentID = 51,  value = 1, name = "HP Recovered While Healing +2", },
            { augmentID = 68,  value = 1, name = "Accuracy and Attack +2", },
            { augmentID = 31,  value = 2, name = "Evasion +3", },
            { augmentID = 33,  value = 2, name = "Defense +3", },
            { augmentID = 1,   value = 4, name = "HP +5", },
        },

        [3333] = -- Weapons (Copper Meed)
        {
            { augmentID = 740,  value = 0, name = "Damage +1", },
        },

    },
    -- Mid Level Augments (One allowed per item)
    [2] =
    {
        [3225] = -- Stat Augments (Balance)
        {
            { augmentID = 550, value = 2, name = "STR and DEX +3" },
            { augmentID = 554, value = 2, name = "INT and MND +3" },
            { augmentID = 514, value = 2, name = "VIT +3", },
            { augmentID = 515, value = 2, name = "AGI +3", },
        },

        [3229] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,  value = 2, name = "MP Recovered While Healing +3", },
            { augmentID = 42,  value = 0, name = "Enemity Critical Hit Rate -1%" },
            { augmentID = 131, value = 0, name = "Magic Attack and Accuracy +2" },
            { augmentID = 53,  value = 0, name = "Spell Interruption Rate -1%" },
            { augmentID = 40,  value = 0, name = "Enmity -1" },
            { augmentID = 9,   value = 14,name = "MP +15" },
        },

        [3217] = -- Combat Augments (Ardor)
        {
            { augmentID = 51,  value = 2, name = "HP Recovered While Healing +3", },
            { augmentID = 69,  value = 4, name = "Ranged Acc. and Ranged Attk. +5" },
            { augmentID = 54,  value = 0, name = "Physical Damage Taken -1%" },
            { augmentID = 55,  value = 0, name = "Magical Damage Taken -1%" },
            { augmentID = 68,  value = 4, name = "Accuracy and Attack +5" },
            { augmentID = 41,  value = 0, name = "Critical Hit Rate +1%" },
            { augmentID = 44,  value = 0, name = "Store TP +1" },
            { augmentID = 145, value = 0, name = "Counter +1" },
            { augmentID = 31,  value = 4, name = "Evasion +5" },
            { augmentID = 33,  value = 6, name = "Defense +7" },
            { augmentID = 39,  value = 0, name = "Enmity +1" },
            { augmentID = 78,  value = 14,name = "HP +15" },
        },

        [3213] = -- Misc / Job specific Augments (Vision)
        {
            { augmentID = 320, value = 0, name = "Blood Pact Delay -1" },
            { augmentID = 215, value = 0, name = "Tool Expertise +1" },
            { augmentID = 151, value = 0, name = "Martial Arts +1" },
            { augmentID = 194, value = 0, name = "Kick Attack +1" },
            { augmentID = 17,  value = 9, name = "HP and MP +10" },
            { augmentID = 141, value = 0, name = "Conserve MP+1" },
            { augmentID = 195, value = 0, name = "Subtle Blow_1" },
            { augmentID = 120, value = 0, name = "Gilfinder +1" },
            { augmentID = 212, value = 0, name = "Recycle +1" },
            { augmentID = 198, value = 0, name = "Zanshin +1" },
            { augmentID = 49,  value = 0, name = "Haste +1%" },
            { augmentID = 772, value = 4, name = "Lightning Resistance +5" },
            { augmentID = 774, value = 4, name = "Light Resistance +5" },
            { augmentID = 771, value = 4, name = "Earth Resistance +5" },
            { augmentID = 773, value = 4, name = "Water Resistance +5" },
            { augmentID = 770, value = 4, name = "Wind Resistance +5" },
            { augmentID = 768, value = 4, name = "Fire Resistance +5" },
            { augmentID = 775, value = 4, name = "Dark Resistance +5" },
            { augmentID = 769, value = 4, name = "Ice Resistance +5" },
        },
        [3334] = -- Weapons (Silver Meed)
        {
            { augmentID = 740,  value = 2, name = "Damage +3", },
        },
    },
    -- High Level Augments (Two allowed per item)
    [3] =
    {
        [3223] = -- Stat Augments (Balance)
        {
            { augmentID = 550,  value = 4,  name = "STR and DEX +5" },
            { augmentID = 554,  value = 4,  name = "INT and MND +5" },
            { augmentID = 514,  value = 4,  name = "VIT +5" },
            { augmentID = 515,  value = 4,  name = "AGI +5" },
        },

        [3227] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,   value = 3,  name = "MP Recovered While Healing + 4" },
            { augmentID = 42,   value = 1,  name = "Enemity Critical Hit Rate -2%" },
            { augmentID = 131,  value = 2,  name = "Magic Attack and Accuracy + 3" },
            { augmentID = 53,   value = 1,  name = "Spell Interruption Rate -2%" },
            { augmentID = 335,  value = 1,  name = "Magic Critical Damage +2%" },
            { augmentID = 120,  value = 4,  name = "Avatar Magic Attack +5" },
            { augmentID = 55,   value = 1,  name = "Magic Damage Taken -2%" },
            { augmentID = 343,  value = 9,  name = "Drain and Aspir +10" },
            { augmentID = 330,  value = 1,  name = "Waltz Potency +2%" },
            { augmentID = 329,  value = 1,  name = "Cure Potency +2%" },
            { augmentID = 141,  value = 1,  name = "Conserve MP +2" },
            { augmentID = 368,  value = 0,  name = "Phalanx +1" },
            { augmentID = 9,    value = 29, name = "MP +30" },
        },

        [3219] = -- Skill Augments (Wieldance)
        {
            { augmentID = 266,  value = 1,  name = "Great Katana Skill +2" },
            { augmentID = 257,  value = 1,  name = "Hand-to-hand Skill +2" },
            { augmentID = 260,  value = 1,  name = "Great Sword Skill +2" },
            { augmentID = 291,  value = 1,  name = "Enfeebling Skill +2" },
            { augmentID = 299,  value = 1,  name = "Blue Magic Skill +2" },
            { augmentID = 290,  value = 1,  name = "Enhancing Skill +2" },
            { augmentID = 292,  value = 1,  name = "Elemental Skill +2" },
            { augmentID = 262,  value = 1,  name = "Great Axe Skill +2" },
            { augmentID = 295,  value = 1,  name = "Ninjutsu Skill +2" },
            { augmentID = 289,  value = 1,  name = "Healing Skill +2" },
            { augmentID = 296,  value = 1,  name = "Singing Skill +2" },
            { augmentID = 264,  value = 1,  name = "Polearm Skill +2" },
            { augmentID = 294,  value = 1,  name = "Summon Skill +2" },
            { augmentID = 286,  value = 1,  name = "Shield Skill +2" },
            { augmentID = 288,  value = 1,  name = "Divine Skill +2" },
            { augmentID = 263,  value = 1,  name = "Scythe Skill +2" },
            { augmentID = 265,  value = 1,  name = "Katana Skill +2" },
            { augmentID = 258,  value = 1,  name = "Dagger Skill +2" },
            { augmentID = 297,  value = 1,  name = "String Skill +2" },
            { augmentID = 268,  value = 1,  name = "Staff Skill +2" },
            { augmentID = 287,  value = 1,  name = "Parry Skill +2" },
            { augmentID = 259,  value = 1,  name = "Sword Skill +2" },
            { augmentID = 298,  value = 1,  name = "Wind Skill +2" },
            { augmentID = 267,  value = 1,  name = "Club Skill +2" },
            { augmentID = 293,  value = 1,  name = "Dark Skill +2" },
            { augmentID = 261,  value = 1,  name = "Axe Skill +2" },
        },

        [3215] = -- Combat Augments (Ador)
        {
            { augmentID = 51,   value = 3,  name = "HP Recovered While Healing + 4" },
            { augmentID = 129,  value = 5,  name = "Ranged Acc. and Ranged Attk. +6" },
            { augmentID = 1248, value = 9,  name = "Enhancing Magic Duration +10" },
            { augmentID = 54,   value = 1,  name = "Physical Damage Taken -2%" },
            { augmentID = 326,  value = 1,  name = "Weapon Skill Accuracy +2" },
            { augmentID = 327,  value = 0,  name = "Weapon Skill Damage +1%" },
            { augmentID = 56,   value = 1,  name = "Breath Damage Taken -2%" },
            { augmentID = 68,   value = 5,  name = "Accuracy and Attack +6" },
            { augmentID = 41,   value = 1,  name = "Critical Hit Rate +2%" },
            { augmentID = 143,  value = 0,  name = "Double Attack +1%" },
            { augmentID = 195,  value = 4,  name = "Subtle Blow +5" },
            { augmentID = 33,   value = 9,  name = "Defense +10" },
            { augmentID = 44,   value = 4,  name = "Store TP +5" },
            { augmentID = 31,   value = 7,  name = "Evasion +8" },
            { augmentID = 145,  value = 1,  name = "Counter +2" },
            { augmentID = 39,   value = 1,  name = "Enmity +2" },
            { augmentID = 40,   value = 1,  name = "Enmity -2" },
            { augmentID = 78,   value = 29, name = "HP +30" },
        },

        [3211] = -- Misc / Job Specific Augments (Vision)
        {
            { augmentID = 1246, value = 1,  name = "Pet: Physical Damage Taken -2%" },
            { augmentID = 1247, value = 1,  name = "Pet: Magical Damage Taken -2%" },
            { augmentID = 796,  value = 4,  name = "All Elemental Resistances +5", },
            { augmentID = 112,  value = 1,  name = "Pet: Damage Taken -2%" },
            { augmentID = 1264, value = 2,  name = "Meditate Duration +3" },
            { augmentID = 71,   value = 1,  name = "All Damage Taken -2%" },
            { augmentID = 320,  value = 1,  name = "Blood Pact Delay -2" },
            { augmentID = 328,  value = 0,  name = "Critical Damage +1%" },
            { augmentID = 134,  value = 0,  name = "Magic Defense +1" },
            { augmentID = 363,  value = 1,  name = "Block Chance +2" },
            { augmentID = 17,   value = 14, name = "HP and MP +15" },
            { augmentID = 211,  value = 0,  name = "Snapshot +1" },
            { augmentID = 251,  value = 0,  name = "Darken +1" },
            { augmentID = 49,   value = 1,  name = "Haste +2%" },
            { augmentID = 137,  value = 0,  name = "Regen +1" },
        },
        [3337] = -- Weapon (Gold Meed)
        {
            { augmentID = 896,  value = 4, name = "Sword Enhancement Spell Damage +5", },
            { augmentID = 932,  value = 0, name = "Lightning Affinity +1", },
            { augmentID = 931,  value = 1, name = "Earth Affinity +1", },
            { augmentID = 934,  value = 1, name = "Light Affinity +1", },
            { augmentID = 933,  value = 1, name = "Water Affinity +1", },
            { augmentID = 928,  value = 1, name = "Fire Affinity +1", },
            { augmentID = 930,  value = 1, name = "Wind Affinity +1", },
            { augmentID = 935,  value = 1, name = "Dark Affinity +1", },
            { augmentID = 929,  value = 1, name = "Ice Affinity +1", },
            { augmentID = 740,  value = 4, name = "Damage +5", },
        },
    },
    -- Relic Armor Augments (Three allowed per piece)
    [4] =
    {
        [3224] = -- Stat Augments (Balance)
        {
            { augmentID = 556, value = 9,  name = "MND, INT and CHR +10", },
            { augmentID = 550, value = 9,  name = "STR and DEX +10", },
            { augmentID = 514, value = 19, name = "VIT +20", },
            { augmentID = 515, value = 19, name = "AGI +20", },
        },

        [3228] = -- Magic Augments (Voyage)
        {
            { augmentID = 52,   value = 19, name = "MP recovered while resting +20", },
            { augmentID = 42,  value = 4,  name = "Enemy Critical Hit Rate -5%", },
            { augmentID = 53,  value = 4,  name = "Spell Interruption Rate -5%", },
            { augmentID = 335, value = 4,  name = "Magic Critical Damage +5%", },
            { augmentID = 343, value = 29, name = "Drain and Aspir +30", },
            { augmentID = 322, value = 4,  name = "Song Recast Time -5", },
            { augmentID = 323, value = 4,  name = "Cure Cast Time -4%", },
            { augmentID = 330, value = 4,  name = "Waltz Potency +5%", },
            { augmentID = 329, value = 4,  name = "Cure Potency +5%", },
            { augmentID = 371, value = 4,  name = "Regen Potency +5", },
            { augmentID = 141, value = 14, name = "Conserve MP +15", },
            { augmentID = 140, value = 6,  name = "Fast Cast +7%", },
            { augmentID = 368, value = 4,  name = "Phalanx +5", },
            { augmentID = 40,  value = 9,  name = "Enmity -10", },
            { augmentID = 138, value = 0,  name = "Refresh +1", },
        },

        [3220] = -- Skill Augments (Wieldance)
        {
            { augmentID = 257, value = 14, name = "Hand-to-hand Skill +15", },
            { augmentID = 263, value = 14, name = "Scythe Skill Skill +15", },
            { augmentID = 260, value = 14, name = "Great Sword Skill +15", },
            { augmentID = 291, value = 14, name = "Enfeebling Skill +15", },
            { augmentID = 299, value = 14, name = "Blue Magic Skill +15", },
            { augmentID = 262, value = 14, name = "Great Axe Skill +15", },
            { augmentID = 266, value = 14, name = "Great Axe Skill +15", },
            { augmentID = 290, value = 14, name = "Enhancing Skill +15", },
            { augmentID = 292, value = 14, name = "Elemental Skill +15", },
            { augmentID = 295, value = 14, name = "Ninjutsu Skill +15", },
            { augmentID = 264, value = 14, name = "Polearm Skill +15", },
            { augmentID = 296, value = 14, name = "Singing Skill +15", },
            { augmentID = 289, value = 14, name = "Healing Skill +15", },
            { augmentID = 294, value = 14, name = "Summon Skill +15", },
            { augmentID = 297, value = 14, name = "String Skill +15", },
            { augmentID = 265, value = 14, name = "Katana Skill +15", },
            { augmentID = 258, value = 14, name = "Dagger Skill +15", },
            { augmentID = 286, value = 14, name = "Shield Skill +15", },
            { augmentID = 288, value = 14, name = "Divine Skill +15", },
            { augmentID = 259, value = 14, name = "Sword Skill +15", },
            { augmentID = 268, value = 14, name = "Staff Skill +15", },
            { augmentID = 287, value = 14, name = "Parry Skill +15", },
            { augmentID = 293, value = 14, name = "Dark Skill +15", },
            { augmentID = 267, value = 14, name = "Club Skill +15", },
            { augmentID = 298, value = 14, name = "Wind Skill +15", },
            { augmentID = 261, value = 14, name = "Axe Skill +15", },
        },

        [3216] = -- Combat Augments (Ador)
        {
            { augmentID = 69,   value = 19, name = "Ranged Acc. and Ranged Attk. +20", },
            { augmentID = 51,   value = 19, name = "HP recovered while resting +20", },
            { augmentID = 131,  value = 9,  name = "Magic Accuracy and Attack +10", },
            { augmentID = 326,  value = 9,  name = "Weaponskill Accuracy +10", },
            { augmentID = 68,   value = 19, name = "Accuracy and Attack +20", },
            { augmentID = 327,  value = 4,  name = "Weaponskill Damage +5%", },
            { augmentID = 41,   value = 4,  name = "Critical Hit Rate +5%", },
            { augmentID = 328,  value = 4,  name = "Critical Damage +5%", },
            { augmentID = 354,  value = 0,  name = "Quad Attack +1%", },
            { augmentID = 195,  value = 11, name = "Subtle Blow +12", },
            { augmentID = 333,  value = 4,  name = "Conserve TP +5", }, -- Needs balance
            { augmentID = 44,   value = 14, name = "Store TP +15", },
            { augmentID = 31,   value = 19, name = "Evasion +20", },
            { augmentID = 33,   value = 19, name = "Defense +20", },
            { augmentID = 39,   value = 9,  name = "Enmity +10", },
        },

        [3212] = -- Misc / Job Specific Augments (Balance)
        {
            { augmentID = 796,  value = 9,  name = "All Elemental Resistances +10", },
            { augmentID = 1264, value = 9,  name = "Meditate Duration +10", },
            { augmentID = 913,  value = 5,  name = "Movement Speed +6%", },
            { augmentID = 147,  value = 0,  name = "Treasure Hunter +1", },
            { augmentID = 153,  value = 1,  name = "Shield Mastery +2", },
            { augmentID = 71,   value = 4,  name = "Damage Taken -5%", },
            { augmentID = 363,  value = 9,  name = "Block Chance +9", },
            { augmentID = 151,  value = 4,  name = "Martial Arts +5", },
            { augmentID = 134,  value = 4,  name = "Magic Defense +5" },
            { augmentID = 18,   value = 17, name = "HP and MP +50", },
            { augmentID = 211,  value = 4,  name = "Snapshot +4%", }, -- Ranged Attack Haste
            { augmentID = 145,  value = 9,  name = "Counter +10", },
            { augmentID = 338,  value = 2,  name = "Barrage +2", }, -- Needs balance
            { augmentID = 49,   value = 4,  name = "Haste +5%", },
            { augmentID = 137,  value = 4,  name = "Regen +5", },
        },
        [3346] = -- Pet (Gloomy Charm)
        {
            { augmentID = 124, value = 19, name = "Pet: All Physical Traits +20", },
            { augmentID = 108, value = 19, name = "Pet: All Magical Traits +20", },
            { augmentID = 321, value = 0,  name = "Avatar Perpetuation Cost -1", },
            { augmentID = 112, value = 4,  name = "Pet: All Damage Taken -5%", },
            { augmentID = 320, value = 9,  name = "Blood Pact Delay -10", },
            { augmentID = 99,  value = 19, name = "Pet: Defense +20", },
            { augmentID = 111, value = 4,  name = "Pet: Haste + 5%", },
            { augmentID = 121, value = 19, name = "Pet: Breath +20", },
            { augmentID = 112, value = 9,  name = "Pet: Regen +10", },
            { augmentID = 230, value = 2,  name = "Blood Boon +2", },
        },
    },
}

xi.xisp.augmentItems =
{
    [1] =
    {
        3222, -- Balance Stone
        3226, -- Voyage Stone
        3214, -- Ardor Stone
        3333, -- Copper Meed
    },

    [2] =
    {
        3225, -- Balance Card
        3229, -- Voyage Card
        3217, -- Ardor Card
        3213, -- Vision Card
        3334, -- Silver Meed
    },

    [3] =
    {
        3223, -- Balance Coin
        3227, -- Voyage Coin
        3219, -- Wieldance Coin
        3215, -- Ardor Coin
        3211, -- Vision Coin
        3337, -- Gold Meed
    },

    [4] =
    {
        3224, -- Balance Jewel
        3228, -- Voyage Jewel
        3220, -- Wieldance Jewel
        3216, -- Ardor Jewel
        3212, -- Balance Jewel
        3346, -- Gloomy Charm
    }
}

local menu1     = {}
local dialogue1 = {}
local menu2     = {}
local dialogue2 = {}
local menu3     = {}
local dialogue3 = {}
local menu4     = {}
local dialogue4 = {}

menu1 =
{
    title = 'Attach this enchantment?',
    options = {},
}

dialogue1 =
{
    {
        "Let's do it!",
        function(playerArg)
            local ID = zones[playerArg:getZoneID()]
            playerArg:printToPlayer("Hold onto your hats...", xi.msg.channel.SAY, "Wiseman")

            playerArg:timer(2000, function(playerArg1)
                playerArg1:independentAnimation(playerArg1, 248, 4)
                playerArg1:timer(3000, function(playerArg2)
                    local item         = playerArg2:getCharVar('[XISP]storedAugment')
                    local itemToDelete = playerArg2:getCharVar('[XISP]itemToDelete')
                    local aug1ID       = playerArg2:getCharVar('[XISP]' .. item .. 'aug1ID')
                    local aug1pow      = playerArg2:getCharVar('[XISP]' .. item .. 'aug1pow')
                    local aug2ID       = playerArg2:getCharVar('[XISP]' .. item .. 'aug2ID')
                    local aug2pow      = playerArg2:getCharVar('[XISP]' .. item .. 'aug2pow')
                    local aug3ID       = playerArg2:getCharVar('[XISP]' .. item .. 'aug3ID')
                    local aug3pow      = playerArg2:getCharVar('[XISP]' .. item .. 'aug3pow')

                    playerArg2:messageSpecial(ID.text.ITEM_OBTAINED, item)
                    playerArg2:addItem(item, 1, aug1ID, aug1pow, aug2ID, aug2pow, aug3ID, aug3pow)
                    playerArg2:setCharVar('[XISP]storedAugment', 0)
                    xi.xisp.setExData(GetItemByID(itemToDelete), 0) -- Reset the stored data
                    playerArg2:delItem(itemToDelete, 1)
                end)
            end)
        end,
    },
    {
        'On second thought...',
        function(playerArg)
            return
        end,
    },
}

menu2 =
{
    title = 'Take your equipment back?',
    options = {},
}

dialogue2 =
{
    {
        "Yes, please.",
        function(playerArg)
            local ID = zones[playerArg:getZoneID()]
            playerArg:printToPlayer("Very well. Here you are.", xi.msg.channel.SAY, "Wiseman")

            local item         = playerArg:getCharVar('[XISP]storedAugment')
            local itemToDelete = playerArg:getCharVar('[XISP]itemToDelete')
            local aug1ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug1ID')
            local aug1pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug1pow')
            local aug2ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug2ID')
            local aug2pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug2pow')
            local aug3ID       = playerArg:getCharVar('[XISP]' .. item .. 'aug3ID')
            local aug3pow      = playerArg:getCharVar('[XISP]' .. item .. 'aug3pow')

            playerArg:messageSpecial(ID.text.ITEM_OBTAINED, item)
            playerArg:addItem(item, 1, aug1ID, aug1pow, aug2ID, aug2pow, aug3ID, aug3pow)
            playerArg:setCharVar('[XISP]storedAugment', 0)
        end,
    },
    {
        'Not now.',
        function(playerArg)
            return
        end,
    },
}

menu3 =
{
    title = "What's the plan?",
    options = {},
}

dialogue3 =
{
    {
        "Reset Equipment",
        function(playerArg)
            menu4.options = dialogue4
            xi.xisp.sendMenu(playerArg, menu4)
        end,
    },
    {
        'Give me back my equipment.',
        function(playerArg)
            menu2.options = dialogue2
            xi.xisp.sendMenu(playerArg, menu2)
        end,
    },
    {
        "Nothing.",
        function(playerArg)
            return
        end,
    },
}

menu4 =
{
    title = 'Are you positive?!',
    options = {},
}

dialogue4 =
{
    {
        "Yes, do it.",
        function(playerArg)
            local item = playerArg:getCharVar('[XISP]storedAugment')
            local ID   = zones[playerArg:getZoneID()]

            playerArg:printToPlayer("Very well. Here you are.", xi.msg.channel.NS_SAY, "")

            playerArg:setCharVar('[XISP]storedAugment', 0)
            playerArg:setCharVar('[XISP]itemToDelete', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug1ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug1pow', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug2ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug2pow', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug3ID', 0)
            playerArg:setCharVar('[XISP]' .. item .. 'aug3pow', 0)

            playerArg:messageSpecial(ID.text.ITEM_OBTAINED, item)
            playerArg:addItem(item, 1)
            playerArg:setCharVar('[XISP]storedAugment', 0)
        end,
    },
    {
        'Wait!',
        function(playerArg)
            return
        end,
    },
}

xi.xisp.onAugmentTrade = function(player, npc, trade)
    local augmentItem = player:getCharVar('[XISP]storedAugment')
    local item   = GetItemByID(trade:getItemId())

    if item == nil or trade:getItemCount() > 1 then
        return
    end

    local itemID = item:getID()
    local data  = 0
    local flag  = 0
    local tier  = 0
    local augID = 0
    local name  = ""
    local power = 0

    -- Trading Equipment
    if item:isType(xi.itemType.WEAPON) or item:isType(xi.itemType.ARMOR) then
        if augmentItem == 0 then
            player:setCharVar('[XISP]storedAugment', itemID)
            player:printToPlayer("Wonderful! I will keep this safe. Now, got any enchantment items by chance?", 0, npc:getPacketName())
            player:tradeComplete()
            return
        else
            player:printToPlayer("You've already given me a piece of equipment.", 0, npc:getPacketName())
            return
        end
    end

    -- Check for augment item and determine tier
    for groupID, group in ipairs(xi.xisp.augmentItems) do
        for i, id in ipairs(group) do
            if id == itemID then
                tier = groupID
                flag = 1
                break
            end
        end
    end

    print(augmentItem)

    -- Augment Item
    if flag == 1 then
        local table = xi.xisp.augments[tier][itemID]
        data        = xi.xisp.getExData(item)

        -- Dump if we're trying to upgrade armor with weapon enchantment, or vice versa
        if augmentItem > 0 then
            if
                augmentItem >= 16512 and augmentItem <= 22154 and
                (itemID ~= 3333 and itemID ~= 3334 and itemID ~= 3337)
            then
                player:printToPlayer("Weapons require a specific type of item. Come back when you've found one.", 0, npc:getPacketName())
                return
            elseif
                (augmentItem < 16512 or augmentItem > 22154) and
                (itemID == 3333 or itemID == 3334 or itemID == 3337)
            then
                player:printToPlayer("This item only works on weapons, unfortunately.", 0, npc:getPacketName())
                return
            end
        end

        if data == 0 then -- It was never initialized. Let's do it now
            local newVal = math.random(1, #table)
            augID   = table[newVal].augmentID
            name    = table[newVal].name
            power   = table[newVal].value
            xi.xisp.setExData(item, augID)
            data = xi.xisp.getExData(item)

        else -- Otherwise let's pull up the information
            for _, augment in pairs(table) do
                if augment.augmentID == data then
                    augID = augment.augmentID
                    power = augment.value
                    name  = augment.name
                end
            end
        end

        player:setCharVar('[XISP]itemToDelete', item:getID())
        player:printToPlayer('Looks like you found yourself an enchanting item!', 0, npc:getPacketName())
        player:printToPlayer("Hmmm... If I'm not mistaken, it appears to contain: " .. name, 0, npc:getPacketName())
    end

    -- Now proceed to ask if player wants to add it to the stored item
    if flag == 1 and augmentItem > 0 then
        local aug1ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug1ID')
        local aug2ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug2ID')
        local aug3ID  = player:getCharVar('[XISP]' .. augmentItem .. 'aug3ID')
        local max     = 1

        if tier == 3 then
            max = 2
        elseif tier == 4 then
            max = 3
        end

        if -- Check for full pieces
            (max == 1 and aug1ID ~= 0) or
            (max == 2 and aug2ID ~= 0)
        then
            player:printToPlayer("I do apologize. It appears that this enchantment isn't strong enough to add to your equipment.", 0, npc:getPacketName())
            player:printToPlayer("Or perhaps you've enchanted a similar piece?.", 0, npc:getPacketName())
            return
        elseif aug3ID ~= 0 then
            player:printToPlayer("This piece of equipment is fully upgraded and cannot take any more enchantments.", 0, npc:getPacketName())
            return
        end

        -- Determine which slot to attach to
        if aug1ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug1ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug1pow', power)
        elseif aug2ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug2ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug2pow', power)
        elseif aug3ID == 0 then
            player:setCharVar('[XISP]' .. augmentItem .. 'aug3ID', augID)
            player:setCharVar('[XISP]' .. augmentItem .. 'aug3pow', power)
        end

        player:printToPlayer('Would you like to attach this to the item you gave me earlier?', 0, npc:getPacketName())
        menu1.options = dialogue1
        xi.xisp.sendMenu(player, menu1)
    end
end

xi.xisp.onAugmentTrigger = function(player, npc)
    if npc:getLocalVar('dialogueLock') == 1 then
        return
    end

    local item = player:getCharVar('[XISP]storedAugment')

    if item ~= 0 then
        local itemName = GetItemByID(item):getName()
        itemName = itemName:gsub("%_", " ")
        itemName = string.gsub(" " .. itemName, "%W%l", string.upper):sub(2)

        player:printToPlayer("Hello adventurer. Is this about your " .. itemName .. "?", 0, npc:getPacketName())
        menu3.options = dialogue3
        xi.xisp.sendMenu(player, menu3)
    else
        if npc:getLocalVar('introduction') == 1 then
            player:printToPlayer("Ah, if it isn't my favorite meddler of metal and magic! What'll it be today? Need something enchanted, hmmm?", 0, npc:getPacketName())
        else
            npc:setLocalVar('dialogueLock', 1)
            player:printToPlayer("Ho ho! Well now, what's this? A fresh face with a good head on their shoulders! Welcome, welcome!", 0, npc:getPacketName())
            player:printToPlayer("The name's Orin, but people know me as the Wiseman. Spent my younger days enchanting blades for the Royal Knights.", 0, npc:getPacketName())
            player:timer(8000, function(playerArg)
                playerArg:printToPlayer("These days, I keep it simple. Helping adventurers like yourself bring a bit of magic into their gear", 0, npc:getPacketName())
                playerArg:printToPlayer("Enchantments, augments, and the occasional curious trinket. If it glows, I know how to make it glow brighter!", 0, npc:getPacketName())
                npc:setLocalVar('dialogueLock', 0)
                npc:setLocalVar('introduction', 1)
            end)
        end
    end
end
