-----------------------------------
-- Area: Palborough Mines
--   NM: Zi'Ghi Boneeater
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 220)
    xi.magian.onMobDeath(mob, player, optParams, set{ 578 })
end

return entity
