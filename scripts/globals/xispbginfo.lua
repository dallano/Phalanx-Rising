xi = xi or {}
xi.xispbg = xi.xispbg or {}

xi.xispbg.lootTables =
{
    [15] = -- Level 15
    {

        { CHANCE = 50, { 3222, 3226, 3214, 3333 }, }, -- Level 1 Enchantments
        { CHANCE = 10, { 14563, 14559, 14547, 14551, 14555 }, }, -- Body Armor (Lvl 15)
        { CHANCE = 15, { 14978, 14974, 14962, 14966, 14970 }, }, -- Hand Armor (Lvl 15)
        { CHANCE = 15, { 15642, 15638, 15626, 15630, 15634 }, }, -- Leg Armor (Lvl 15)
        { CHANCE = 15, { 15728, 15724, 15712, 15716, 15720 }, }, -- Feet Armor (Lvl 15)
        { CHANCE = 15, { 16101, 16097, 16085, 16089, 16093 }, }, -- Head Armor (Lvl 15)
    },

    [25] = -- Level 25
    {
        { CHANCE = 40, { 3222, 3226, 3214, 3333 }, }, -- Level 1 Enchantments
        { CHANCE = 10, { 14563, 14559, 14547, 14551, 14555 }, }, -- Body Armor (Lvl 15)
        { CHANCE = 15, { 14978, 14974, 14962, 14966, 14970 }, }, -- Hand Armor (Lvl 15)
        { CHANCE = 15, { 15642, 15638, 15626, 15630, 15634 }, }, -- Leg Armor (Lvl 15)
        { CHANCE = 15, { 15728, 15724, 15712, 15716, 15720 }, }, -- Feet Armor (Lvl 15)
        { CHANCE = 15, { 16101, 16097, 16085, 16089, 16093 }, }, -- Head Armor (Lvl 15)
    },

    [35] = -- Level 35
    {
        { CHANCE = 30, { 3222, 3226, 3214, 3333 }, }, -- Level 1 Enchantments
        { CHANCE = 10, { 14563, 14559, 14547, 14551, 14555 }, }, -- Body Armor (Lvl 15)
        { CHANCE = 15, { 14978, 14974, 14962, 14966, 14970 }, }, -- Hand Armor (Lvl 15)
        { CHANCE = 15, { 15642, 15638, 15626, 15630, 15634 }, }, -- Leg Armor (Lvl 15)
        { CHANCE = 15, { 15728, 15724, 15712, 15716, 15720 }, }, -- Feet Armor (Lvl 15)
        { CHANCE = 15, { 16101, 16097, 16085, 16089, 16093 }, }, -- Head Armor (Lvl 15)
        { CHANCE = 25, { 3225, 3229, 3217, 3213, 3334 }, }, -- Level 2 Enchantments
    },
}

xi.xispbg.models =
{
    CAMMPFIRE  = 2411,
    TORCH      = 2412,
    CRATE      = 2413,
    SM_CRATE   = 2331,
    CHEST      = 960,
    BANNER     = 2313,
}

xi.xispbg.zoneInfo =
{
    [xi.zone.WEST_SARUTABARUTA] =
    {
        LEVEL = 15,
        MOBS =
        {
            { look = 582, name = "Yagudo Seer",   groupID = 2007, spellList = 1, skillList = 270, job = xi.job.WHM }, -- Wand
            { look = 584, name = "Yagudo Doomer", groupID = 2007, spellList = 2, skillList = 270, job = xi.job.BLM }, -- Staff
            { look = 580, name = "Yagudo Purger", groupID = 2007, spellList = 0, skillList = 270, job = xi.job.MNK }, -- H2H
            { look = 599, name = "Yagudo Flayer", groupID = 2007, spellList = 0, skillList = 270, job = xi.job.WAR }, -- Great Katana
        },
        NMS =
        {
            { look = 2077, name = "Qokk the Pale", groupID = 2010, spellList = 0, skillList = 270, job = xi.job.SAM },
            { look = 2080, name = "Bloodplume",    groupID = 2010, spellList = 0, skillList = 270, job = xi.job.NIN },
            { look = 2082, name = "Khot the Grim", groupID = 2010, spellList = 0, skillList = 270, job = xi.job.MNK },
        },
        ALLIES =
        {
            { look = "0x0100030700101020103010401050B86000700000", name = "Grassblade",  groupID = 2003, spellList = 0, skillList = 776, job = xi.job.WAR, }, -- Mithran (Sword)
            { look = "0x0100090260102C203A303A403A50306100700000", name = "Clawrunner",  groupID = 2003, spellList = 0, skillList = 776, job = xi.job.WAR, }, -- Mithran (Sword)
            { look = "0x01000B0712101020103018401850306100700000", name = "Yagudo Bane", groupID = 2003, spellList = 0, skillList = 776, job = xi.job.WAR, }, -- Mithran (Sword)
            { look = 252, name = "Eight of Clubs", groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
            { look = 252, name = "Six of Spades",  groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
            { look = 252, name = "Two of Hearts",  groupID = 2003, spellList = 0, skillList = 61, job = xi.job.WAR, }, -- Cardian
        },
        CAMPS =
        {
            { pos = { x = 282, y = -4,    z = 48,  rotation = 0, }, numMobs = 3, },
            { pos = { x = 324, y = -4,    z = 44,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 200, y = -4,    z = 0,   rotation = 0, }, numMobs = 4, },
            { pos = { x = 170, y = -25.5, z = 240, rotation = 0, }, numMobs = 3, },
            { pos = { x = 170, y = -4.8,  z = 104, rotation = 0, }, numMobs = 3, },
            { pos = { x = 222, y = -5.0,  z = 95,  rotation = 0, }, numMobs = 2, },
            { pos = { x = 394, y = -4.0,  z = 117, rotation = 0, }, numMobs = 4, },
            { pos = { x = 325, y = -12.0, z = 202, rotation = 0, }, numMobs = 3, },
            { pos = { x = 265, y = -16.5, z = 210, rotation = 0, }, numMobs = 2, },
            { pos = { x = 210, y = -23.0, z = 241, rotation = 0, }, numMobs = 3, },
            { pos = { x = 153, y = -16.0, z = 167, rotation = 0, }, numMobs = 4, },
            { pos = { x = 119, y = -8.0,  z = 120, rotation = 0, }, numMobs = 4, },
            { pos = { x = 70,  y = -9.0,  z = 141, rotation = 0, }, numMobs = 3, },
            { pos = { x = 76,  y = -12.0, z = 202, rotation = 0, }, numMobs = 3, },
            { pos = { x = 130, y = -33.0, z = 290, rotation = 0, }, numMobs = 4, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = 320, y = -4, z = -10, rotation = 0, }, numGroups = 5, },
            { pos = { x = 303, y = -5, z = 4,   rotation = 0, }, numGroups = 3, },
        },
        SPECIAL_LOOT =
        {
            { CHANCE = 20, { 14559, 14974, 15638, 15724, 16097 }, }, -- Anu's Gear
            { CHANCE = 20, { 14563, 14978, 15642, 15728, 16101 }, }, -- Nemain's Gear
        },
    },

    [xi.zone.WEST_RONFAURE] =
    {
        LEVEL = 15,
        MOBS =
        {
            { look = 614, name = "Orcish Gorer",    groupID = 2006, spellList = 4, skillList = 189, job = xi.job.PLD },
            { look = 621, name = "Orcish Scorcher", groupID = 2006, spellList = 2, skillList = 189, job = xi.job.BLM },
            { look = 612, name = "Orcish Fangman",  groupID = 2006, spellList = 0, skillList = 189, job = xi.job.DRG },
            { look = 624, name = "Orcish Belcher",  groupID = 2006, spellList = 0, skillList = 189, job = xi.job.MNK },
        },
        NMS =
        {
            { look = 2036, name = "Zogdrek",  groupID = 2009, spellList = 0, skillList = 189, job = xi.job.WAR },
            { look = 2040, name = "Krallgok", groupID = 2009, spellList = 0, skillList = 189, job = xi.job.DRG },
            { look = 2049, name = "Brukkzog", groupID = 2009, spellList = 0, skillList = 189, job = xi.job.MNK },
        },
        ALLIES =
        {
            { look = "0x01000E031A101C201A301C401A50046000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x010006031C101C201C301C401C50056000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
            { look = "0x01000C031A101C201A301C401A50056000700000", name = "Royal Knight",  groupID = 2002, spellList = 0, skillList = 776, job = xi.job.WAR, },
        },
        CAMPS =
        {
            { pos = { x = -190, y = -60, z = 295, rotation = 0, }, numMobs = 3, },
            { pos = { x = -246, y = -50, z = 281, rotation = 0, }, numMobs = 2, },
            { pos = { x = -286, y = -50, z = 257, rotation = 0, }, numMobs = 4, },
            { pos = { x = -283, y = -50, z = 318, rotation = 0, }, numMobs = 3, },
            { pos = { x = -354, y = -50, z = 284, rotation = 0, }, numMobs = 3, },
            { pos = { x = -342, y = -50, z = 401, rotation = 0, }, numMobs = 2, },
            { pos = { x = -275, y = -60, z = 448, rotation = 0, }, numMobs = 4, },
            { pos = { x = -320, y = -50, z = 203, rotation = 0, }, numMobs = 3, },
            { pos = { x = -278, y = -40, z = 152, rotation = 0, }, numMobs = 2, },
            { pos = { x = -241, y = -50, z = 204, rotation = 0, }, numMobs = 3, },
            { pos = { x = -165, y = -50, z = 195, rotation = 0, }, numMobs = 4, },
        },
        DEFENDER_CAMPS =
        {
            { pos = { x = -183, y = -58, z = 259, rotation = 0, }, numGroups = 3, },
            { pos = { x = -147, y = -60, z = 250, rotation = 0, }, numGroups = 2, },
        },
        SPECIAL_LOOT =
        {
            { CHANCE = 20, { 14547, 14962, 15626, 15712, 16085 }, }, -- Enyo's Set
            { CHANCE = 20, { 14551, 14966, 15630, 15716, 16089 }, }, -- Njord's Set
        },
    },
}