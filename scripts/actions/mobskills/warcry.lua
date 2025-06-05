-----------------------------------
-- NAME_HERE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = (math.floor((mob:getMainLvl() / 4) + 4.75) / 256) * 100
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.WARCRY, power, 0, 30))
    return xi.effect.WARCRY
end

return mobskillObject
