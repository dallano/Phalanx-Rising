-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Crypt Ghost
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
