-----------------------------------
-- xi.effect.DIVINE_SEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Overwrites
    target:delStatusEffectSilent(xi.effect.DARK_SEAL)
    target:delStatusEffectSilent(xi.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(xi.effect.ELEMENTAL_SEAL)
    -- XISP
    target:setMod(xi.mod.STONESKIN, target:getMainLvl() * 10)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
