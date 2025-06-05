-----------------------------------
-- NAME_HERE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local duration = 30
    if mob:getLocalVar('isPal') then
        duration = 15
    end

    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.SOULEATER, 1, 0, duration))
    return xi.effect.SOULEATER
end

return mobskillObject
