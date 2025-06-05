xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.ability =
{
    [xi.job.DRG] =
    {
        { id = 1437, recastVar = 'jump',    timer = 60,  lvl = 10, needsTarget = true,  effect = nil, },
        { id = 1428, recastVar = 'warcry',  timer = 300, lvl = 70, needsTarget = false, effect = xi.effect.WARCRY,  },
        { id = 697,  recastVar = 'berserk', timer = 180, lvl = 30, needsTarget = false, effect = xi.effect.BERSERK, },
        { id = 1892, recastVar = 'spirit',  timer = 30,  lvl = 25, needsTarget = false, effect = nil, },
        -- { id = 1891, recastVar = 'provoke', timer = 30,  lvl = 10, needsTarget = true,  effect = nil, },
    },

    [xi.job.PLD] =
    {
        { id = 1428, recastVar = 'warcry',     timer = 300, lvl = 70, needsTarget = false, effect = xi.effect.WARCRY,   },
        { id = 698,  recastVar = 'defender',   timer = 180, lvl = 50, needsTarget = false, effect = xi.effect.DEFENDER, },
        { id = 707,  recastVar = 'sentinel',   timer = 180, lvl = 30, needsTarget = false, effect = xi.effect.SENTINEL, },
        { id = 1431, recastVar = 'shieldBash', timer = 60,  lvl = 15, needsTarget = true,  effect = nil, },
        { id = 1891, recastVar = 'provoke',    timer = 30,  lvl = 10, needsTarget = true,  effect = nil, },
    },

    [xi.job.DRK] =
    {
        { id = 1428, recastVar = 'warcry',     timer = 300, lvl = 70, needsTarget = false, effect = xi.effect.WARCRY,      },
        { id = 697,  recastVar = 'berserk',    timer = 180, lvl = 30, needsTarget = false, effect = xi.effect.BERSERK,     },
        { id = 708,  recastVar = 'lastResort', timer = 300, lvl = 15, needsTarget = false, effect = xi.effect.LAST_RESORT, },
        { id = 709,  recastVar = 'souleater',  timer = 360, lvl = 30, needsTarget = false, effect = xi.effect.SOULEATER,   },
        -- { id = 1891, recastVar = 'provoke',    timer = 30,  lvl = 10, needsTarget = true,  effect = nil, },
        { id = 1432, recastVar = 'weaponBash', timer = 180, lvl = 20, needsTarget = true,  effect = nil, },
    },

    [xi.job.SAM] =
    {
        { id = 1436, recastVar = 'meditate', timer = 180, lvl = 30, needsTarget = false, effect = nil, },
        { id = 1434, recastVar = 'hasso',    timer = 60,  lvl = 35, needsTarget = false, effect = xi.effect.HASSO,    },
        { id = 1435, recastVar = 'seigan',   timer = 60,  lvl = 35, needsTarget = false, effect = xi.effect.SEIGAN,   },
        { id = 1428, recastVar = 'warcry',   timer = 300, lvl = 70, needsTarget = false, effect = xi.effect.WARCRY,   },
        { id = 1891, recastVar = 'provoke',  timer = 30,  lvl = 10, needsTarget = true,  effect = nil, },
        { id = 697,  recastVar = 'berserk',  timer = 180, lvl = 30, needsTarget = false, effect = xi.effect.BERSERK,  },
        { id = 698,  recastVar = 'defender', timer = 180, lvl = 50, needsTarget = false, effect = xi.effect.DEFENDER, },
    },

    [xi.job.NIN] =
    {
        { id = 1430, recastVar = 'innin', timer = 180, lvl = 40, needsTarget = false, effect = xi.effect.INNIN, },
    },
}

xi.xispal.weaponSkills =
{
    [xi.job.DRG] =
    {
        { id = 120, lvl = 71, questRequired = true,  priority = true, }, -- Impulse Drive
        { id = 116, lvl = 49, questRequired = false, priority = true, }, -- Penta Thrust
        { id = 112, lvl = 3,  questRequired = false, priority = false }, -- Double Thrust
    },

    [xi.job.PLD] =
    {
        { id = 42, lvl = 71, questRequired = true,  priority = true, }, -- Savage Blade
        { id = 41, lvl = 65, questRequired = true,  priority = true, }, -- Swift Blade
        { id = 40, lvl = 60, questRequired = true,  priority = true, }, -- Vorpal Blade
        { id = 34, lvl = 15, questRequired = false, priority = false }, -- Red Lotus Blade
        { id = 32, lvl = 3,  questRequired = false, priority = false }, -- Fast Blade
    },

    [xi.job.DRK] =
    {
        { id = 56, lvl = 71, questRequired = true,  priority = true, }, -- Ground Strike
        { id = 55, lvl = 65, questRequired = true,  priority = true, }, -- Spinning Slash
        { id = 53, lvl = 55, questRequired = false, priority = false }, -- Crescent Moon
        { id = 48, lvl = 9,  questRequired = false, priority = false }, -- Power Slash
        { id = 59, lvl = 3,  questRequired = false, priority = false }, -- Hard Slash
    },

    [xi.job.SAM] =
    {
        { id = 152, lvl = 71, questRequired = true,  priority = true, }, -- Tachi: Kasha
        { id = 151, lvl = 65, questRequired = true,  priority = true, }, -- Tachi: Gekko
        { id = 150, lvl = 60, questRequired = true,  priority = false }, -- Tachi: Yukikaze
        { id = 150, lvl = 49, questRequired = false, priority = false }, -- Tachi: Jinpu
        { id = 144, lvl = 3,  questRequired = false, priority = false }, -- Tachi: Enpi
    },

    [xi.job.THF] =
    {
        { id = 25, lvl = 71, questRequired = true,  priority = true, }, -- Evisceration
        { id = 24, lvl = 65, questRequired = true,  priority = true, }, -- Shark Bite
        { id = 17, lvl = 33, questRequired = false, priority = false }, -- Viper Bite
        { id = 16, lvl = 3,  questRequired = false, priority = false }, -- Wasp Sting
    },

    [xi.job.RDM] =
    {
        { id = 42, lvl = 71, questRequired = true,  }, -- Savage Blade
        { id = 41, lvl = 65, questRequired = false, }, -- Swift Blade
        { id = 34, lvl = 15, questRequired = false, priority = false }, -- Red Lotus Blade
        { id = 32, lvl = 3,  questRequired = false, priority = false }, -- Fast Blade
    },
}

xi.xispal.twoHour =
{
    [xi.job.DRG] = { 1893 },
    [xi.job.THF] = { 1013 },
    [xi.job.PLD] = { 1014 },
    [xi.job.DRK] = { 1015 },
    [xi.job.SAM] = { 1020 },
}

xi.xispal.checkAbilities = function(pal, player, job)
    if
        pal:getLocalVar('abilityCooldown') > os.time() or
        (job ~= xi.job.DRG and job ~= xi.job.PLD and job ~= xi.job.SAM and
        job ~= xi.job.DRK and job ~= xi.job.NIN)
    then
        return
    end

    -- 2HR check
    if pal:getHPP() < 25 and player:getCharVar('[XISP]knight2HR') < os.time() then
        pal:setLocalVar('abilityCooldown', os.time() + math.random(8, 12))
        pal:setLocalVar('[XISP]knight2HR', os.time() + 7200)
        pal:useMobAbility(xi.xispal.twoHour[job])
        return
    end

    local castTarget  = pal
    local target      = pal:getTarget()
    local control     = true
    local tankMode    = false
    local playerJob   = player:getMainJob()
    local battleTime  = pal:getBattleTime()
    local palHPP      = pal:getHPP()

    for _, ability in pairs(xi.xispal.ability[job]) do
        local var = ability.recastVar

        -- Skip this ability if recast timer is on cooldown
        if pal:getLocalVar(ability.recastVar) > os.time() then goto skip end

        -- Used by SAM (Will enter a tank mode if player isn't a dedicated tank job)
        if playerJob ~= xi.job.PLD and playerJob ~= xi.job.RUN then
            tankMode = true
        end

        if ability.needsTarget then
            castTarget = target
        end

        -- If the ability has an effect, and pal already has it, don't use ability
        -- Only use targeted abilities while in range
        if
            (ability.effect ~= nil and pal:hasStatusEffect(ability.effect)) or
            (ability.needsTarget and pal:checkDistance(pal:getTarget()) > 12)
        then
            control = false
        end

        -- Logic shared by all jobs
        if var == 'warcry' and battleTime < 30 then
            control = false
        elseif var == 'berserk' and target:getTarget() == pal then
            control = false
        end

        if job == xi.job.PLD then
            if var == 'sentinel' and palHPP >= 50 then
                control = false
            elseif var == 'shieldBash' and target:getCurrentAction() ~= xi.action.MAGIC_CASTING then
                control = false
            end

        elseif job == xi.job.SAM then
            if tankMode then -- If tanking, don't use the following
                if var == 'berserk' or var == 'hasso' then
                    control = false
                end
            else -- if DPS, don't use the following
                if var == 'defender' or var == 'seigan' or var == 'provoke' then
                    control = false
                end
            end

        -- DRK will only use abilites partially into fight and above 80% HP (save weaponbash)
        elseif job == xi.job.DRK then
            if ability.recastVar == 'weaponBash' and target:getCurrentAction() ~= xi.action.MAGIC_CASTING then
                control = false
            else
                if battleTime < 45 or palHPP < 80 then
                    control = false
                end
            end
        end

        -- If not listed above, ability will be used on cooldown relentlessly while in combat.

        if
            pal:getLocalVar(ability.recastVar) < os.time() and
            castTarget and
            control
        then
            ::emergency::
            pal:setLocalVar('abilityCooldown', os.time() + math.random(8, 12))
            pal:setLocalVar(ability.recastVar, os.time() + ability.timer)
            pal:useMobAbility(ability.id, castTarget)
            return
        end

        ::skip::
    end
end

xi.xispal.hasCompletedWeaponQuest = function(player)
    for _, quest in pairs(xi.xispal.afQuests) do
        if player:hasCompletedQuest(quest[1], quest[2]) then
            return true
        end
    end
    return false
end

xi.xispal.checkWeaponSkill = function(pal, target, player, job)
    local weaponskills = {}
    local gate = false -- Used to determine whether older weaponskills should be used

    if pal:getTP() < 1000 then
        return
    end

    -- TODO: Chat telling player they're almost ready
    --       Logic to attempt weapon skills

    for _, skill in pairs(xi.xispal.weaponSkills[job]) do
        if pal:getMainLvl() >= skill.lvl then
            if skill.priority then
                gate = true -- Now we should only add high level Weaponskills
            end

            if skill.questRequired and xi.xispal.hasCompletedWeaponQuest(player) then
                table.insert(weaponskills, skill.id)
            elseif skill.questRequired == false then
                if gate and skill.priority then
                    table.insert(weaponskills, skill.id)
                elseif gate == false then
                    table.insert(weaponskills, skill.id)
                end
            end
        end
    end

    pal:useMobAbility(weaponskills[math.random(1, #weaponskills)], target)
    pal:setTP(0)
end