-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--   NM: Doppelganger Gog
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
