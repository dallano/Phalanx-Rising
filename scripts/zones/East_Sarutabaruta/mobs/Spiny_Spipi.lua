-----------------------------------
-- Area: East Sarutabaruta
--   NM: Spiny Spipi
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 253)
end

return entity
