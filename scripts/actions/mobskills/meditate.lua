-----------------------------------
-- Meditate
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local effect = xi.effect.MEDITATE
    local amount   = 12
    local duration = 15 + target:getMod(xi.mod.MEDITATE_DURATION)

    target:addStatusEffect(effect, amount, 3, duration)
    skill:setMsg(xi.msg.basic.NONE)
end

return mobskillObject
