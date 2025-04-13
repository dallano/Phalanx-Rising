-----------------------------------
-- Area: West Ronfaure (100)
--   NM: Jaggedy-Eared Jack
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 148)
end

return entity
