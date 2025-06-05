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

-- #, 6 = Weapon Skills

-- #, 7 = Attack

-- #, 9 = Mob skills

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

-- 248, 4 = cool buff -- Used for augmenting equipment


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

-- Abilities all , 2
-- 0 = Berserk
-- 1 = Defender
-- 2 = ???
-- 3 = Provoke
-- 4 = ???
-- 5 = ???
-- 6 = Chakra?
-- 7 = Boost
-- 8 = ???
-- 9 = Flee
-- 10 = Hide
-- 11 = Sentinel
-- 12 = ???
-- 13 = Charm
-- 14 = Gauge
-- 15 = Tame
-- 16 = no clue
-- 17 = Sneak Attack
-- 18 = Invincible
-- 19 = Blood Weapon
-- 20 = Souleater
-- 21 = Scavenge
-- 22 = Sharpshot
-- 23 = Barrage
-- 24 = Third Eye
-- 25 = Meditate
-- 26 = ???
-- 27 = ???
-- 28 = Warcry
-- 29 = Circle
-- 30 = Circle
-- 31 = Circle
-- 32 = Circle
-- 33 = Mighty Strikes
-- 34 = Hundred Fists
-- 35 = Benediction
-- 36 = Manafont
-- 37 = Fast Cast
-- 38 = Perfect Dodge
-- 39 = Familiar
-- 40 = BRD 2hr
-- 41 = Eagle Eye Shot
-- 42 = Increased Shots
-- 43 = Increased Shots
-- 44 = Increased Shots
-- 45 = Increased Shots
-- 46 = Increased Shots
-- 47 = Increased Shots
-- 48 = Increased Shots
-- 49 = Increased Shots
-- 50 = Increased Shots
-- 51 = Increased Shots
-- 52 = Increased Shots
-- 53 = Increased Shots
-- 54 = Eagle Eye Shot (Marksman)
-- 55 = Increased Shots
-- 56 = Increased Shots
-- 57 = Increased Shots
-- 58 = Increased Shots
-- 59 = Increased Shots
-- 60 = Increased Shots
-- 61 = Increased Shots
-- 62 = Increased Shots
-- 63 = Increased Shots
-- 64 = Increased Shots
-- 65 = Increased Shots
-- 66 = Increased Shots
-- 67 = Eagle Eye Shot (Marksman)
-- 68 = Increased Shots
-- 69 = Increased Shots
-- 70 = Increased Shots
-- 71 = Increased Shots
-- 72 = Increased Shots
-- 73 = Increased Shots
-- 74 = Increased Shots
-- 75 = Increased Shots
-- 76 = Increased Shots
-- 77 = Increased Shots
-- 78 = Increased Shots
-- 79 = Increased Shots
-- 80 = Elemental Seal?
-- 81 = Divine Seal
-- 82 = Trick Attack
-- 83 = Call Wyvern
-- 84 = Item
-- 85 = Item
-- 86 = Cover
-- 87 = ???
-- 88 = ???
-- 89 = ???
-- 90 = ???
-- 91 = Rampart
-- 92 = Chi Blast
-- 93 = Mjinn Gakure
-- 94 = Use Pet Ability***
-- 95 = ???
-- 96 = DRG 2HR?
-- 97 = DRG 2HR?
-- 98 = 6 COR roll
-- 99 =
-- 100 =
-- 101 =
-- 102 =
-- 103 =
-- 104 =
-- 105 =
-- 106 =
-- 107 =
-- 108 =
-- 109 =
-- 110 =
-- 111 =
-- 112 =
-- 113 =
-- 114 =
-- 115 =
-- 116 =
-- 117 =
-- 118 =
-- 119 =
-- 120 =
-- 121 =
-- 122 =
-- 123 = -- Elemental Shots
-- 124 =
-- 125 =
-- 126 =
-- 127 =
-- 128 =
-- 129 =
-- 130 = -- Shots ends
-- 131 = ???
-- 132 = Blue Cards
-- 133 =
-- 134 =
-- 135 =
-- 136 =
-- 137 =
-- 138 =
-- 139 = Cards end
-- 140 = ???
-- 141 = Haven't seen any of these
-- 142 =
-- 143 =
-- 144 =
-- 145 =
-- 146 =
-- 147 =
-- 148 =
-- 149 =
-- 150 =
-- 151 =
-- 152 =
-- 153 =
-- 154 =
-- 155 =
-- 156 = -- New abilities end
-- 157 = -- Reraise of sorts
-- 158 =
-- 159 = -- New
-- 160 =
-- 161 =
-- 162 =
-- 163 = -- Seigan?
-- 164 = -- Hasso
-- 165 =
-- 166 =
-- 167 =
-- 168 =
-- 169 =
-- 170 =
-- 171 =
-- 172 = SCH light arts?
-- 173 =
-- 174 =
-- 175 =
-- 176 =
-- 177 =
-- 178 = SCH dark arts?
-- 179 =
-- 180 =
-- 181 =
-- 182 =
-- 183 =
-- 184 =
-- 185 =
-- 186 =
-- 187 =
-- 188 =
-- 189 =
-- 190 =
-- 191 =
-- 192 =
-- 193 =
-- 194 =
-- 195 =
-- 196 =
-- 197 =
-- 198 =
-- 199 =
-- 200 =
-- 201 =
-- 202 =
-- 203 =
-- 204 =
-- 205 =
-- 206 =
-- 207 =
-- 208 =
-- 209 =
-- 210 =
-- 211 =
-- 212 =
-- 213 =
-- 214 =
-- 215 =
-- 216 =
-- 217 =
-- 218 =
-- 219 =
-- 220 =
-- 221 =
-- 222 =
-- 223 =
-- 224 =
-- 225 =
-- 226 =
-- 227 =