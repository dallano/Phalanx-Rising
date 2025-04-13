xi = xi or {}
xi.xispal = xi.xispal or {}

-- XISP pal variables --
-- squireID = ID of dynamic entity for squire
-- tankID   = ID of dynamic entity for tank
-- mageID   = ID of dynamic entity for mage
-- damageID = ID of dynamic entity of DD
-- chocoID  = ID of dynamic entity of Chocobo

-- palTimer1   = Used in mini quest for young squire
-- palItem     = ID of the item needed to progress the growing up of the squire
-- chatControl = Controller used to determine conversation when interacting with squire

-- squireProg = Progress tracker used to allow squire to grow up (7 indicates adult)
-- squireRace = Race of player squire (int value between 0-7)
-- squireFace = Face of player squire (int value between 0-31)
-- squireName = Name of player's squire (int value indexing a table of 0-15)
-- squireTier = Tier of squire's equipment. Can upgrade once per conquest and requires an extremely rare item at times

-- hasChocobo = Flag used in determining if player has turned in a chocobo egg
-- chocoGrow  = Progress tracker used to allow chocobo to grow up
-- chocoWait  = Timer used to allow players to only grow their choco once an in game day

-- Quests:
-- quest1Var = Tracker used in the quest for creating the player squire.
-- Second quest uses no tracker, but instead squireProg.
xi.xispal.name =
{
    [0] = 'Valeth',
    [1] = 'Eryndor',
    [2] = 'Serendil',
    [3] = 'Alistair',

    [4] = 'Edron',
    [5] = 'Halric',
    [6] = 'Garrent',
    [7] = 'Petyr',

    [8]  = 'Totoro',
    [9]  = 'Pancha',
    [10] = 'Sorua',
    [11] = 'Gurido',

    [12] = 'Korvahn',
    [13] = 'Draggarim',
    [14] = 'Werei',
    [15] = 'Belben',

    [16] = 'Ariette',
    [17] = 'Ophelia',
    [18] = 'Iselienne',
    [19] = 'Odette',

    [20] = 'Thera',
    [21] = 'Brienne',
    [22] = 'Anju',
    [23] = 'Nora',

    [24] = 'Lulu',
    [25] = 'Pipira',
    [26] = 'Nanaka',
    [27] = 'Mimi',

    [28] = 'Sora',
    [29] = 'Mikota',
    [30] = 'Vira',
    [31] = 'Paya',
}

xi.xispal.face =
{
    [0]  = '00', -- FACE1A
    [1]  = '01', -- FACE1B
    [2]  = '02', -- FACE2A
    [3]  = '03', -- FACE2B
    [4]  = '04', -- FACE3A
    [5]  = '05', -- FACE3B
    [6]  = '06', -- FACE4A
    [7]  = '07', -- FACE4B
    [8]  = '08', -- FACE5A
    [9]  = '09', -- FACE5B
    [10] = '0A', -- FACE6A
    [11] = '0B', -- FACE6B
    [12] = '0C', -- FACE7A
    [13] = '0D', -- FACE7B
    [14] = '0E', -- FACE8A
    [15] = '0F', -- FACE8B
}

xi.xispal.youngLook =
{
    [xi.race.HUME_M  ] = "0x0100001F00100020003000400050006000700000",
    [xi.race.HUME_F  ] = "0x0100011E02100520013003400350006000700000",
    [xi.race.ELVAAN_M] = "0x00009B0000000000000000000000000000000000",
    [xi.race.ELVAAN_F] = "0x0100151E00101420143014401450006000700000",
    [xi.race.TARU_M  ] = "0x0000A80000000000000000000000000000000000",
    [xi.race.TARU_F  ] = "0x0000AA0000000000000000000000000000000000",
    [xi.race.MITHRA  ] = "0x0100031D00100420003000400350036003700000",
    [xi.race.GALKA   ] = "0x0000BA0300000000000000000000000000000000",
}

xi.xispal.race =
{
    [xi.race.HUME_M  ] = "01",
    [xi.race.HUME_F  ] = "02",
    [xi.race.ELVAAN_M] = "03",
    [xi.race.ELVAAN_F] = "04",
    [xi.race.TARU_M  ] = "05",
    [xi.race.TARU_F  ] = "06",
    [xi.race.MITHRA  ] = "07",
    [xi.race.GALKA   ] = "08",
}

xi.xispal.char =
{
    SQUIRE = 0,
    MAGE   = 1,
    TANK   = 2,
    DAMAGE = 3,
}

xi.xispal.chocoboColor =
{
    [0] = 0x0000, -- yellow
    [1] = 0x0200, -- black
    [2] = 0x0400, -- blue
    [3] = 0x0600, -- red
    [4] = 0x0800, -- green
}

-- Default Chocobo:
-- 0x0700200000000000000000000000000000000000

-- Black Chocobo:
-- 0x0700210000000000000000000000000000000000

-- Blue Chocobo:
-- 0x0700220000000000000000000000000000000000

-- Red Chocobo:
-- 0x0700230000000000000000000000000000000000

-- Green Chocobo:
-- 0x0700240000000000000000000000000000000000

-- Antsy chocobo:
-- 0x0000560000000000000000000000000000000000

-- Anxious chocobo:
-- 0x0000570000000000000000000000000000000000

-- Sad eating chocobo:
-- 0x0000580000000000000000000000000000000000

-- Happy Chocobo:
-- 0x0000590000000000000000000000000000000000

-- Active Chocobo:
-- 0x0000810000000000000000000000000000000000

-- Items needed by the squire in order to grow up
xi.xispal.squireItems =
{
    [1] = -- Simple Weapons
    {
        xi.item.BRONZE_SWORD,
        xi.item.MAPLE_WAND,
        xi.item.ASH_STAFF,
        xi.item.RUSTY_GREATSWORD,
        17153, -- Self Bow
    },
    [2] = -- Simple Armor
    {
        12576, -- Bronze Harness
        12568, -- Leather Vest
        12600, -- Robe
        12608, -- Tunic
    },
    [3] = -- Strange Item
    {
        1112, -- Orcish Mail Scales
        553,  -- Dangruf Stone
        576,  -- Siren's Tear
        938,  -- Papaka Grass
        2842, -- Flawed Garnet (Original NM)
    },
    [4] = -- Rarer Weapons
    {
        16551, -- Sapara
        16583, -- Claymore
        17050, -- Willow Wand
        17089, -- Ash Staff
        17160, -- Long Bow
    },
    [5] = -- Rarer Armor
    {
        12560, -- Scale Mail
        12592, -- Doublet
        12577, -- Brass Harness
        12601, -- Linen Robe
    },
    [6] = -- NM loot
    {
        13014, -- Leaping Boots
        16296, -- Armiger's Lace
        16185, -- Pelte
        16486, -- Beestinger
        13607, -- Mist Silk Cape
        16443, -- Fruit Punches
        18394, -- Pilgrim's Wand
        19305, -- Pike
    },
}

xi.xispal.equipment =
{
    NONE            = 0,
    LEATHER         = 1,
    BREASTPLATE     = 2,
    TUNIC           = 3,
    SHINOBI         = 4,
    CHAINMAIL       = 5,
    LIZARD          = 6,
    RAPTOR          = 7,
    RSE             = 8,
    HARA            = 9,
    CLOAK           = 10,
    SILK            = 11,
    SQUIRE          = 12,
    KNIGHT          = 13,
    PADDED          = 14,
    BRONZE          = 15,
    BONE            = 16,
    KENPOGI         = 17,
    WOOL            = 18,
    TACTICIAN       = 19,
    ROBE            = 20,
    DOUBLET         = 21,
    DARKSTEEL_PLATE = 22,
    GAMBY           = 23,
    JUPON           = 24,
    MUSKET          = 25,
    CENTURION       = 26,
    GAVIAL          = 27,
    SCALE           = 28,
    MYTHRIL_PLATE   = 29,
    JUDGE           = 30,
    RSE2            = 31,
    -- ------ Body only ------ --
    ASSAULT         = 32,
    CARDINAL        = 33,
    SCORPION        = 34,
    DEMON           = 35,
    LORD            = 36,
    JUJITSU         = 37,
    AKETONRK        = 38,
    AKETON          = 39,
    HAUBERGEON      = 40,
    BYRNIE          = 41,
    WARSHINOBI      = 42,
    EARTH           = 43,
    BRIG            = 44,
    JUSTAU          = 45,
    BLACKCLOAK      = 46,
    VERMILION       = 47,
    BLUECOTE        = 48,
    BLACKCOTE       = 49,
    UNKNOWN         = 50, -- Body only
    TIGER           = 51,
    IRONSCALE       = 52,
    STEELSCALE      = 53,
    COEURL          = 54,
    ADAMAN_PLATE    = 55,
    CORAL           = 56,
    NOBLE           = 57,
    HAUBERK         = 58,
    ARHAT           = 59,
    DRAGON          = 60,
    RASETSU         = 61,
    CRIMSON         = 62,
    ADAMAN_HAUBERK  = 63,
    -- --- Job Specific --- --
    WAR_AF          = 64,
    WAR_RELIC       = 65,
    MNK_AF          = 66,
    MNK_RELIC       = 67,
    WHM_AF          = 68,
    WHM_RELIC       = 69,
    BLM_AF          = 70,
    BLM_RELIC       = 71,
    RDM_AF          = 72,
    RDM_RELIC       = 73,
    THF_AF          = 74,
    THF_RELIC       = 75,
    PLD_AF          = 76,
    PLD_RELIC       = 77,
    DRK_AF          = 78,
    DRK_RELIC       = 79,
    BST_AF          = 80,
    BST_RELIC       = 81,
    BRD_AF          = 82,
    BRD_RELIC       = 83,
    RNG_AF          = 84,
    RNG_RELIC       = 85,
    SAM_AF          = 86,
    SAM_RELIC       = 87,
    NIN_AF          = 88,
    NIN_RELIC       = 89,
    DRG_AF          = 90,
    DRG_RELIC       = 91,
    SMN_AF          = 92,
    SMN_RELIC       = 93,
    OGRE            = 94,
    KOENIG          = 95,
    WAR_AKETON      = 96,
    HOLY_PLATE      = 97,
    YASHA           = 98,
    KIRIN           = 99,
    HECATOMB        = 100,
    ERRANT          = 101,
    FISHTUNIC       = 102,
    CHOCOJACK       = 103,
    VAGABOND        = 104,
    FIELD           = 105,
    SHURA           = 106,
    DALMATICA       = 107,
    CARAPACE        = 108,
    DUSK            = 109,
    DRAGON_HARNESS  = 110,
    SAN_AKETON      = 111, -- Body doesn't match other pieces
    WIN_AKETON      = 112, -- Body doesn't match other pieces
    BASTOK_AKETON   = 113, -- Body doesn't match other pieces
    SCORP_BREAST    = 114,
    AUSTERE         = 115,
    -- Leather: 116
    CARP_APRON      = 117,
    SMITH_APRON     = 118,
    WEAVE_APRON     = 119,
    ALCH_APRON      = 120,
    BONE_APRON      = 121,
    FISH_APRON      = 122,
    TANA_PRON       = 123,
    COOK_APRON      = 124,
    GOLD_APRON      = 125,
    SUNBREEZE       = 126,
    -- Leather: 127
    HYDRA_HARNESS   = 128,
    SHADE           = 129,
    HYDRA_DOUB      = 130,
    SEER            = 131,
    HYDRA_NOCT      = 132,
    NOCT            = 133,
    BISON           = 134,
    SHAIR           = 135,
    BARONE          = 136,
    IGQIRA          = 137,
    EISEN           = 138,
    AURUM           = 139,
    CHRISTMAS       = 140,
    HACHIMAN        = 141,
    BLESSED         = 142,
    ORACLE          = 142,
    -- Aprons: 143 - 147
    UNICORN         = 148,
    TRADER          = 149,
    ALUMINE         = 150,
    PLASTRON        = 151,
    -- Aprons: 152 - 156
    SUNBREEZE_2     = 157,
    -- Leather: 158
    HOMAM           = 159,
    NASHEERA        = 160,
    -- Repeats: 161-163
    HYDRA_ALUMINE   = 164,
    BLU_AF          = 165,
    BLU_RELIC       = 166,
    COR_AF          = 167,
    COR_RELIC       = 168,
    PUP_AF          = 169,
    PUP_RELIC       = 170,
    -- TOAU Gear: 171 - 176
    -- Repeeat: 177 (Oracle)
    -- Leather 178
    COOL_SCOUT = 180,
    COOL_TANK  = 181,
    ASKAR      = 182,
    COOL_NIN   = 184,
    COOL_MAGE  = 186,
    -- Zest: 187 - 194
    TIDAL_TALISMAN = 228,
    -- OOE stuff
}

-- Weapons
xi.xispal.weapons =
{
    --------- While sub == 0 --------------
    -- GS: 64 - 75
    -- 1H Axe: 76 - 91
    -- GAXE: 92 - 99
    -- Clubs: 100 - 116
    -- H2H: 117 - 143
    -- GKAT: 144 - 156
    -- Dagger: 157 - 180
    -- Rapiers: 181 - 193
    -- Scythe: 194 - 201
    -- Polearm: 202 - 217 (Gungnir, sick)
    -- Wands: 218 - 248
    -- Swords: 249 - 255
    -- Repeat??

    ----------  ------------------
}

xi.xispal.subs =
{

    -- Shields: 19-63
    -- 1H axe: 76 - 96
    -- Clubs: 100-116
    -- H2H: 117 - 143
    -- Daggers: 157 - 180
    -- Rapiers: 181 - 193
    -- Wands: 218 - 248
    -- Swords: 249 - 255
    -- Repeat?

}

xi.xispal.squireGearSets =
{
    [0] = -- Level 1-10
    {
        body  = xi.xispal.equipment.COOL_SCOUT,
        hands = xi.xispal.equipment.COOL_SCOUT,
        legs  = xi.xispal.equipment.COOL_SCOUT,
        feet  = xi.xispal.equipment.COOL_SCOUT,
        main  = 249,
        sub   = 55,
    },
    [1] = -- Lvl 10-20
    {
        body  = xi.xispal.equipment.BONE,
        hands = xi.xispal.equipment.LEATHER,
        legs  = xi.xispal.equipment.DOUBLET,
        feet  = xi.xispal.equipment.KENPO,
        main  = 5,
        sub   = 5,
    },
    [2] = -- Lvl 20-30
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [3] = -- Lvl 30-40
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [4] = -- Lvl 40-50
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [5] = -- AF
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [6] = -- Lvl 50-60
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [7] = -- Lvl 60-70
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [8] = -- Lvl 60-75
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [9] = -- 75 + 1
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [10] = -- 75 + 2
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [11] = -- 75 + 3
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [12] = -- 75 + 4
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [13] = -- 75 + 5
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [14] = -- 75 + 6
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [15] = -- 75 + 7
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
    [16] = -- 75 + 8
    {
        body = 1,
        hands = 1,
        legs = 1,
        feet = 1,
        main = 5,
    },
}
