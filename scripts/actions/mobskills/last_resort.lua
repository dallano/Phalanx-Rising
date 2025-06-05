-----------------------------------
-- NAME_HERE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.LAST_RESORT, 0, 0, 180))
    return xi.effect.LAST_RESORT
end

return mobskillObject
