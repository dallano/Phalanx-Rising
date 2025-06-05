-----------------------------------
-- Innin
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:delStatusEffect(xi.effect.INNIN)
    mob:delStatusEffect(xi.effect.YONIN)

    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.YONIN, 30, 15, 300))

    return xi.effect.YONIN
end

return mobskillObject
