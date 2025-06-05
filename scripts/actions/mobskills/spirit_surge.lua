-----------------------------------
-- Spirit Surge
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getPet() == nil then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local wyvern   = mob:getPet()

    if wyvern then
        local maxHPBoost = wyvern:getMaxHP() * 0.25
        local petHP      = wyvern:getHP()
        local strBoost   = 1 + math.floor(wyvern:getMainLvl() / 5)
        local duration   = 60

        mob:addTP(wyvern:getTP())
        mob:despawnPet()

        if mob:getLocalVar('isPal') then
            mob:setLocalVar('jump', 0)
        end

        mob:addStatusEffect(xi.effect.SPIRIT_SURGE, maxHPBoost, 0, duration, 0, strBoost)
        mob:addHP(petHP) -- Add in wyvern's remaining HP before the wyvern was despawned
        skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.SPIRIT_SURGE, 50, 0, 60))

        return xi.effect.SPIRIT_SURGE
    end
end

return mobskillObject
