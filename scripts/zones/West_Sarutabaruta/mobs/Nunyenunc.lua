-----------------------------------
-- Area: West Sarutabaruta (115)
--   NM: Nunyenunc
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.LIGHT_MEVA, 50)
end

entity.onMobSpawn = function(mob)
    xi.nmloot.addDrops(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 251)
end

return entity
