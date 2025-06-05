---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.xisp.onAugmentTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    xi.xisp.onAugmentTrigger(player, npc)
end

return entity
