-----------------------------------
-- Randomized NM loot (per group)
-----------------------------------
xi = xi or {}
xi.nmloot = xi.nmloot or {}



local lootTable =
{
    [1] = -- Starter Zones
    {
        { nm = { 17215868, 17215888 }, loot = { item = { 13014, }, droprate = xi.drop_rate.RARE        },  }, -- Leaping Lizzy
        { nm = { 17215778, },          loot = { item = { 16296, }, droprate = xi.drop_rate.VERY_COMMON },  }, -- Tococo
        { nm = { 17252657, },          loot = { item = { 13607, }, droprate = xi.drop_rate.COMMON      },  }, -- Spini Spipi
        { nm = { 17248588, },          loot = { item = { 19305, }, droprate = xi.drop_rate.UNCOMMON    },  }, -- Numbing Norman
        { nm = { 17092889, },          loot = { item = { 16443, }, droprate = xi.drop_rate.VERY_COMMON },  }, -- Tom Tit Tat
        { nm = { 17248517, },          loot = { item = { 18394, }, droprate = xi.drop_rate.GUARANTEED  },  }, -- Nunyenunc
        { nm = { 17211537, },          loot = { item = { 16486, }, droprate = xi.drop_rate.VERY_COMMON },  }, -- Stinging Sophie
        { nm = { 17252725, },          loot = { item = { 16185, }, droprate = xi.drop_rate.COMMON      },  }, -- Duke Decapod
        { nm = { 17187111, },          loot = { item = { 13112, }, droprate = xi.drop_rate.RARE        },  }, -- Jaggedy-Eared Jack
        { nm = { 17191044, },          loot = { item = { 2851,  }, droprate = xi.drop_rate.VERY_COMMON },  }, -- Rambukk
        { nm = { 17186927, },          loot = { item = { 19043, }, droprate = xi.drop_rate.GUARANTEED  },  }, -- Amanita
        { nm = { 17187047, },          loot = { item = { 12371, }, droprate = xi.drop_rate.GUARANTEED  },  }, -- Fungus Beetle
    },
    [2] = -- Beastmen Outposts
    {
        { nm = { 17350826, }, loot = { item = { 16856, 13227 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Thousandarm Deshglesh
        { nm = { 17354828, }, loot = { item = { 13051, 17412 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Hundredscar Hajwaj
        { nm = { 17363181, }, loot = { item = { 12340, 13071 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Bu'Ghi Howlblade
        { nm = { 17371300, }, loot = { item = { 17183, 13052 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Juu Duzu the Whirlwind
        { nm = { 17363208, }, loot = { item = { 16934, 12797 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Zi'Ghi Boneater
        { nm = { 17371515, }, loot = { item = { 17132, 12798 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Hoo Mjuu the Torrent
        { nm = { 17363080, }, loot = { item = { 15052,       }, droprate = xi.drop_rate.COMMON      }, }, -- Qu'Vho Deathurier
        { nm = { 17125452, }, loot = { item = { 17413, 13729 }, droprate = xi.drop_rate.COMMON      }, }, -- Ashmaker Gotblut
        { nm = { 17354896, }, loot = { item = { 17708,       }, droprate = xi.drop_rate.GUARANTEED  }, }, -- Chariotbuster Byakzak
        { nm = { 17371578, }, loot = { item = { 13072, 13837 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Vuu Puqu the Beguiler
        { nm = { 17363305, }, loot = { item = { 17414, 13837 }, droprate = xi.drop_rate.VERY_COMMON }, }, -- No'Mho Crimsonarmor
        { nm = { 17350801, }, loot = { item = { 12342,       }, droprate = xi.drop_rate.RARE        }, }, -- Orcish Barricader
    },
    [3] = -- City Beginner Dungeons
    {
        { nm = { 17572142, 17572094, 17572146, }, loot = { item = { 13506, }, droprate = xi.drop_rate.COMMON }, }, -- Bomb King
        { nm = { 17572143, 17572095, 17572147, }, loot = { item = { 16773, }, droprate = xi.drop_rate.COMMON }, }, -- Doppelganger Dio
        { nm = { 17572096, 17572144, 17572148, }, loot = { item = { 16863, }, droprate = xi.drop_rate.COMMON }, }, -- Doppelganger Gog
        { nm = { 17563749, }, loot = { item = { 14464, },      droprate = xi.drop_rate.COMMON      }, }, -- Maltha
        { nm = { 17563801, }, loot = { item = { 19044, },      droprate = xi.drop_rate.VERY_COMMON }, }, -- Nocuous Weapon
        { nm = { 17559584, }, loot = { item = { 19045, },      droprate = xi.drop_rate.COMMON      }, }, -- Teporingo
        { nm = { 17559869, }, loot = { item = { 18412, },      droprate = xi.drop_rate.GUARANTEED  }, }, -- Chocoboleech
        { nm = { 17559558, }, loot = { item = { 12567, },      droprate = xi.drop_rate.UNCOMMON    }, }, -- Geyser Lizard
        { nm = { 17555709, }, loot = { item = { 18604, },      droprate = xi.drop_rate.VERY_COMMON }, }, -- Ankou
        { nm = { 17555721, }, loot = { item = { 17967, },      droprate = xi.drop_rate.COMMON      }, }, -- Barbastelle
        { nm = { 17555664, }, loot = { item = { 15940, },      droprate = xi.drop_rate.UNCOMMON    }, }, -- Gwyllgi
        { nm = { 17563785, }, loot = { item = { 11494, },      droprate = xi.drop_rate.UNCOMMON    }, }, -- Slendlix Spindlethumb
        { nm = { 17555598, }, loot = { item = { 13613, 529, }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Spook
        { nm = { 17555668, }, loot = { item = { 12922, 529, }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Crypt Ghost
    },
    [4] = -- Outer City Zones
    {
        { nm = { 17220000,           }, loot = { item = { 18246,       }, droprate = xi.drop_rate.GUARANTEED  }, }, -- Haty
        { nm = { 17220001,           }, loot = { item = { 18246,       }, droprate = xi.drop_rate.GUARANTEED  }, }, -- Bendigeit Vran
        { nm = { 17219619,           }, loot = { item = { 19160,       }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Ghillie Ghu
        { nm = { 17219795, 17219933, }, loot = { item = { 17366, 4527, }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Stray Mary
        { nm = { 17219787,           }, loot = { item = { 2834,        }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Highlander Lizard
        { nm = { 17195221,           }, loot = { item = { 2832,        }, droprate = xi.drop_rate.COMMON      }, }, -- Slumbering Samwell
        { nm = { 17195259,           }, loot = { item = { 12485,       }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Tumbling Truffle
        { nm = { 17256900,           }, loot = { item = { 15546,       }, droprate = xi.drop_rate.GUARANTEED  }, }, -- Yara Ma Yha Who
        { nm = { 17256493,           }, loot = { item = { 11528,       }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Habrok
        { nm = { 17256690, 17256563, }, loot = { item = { 13086,       }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Serpopard Ishtar
        { nm = { 17256836,           }, loot = { item = { 11493,       }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Herbage Hunter
    },
    [5] = -- Port Outer Zones
    {
        { nm = { 17260732, }, loot = { item = { 18605, }, droprate = xi.drop_rate.COMMON      }, }, -- Wake Warder Wanda
        { nm = { 17260907, }, loot = { item = { 17281, }, droprate = xi.drop_rate.COMMON      }, }, -- Helldiver
        { nm = { 17092883, }, loot = { item = { 13057, }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Buburimboo
        { nm = { 17260613, }, loot = { item = { 2826,  }, droprate = xi.drop_rate.VERY_COMMON }, }, -- Backoo
        { nm = { 17199161, }, loot = { item = { 2854,  }, droprate = xi.drop_rate.COMMON      }, }, -- Metal Shears
        { nm = { 17199564, }, loot = { item = { 13576, }, droprate = xi.drop_rate.COMMON      }, }, -- Golden Bat
        { nm = { 17199438, }, loot = { item = { 12486, }, droprate = xi.drop_rate.UNCOMMON    }, }, -- Valkurm Emperor
        { nm = { 17199351, }, loot = { item = { 11339, }, droprate = xi.drop_rate.COMMON      }, }, -- Hippomaritimus
    },
}

local function shuffleLootTable(seed)
    local random = xi.xisp.seed_random(seed)
    local newTable = {}

    for _, group in ipairs(lootTable) do
        local shuffledGroup = {}
        local tempGroup = {}

        -- Copy group to tempGroup (so original is safe)
        for i, entry in ipairs(group) do
            tempGroup[i] = entry
        end

        while #tempGroup > 1 do
            local size = #tempGroup
            local i = random(size)
            local j = random(size)

            -- Retry until i != j
            while i == j do
                j = random(size)
            end

            if i and j then
                shuffledGroup[i] = { nm = tempGroup[i].nm, loot = tempGroup[j].loot }
                shuffledGroup[j] = { nm = tempGroup[j].nm, loot = tempGroup[i].loot }

                -- Remove larger index first to avoid shifting
                if i > j then
                    table.remove(tempGroup, i)
                    table.remove(tempGroup, j)
                else
                    table.remove(tempGroup, j)
                    table.remove(tempGroup, i)
                end
            end

        end

        -- Handle leftover single element if present
        if #tempGroup == 1 then
            local leftoverIndex = 1
            local leftoverEntry = tempGroup[leftoverIndex]
            -- Just assign the leftover loot randomly from group but not the same index
            local availableIndices = {}
            for idx = 1, #group do
                if idx ~= leftoverIndex then
                    table.insert(availableIndices, idx)
                end
            end
            local lootIndex = availableIndices[random(#availableIndices)] or 1

            shuffledGroup[leftoverIndex] = { nm = leftoverEntry.nm, loot = group[lootIndex].loot }
        end

        table.insert(newTable, shuffledGroup)
    end

    return newTable
end

xi.nmloot.addDrops = function(mob)
    local newList = shuffleLootTable(GetServerVariable('[XISP]ServerSeed'))
    local mobID   = mob:getID()

    mob:setDropID(0) -- Wipe old drops

    for _, group in pairs(newList) do
        for _, data in pairs(group) do
            if data.nm[1] == mobID  or data.nm[2] == mobID or data.nm[3] == mobID then
                mob:addListener('ITEM_DROPS', 'ITEM_DROPS_NM', function(mobArg, loot)
                    for _, item in pairs(data.loot.item) do
                        loot:addItem(item, data.loot.droprate)
                    end
                end)
            end
        end
    end
end
