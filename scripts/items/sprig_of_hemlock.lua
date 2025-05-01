-----------------------------------
-- ID: 5985
-- Item: Sprig of Hemlock
-- Effect: XISP - resurrects a fallen pal.
-----------------------------------

---@type TItem
local itemObject = {}
------------------------------------------------------------------
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
    xi.xispal.resurrect(target)
end
------------------------------------------------------------------

return itemObject
