-----------------------------------
-- Area: Tahrongi Canyon
--   NM: Yara Ma Yha Who
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 256)
end

return entity
