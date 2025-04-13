-----------------------------------
-- Randomized NM loot (per group)
-----------------------------------
xi = xi or {}
xi.nmloot = xi.nmloot or {}

local lootTable =
{
    [1] = -- Starter Zones
    {
        { nm = { 17215868, 17215888 }, loot = { 13014, }, droprate = xi.drop_rate.RARE        }, -- Leaping Lizzy
        { nm = { 17215778, },          loot = { 16296, }, droprate = xi.drop_rate.VERY_COMMON }, -- Tococo
        { nm = { 17252725, },          loot = { 16185, }, droprate = xi.drop_rate.COMMON      }, -- Duke Decapod
        { nm = { 17187111, },          loot = { 13112, }, droprate = xi.drop_rate.RARE        }, -- Jaggedy-Eared Jack
        { nm = { 17211537, },          loot = { 16486, }, droprate = xi.drop_rate.VERY_COMMON }, -- Stinging Sophie
        { nm = { 17252657, },          loot = { 13607, }, droprate = xi.drop_rate.COMMON      }, -- Spini Spipi
        { nm = { 17092889, },          loot = { 16443, }, droprate = xi.drop_rate.VERY_COMMON }, -- Tom Tit Tat
        { nm = { 17248517, },          loot = { 18394, }, droprate = xi.drop_rate.GUARANTEED  }, -- Nunyenunc
        { nm = { 17248588, },          loot = { 19305, }, droprate = xi.drop_rate.UNCOMMON    }, -- Numbing Norman
        { nm = { 17191044, },          loot = { 2851,  }, droprate = xi.drop_rate.VERY_COMMON }, -- Rambukk
        { nm = { 17186927, },          loot = { 19043, }, droprate = xi.drop_rate.COMMON      }, -- Amanita
    },
    [2] = -- Beastmen Outposts
    {
        { nm = { 17350826, }, loot = { 16856, 13227 }, droprate = xi.drop_rate.VERY_COMMON }, -- Thousandarm Deshglesh
        { nm = { 17354828, }, loot = { 13051, 17412 }, droprate = xi.drop_rate.VERY_COMMON }, -- Hundredscar Hajwaj
        { nm = { 17363181, }, loot = { 12340, 13071 }, droprate = xi.drop_rate.VERY_COMMON }, -- Bu'Ghi Howlblade
        { nm = { 17371300, }, loot = { 17183, 13052 }, droprate = xi.drop_rate.VERY_COMMON }, -- Juu Duzu the Whirlwind
        { nm = { 17363208, }, loot = { 16934, 12797 }, droprate = xi.drop_rate.VERY_COMMON }, -- Zi'Ghi Boneater
        { nm = { 17371515, }, loot = { 17132, 12798 }, droprate = xi.drop_rate.VERY_COMMON }, -- Hoo Mjuu the Torrent
        { nm = { 17363080, }, loot = { 15052,       }, droprate = xi.drop_rate.COMMON      }, -- Qu'Vho Deathurier
        { nm = { 17125452, }, loot = { 17413, 13729 }, droprate = xi.drop_rate.COMMON      }, -- Ashmaker Gotblut
        { nm = { 17354896, }, loot = { 17708,       }, droprate = xi.drop_rate.GUARANTEED  }, -- Chariotbuster Byakzak
        { nm = { 17371578, }, loot = { 13072, 13837 }, droprate = xi.drop_rate.VERY_COMMON }, -- Vuu Puqu the Beguiler
        { nm = { 17363305, }, loot = { 17414, 13837 }, droprate = xi.drop_rate.VERY_COMMON }, -- No'Mho Crimsonarmor
        { nm = { 17350801, }, loot = { 12342,       }, droprate = xi.drop_rate.RARE        }, -- Orcish Barricader
    },
    [3] = -- City Beginner Dungeons
    {
        { nm = { 17572142, 17572094, 17572146, }, loot = { 13506, }, droprate = xi.drop_rate.COMMON }, -- Bomb King
        { nm = { 17572143, 17572095, 17572147, }, loot = { 16773, }, droprate = xi.drop_rate.COMMON }, -- Doppelganger Dio
        { nm = { 17572096, 17572144, 17572148, }, loot = { 16863, }, droprate = xi.drop_rate.COMMON }, -- Doppelganger Gog
        { nm = { 17563749, }, loot = { 14464, },      droprate = xi.drop_rate.COMMON      }, -- Maltha
        { nm = { 17563801, }, loot = { 19044, },      droprate = xi.drop_rate.VERY_COMMON }, -- Nocuous Weapon
        { nm = { 17559584, }, loot = { 19045, },      droprate = xi.drop_rate.COMMON      }, -- Teporingo
        { nm = { 17559869, }, loot = { 18412, },      droprate = xi.drop_rate.GUARANTEED  }, -- Chocoboleech
        { nm = { 17559558, }, loot = { 12567, },      droprate = xi.drop_rate.UNCOMMON    }, -- Geyser Lizard
        { nm = { 17555709, }, loot = { 18604, },      droprate = xi.drop_rate.VERY_COMMON }, -- Ankou
        { nm = { 17555721, }, loot = { 17967, },      droprate = xi.drop_rate.COMMON      }, -- Barbastelle
        { nm = { 17555664, }, loot = { 15940, },      droprate = xi.drop_rate.UNCOMMON    }, -- Gwyllgi
        { nm = { 17563785, }, loot = { 11494, },      droprate = xi.drop_rate.UNCOMMON    }, -- Slendlix Spindlethumb
        { nm = { 17555598, }, loot = { 13613, 529, }, droprate = xi.drop_rate.UNCOMMON    }, -- Spook
        { nm = { 17555668, }, loot = { 12922, 529, }, droprate = xi.drop_rate.VERY_COMMON }, -- Crypt Ghost
    },
    [4] = -- Outer City Zones
    {
        { nm = { 17220000,           }, loot = { 18246,       }, droprate = xi.drop_rate.GUARANTEED  }, -- Haty
        { nm = { 17220001,           }, loot = { 18246,       }, droprate = xi.drop_rate.GUARANTEED  }, -- Bendigeit Vran
        { nm = { 17219619,           }, loot = { 19160,       }, droprate = xi.drop_rate.VERY_COMMON }, -- Ghillie Ghu
        { nm = { 17219795, 17219933, }, loot = { 17366, 4527, }, droprate = xi.drop_rate.UNCOMMON    }, -- Stray Mary
        { nm = { 17219787,           }, loot = { 2834,        }, droprate = xi.drop_rate.UNCOMMON    }, -- Highlander Lizard
        { nm = { 17195221,           }, loot = { 2832,        }, droprate = xi.drop_rate.COMMON      }, -- Slumbering Samwell
        { nm = { 17195259,           }, loot = { 12485,       }, droprate = xi.drop_rate.VERY_COMMON }, -- Tumbling Truffle
        { nm = { 17256900,           }, loot = { 15546,       }, droprate = xi.drop_rate.GUARANTEED  }, -- Yara Ma Yha Who
        { nm = { 17256493,           }, loot = { 11528,       }, droprate = xi.drop_rate.VERY_COMMON }, -- Habrok
        { nm = { 17256690, 17256563, }, loot = { 13086,       }, droprate = xi.drop_rate.UNCOMMON    }, -- Serpopard Ishtar
        { nm = { 17256836,           }, loot = { 11493,       }, droprate = xi.drop_rate.UNCOMMON    }, -- Herbage Hunter
    },
    [5] = -- Port Outer Zones
    {
        { nm = { 17260732, }, loot = { 18605, }, droprate = xi.drop_rate.COMMON }, -- Wake Warder Wanda
        { nm = { 17260907, }, loot = { 17281, }, droprate = xi.drop_rate.COMMON }, -- Helldiver
        { nm = { 17092883, }, loot = { 13057, }, droprate = xi.drop_rate.UNCOMMON }, -- Buburimboo
        { nm = { 17260613, }, loot = { 2826,  }, droprate = xi.drop_rate.VERY_COMMON }, -- Backoo
        { nm = { 17199161, }, loot = { 2854,  }, droprate = xi.drop_rate.COMMON }, -- Metal Shears
        { nm = { 17199564, }, loot = { 13576, }, droprate = xi.drop_rate.COMMON }, -- Golden Bat
        { nm = { 17199438, }, loot = { 12486, }, droprate = xi.drop_rate.UNCOMMON }, -- Valkurm Emperor
        { nm = { 17199351, }, loot = { 11339, }, droprate = xi.drop_rate.COMMON }, -- Hippomaritimus
    },
}

-- Function to shuffle loot table
local function shuffleLootTable(seed)
    local random = xi.xisp.seed_random(seed)
    local shuffledTable = {}

    -- Iterate through each group in lootTable
    for _, group in pairs(lootTable) do
        local shuffledGroup = {}

        -- Shuffle the loot within the group
        for i = #group, 2, -1 do
            local j = random(#group)  -- Generate a random index
            if j then
                -- Swap the loot and droprate between group[i] and group[j]
                shuffledGroup[i] = { nm = group[i].nm, loot = group[j].loot, droprate = group[j].droprate }
                shuffledGroup[j] = { nm = group[j].nm, loot = group[i].loot, droprate = group[i].droprate }
            end
        end

        -- Append the shuffled group to the shuffledTable
        table.insert(shuffledTable, shuffledGroup)
    end

    -- Return the shuffled table
    return shuffledTable
end

xi.nmloot.addDrops = function(mob)
    local newList = shuffleLootTable(GetServerVariable('[XISP]ServerSeed'))
    local mobID   = mob:getID()

    for _, group in pairs(newList) do
        for _, data in pairs(group) do
            if data.nm[1] == mobID  or data.nm[2] == mobID or data.nm[3] == mobID then
                mob:addListener('ITEM_DROPS', 'ITEM_DROPS_NM', function(mobArg, loot)
                    for _, item in pairs(data.loot) do
                        loot:addItem(item, data.droprate)
                        print(item, data.droprate)
                    end
                end)
            end
        end
    end
end
