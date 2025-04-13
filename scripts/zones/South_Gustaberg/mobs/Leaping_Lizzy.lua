-----------------------------------
-- Area: South Gustaberg
--   NM: Leaping Lizzy
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 200)
end

return entity
