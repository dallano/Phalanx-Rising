-----------------------------------
-- Area: West Ronfaure
--  NPC: Kyanta-Pakyanta, W.W.
-- Type: Outpost Conquest Guards
-- !pos -450.571 -20.807 -219.970 100
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.xispdragon.spawnDragon(npc:getZone())
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
