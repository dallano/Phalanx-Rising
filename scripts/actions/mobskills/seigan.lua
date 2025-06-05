-----------------------------------
-- SEIGAN
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:delStatusEffect(xi.effect.HASSO)
    mob:delStatusEffect(xi.effect.SEIGAN)

    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.SEIGAN, 0, 0, 300))

    return xi.effect.SEIGAN
end

return mobskillObject
