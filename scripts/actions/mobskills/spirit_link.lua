-----------------------------------
-- Spirit Link
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local wyvern = mob:getPet()
    if wyvern then
        if wyvern:getHPP() > 60 or (wyvern:getHPP() < 60 and mob:getHPP() <= 50) then
            return 1
        end
    end
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local wyvern = mob:getPet()

    if wyvern then
        wyvern:delStatusEffect(xi.effect.POISON)
        wyvern:delStatusEffect(xi.effect.BIO)
        wyvern:delStatusEffect(xi.effect.DIA)
        wyvern:delStatusEffect(xi.effect.REQUIEM)
        wyvern:delStatusEffect(xi.effect.BURN)
        wyvern:delStatusEffect(xi.effect.FROST)
        wyvern:delStatusEffect(xi.effect.CHOKE)
        wyvern:delStatusEffect(xi.effect.RASP)
        wyvern:delStatusEffect(xi.effect.SHOCK)
        wyvern:delStatusEffect(xi.effect.DROWN)
        wyvern:delStatusEffect(xi.effect.DOOM)
        wyvern:delStatusEffect(xi.effect.SLEEP_I)
        wyvern:delStatusEffect(xi.effect.SLEEP_II)
        wyvern:delStatusEffect(xi.effect.LULLABY)

        local regenAmount = mob:getMainLvl() / 3
        local petTP       = wyvern:getTP()
        local mobHP       = mob:getHP()
        local drainamount = 0

        wyvern:addStatusEffect(xi.effect.REGEN, regenAmount, 3, 90, 0, 0, 0) -- 90 seconds of regen
        mob:addTP(petTP / 2) -- add half wyvern tp to mob
        wyvern:delTP(petTP / 2) -- remove half tp from wyvern

        -- Calculate amount to take from mob.
        if wyvern:getHP() ~= wyvern:getMaxHP() then
            drainamount = (math.random(25, 35) / 100) * mobHP
            drainamount = drainamount * (1 - (0.01 * mob:getJobPointLevel(xi.jp.SPIRIT_LINK_EFFECT)))
        end

        mob:takeDamage(drainamount)
        skill:setMsg(xi.msg.basic.SELF_HEAL)
        return xi.mobskills.mobHealMove(wyvern, drainamount * 2)
    end

end

return mobskillObject
