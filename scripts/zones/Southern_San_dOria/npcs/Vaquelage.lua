-----------------------------------
-- Area: Southern San dOria
--  NPC: Vaquelage
-- Type: Item Deliverer NPC
-- !pos 17.396 1.699 -29.357 230
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity

local entity = {}

local lootTable =
{
    [1] = {
        { nm = 17215868, loot = { 13014, }, droprate = xi.drop_rate.COMMON      }, -- Leaping Lizzy #1
        { nm = 17215778, loot = { 16296, }, droprate = xi.drop_rate.VERY_COMMON }, -- Tococo
        { nm = 17252725, loot = { 16185, }, droprate = xi.drop_rate.COMMON      }, -- Duke Decapod
        { nm = 17187111, loot = { 13112, }, droprate = xi.drop_rate.UNCOMMON    }, -- Jaggedy-Eared Jack
        { nm = 17211537, loot = { 16486, }, droprate = xi.drop_rate.VERY_COMMON }, -- Stinging Sophie
        { nm = 17252657, loot = { 13607, }, droprate = xi.drop_rate.COMMON      }, -- Spini Spipi
        { nm = 17092889, loot = { 16443, }, droprate = xi.drop_rate.VERY_COMMON }, -- Tom Tit Tat
        { nm = 17248517, loot = { 18394, }, droprate = xi.drop_rate.COMMON      }, -- Nunyenunc
        { nm = 17248588, loot = { 19305, }, droprate = xi.drop_rate.UNCOMMON    }, -- Numbing Norman
        { nm = 17191044, loot = { 2851,  }, droprate = xi.drop_rate.VERY_COMMON }, -- Rambukk
        { nm = 17186927, loot = { 19043, }, droprate = xi.drop_rate.COMMON      }, -- Amanita
    },
    [2] = {
        -- { nm = 17191044, loot = 2851,  droprate = xi.drop_rate.VERY_COMMON },-- Rambukk
        -- { nm = 17186927, loot = 19043, droprate = xi.drop_rate.COMMON      },-- Amanita
        -- { nm = 17191044, loot = 2851,  droprate = xi.drop_rate.VERY_COMMON },-- Rambukk
        -- { nm = 17186927, loot = 19043, droprate = xi.drop_rate.COMMON      },-- Amanita
    },
    [3] = {
        -- { nm = 17191044, loot = 2851,  droprate = xi.drop_rate.VERY_COMMON },-- Rambukk
        -- { nm = 17186927, loot = 19043, droprate = xi.drop_rate.COMMON      },-- Amanita
        -- { nm = 17191044, loot = 2851,  droprate = xi.drop_rate.VERY_COMMON },-- Rambukk
        -- { nm = 17186927, loot = 19043, droprate = xi.drop_rate.COMMON      },-- Amanita
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

-- Function to handle trigger event
entity.onTrigger = function(player, npc)
    -- Call shuffleLootTable with the server seed
    local newTable = shuffleLootTable(GetServerVariable('[XISP]ServerSeed'))

    print(newTable)
end

return entity