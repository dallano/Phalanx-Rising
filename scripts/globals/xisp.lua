xi = xi or {}
xi.xisp = xi.xisp or {}

xi.xisp.seed_random = function(initial_seed)
    local seed = initial_seed
    local available = {}
    local max = 0

    -- Initialize available numbers from 1 to max
    local function initializeAvailable(new_max)
        available = {}  -- Reset available list each time we need it
        max = new_max
        for i = 1, max do
            table.insert(available, i)
        end
    end

    -- Step 2: Random function that returns values from the available list
    local function random(new_max)
        -- If max is different from the table size, reinitialize the available list
        if max ~= new_max then
            initializeAvailable(new_max)
        end

        if #available == 0 then
            return nil
        end

        -- Advance the seed
        seed = (1103515245 * seed + 12345) % 2^31
        local r = seed / 2^31

        -- Pick a random index from available
        local idx = math.floor(r * #available) + 1
        local number = available[idx]

        -- Remove the chosen number to prevent duplicates
        table.remove(available, idx)

        return number
    end

    return random
end


xi.xisp.setSeed = function()
    local seed  = GetServerVariable('[XISP]ServerSeed')

    if seed == 0 then
        SetServerVariable('[XISP]ServerSeed', os.time())
        seed = GetServerVariable('[XISP]ServerSeed')
    end
end
