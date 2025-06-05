-----------------------------------
-- HASSO
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local strboost = mob:getSubLvl() / 7

    mob:delStatusEffect(xi.effect.HASSO)
    mob:delStatusEffect(xi.effect.SEIGAN)

    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.HASSO, strboost, 0, 300))

    return xi.effect.HASSO
end

return mobskillObject
