-----------------------------------
-- NAME_HERE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    target:addEnmity(mob, 1, 1800)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.SENTINEL, 190, 0, 30))
    return xi.effect.SENTINEL
end

return mobskillObject
