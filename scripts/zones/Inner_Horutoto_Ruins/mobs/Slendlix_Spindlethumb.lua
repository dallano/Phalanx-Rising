-----------------------------------
-- Area: Inner Horutoto Ruins
--   NM: Slendlix Spindlethumb
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 289)
    xi.magian.onMobDeath(mob, player, optParams, set{ 430 })
end

return entity
