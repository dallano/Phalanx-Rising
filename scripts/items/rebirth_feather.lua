-----------------------------------
-- ID: 5259
-- Item: Rebirth Feather
-- Status Effect: Revive Pal (XISP)
-----------------------------------
---@type TItem
local itemObject = {}

-- XISP
itemObject.onItemCheck = function(target, item, param, caster)
    local party = xi.xispal.getParty(caster)

    if party then
        for _, member in pairs(party) do
            if not member:isAlive() then
                return 0
            end
        end
    end

    return 1
end

itemObject.onItemUse = function(target)
    xi.xispal.resurrect(target, 2)
end

return itemObject
