-----------------------------------
-- xi.effect.MOUNTED
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Retail sends a music change packet (packet ID 0x5F) in both cases.
    if target:isPC() then

        -- TODO: This isn't quite right. The IDs we use for mounts vs what we use for power etc.
        -- seem to be off-by-one.
        if effect:getPower() < 2 then
            if target:getLocalVar('inBattle') == 0 then
                target:changeMusic(4, 212)
            else
                target:changeMusic(4, 247)
            end
            target:setAnimation(xi.anim.CHOCOBO)
        else
            if target:getLocalVar('inBattle') == 0 then
                target:changeMusic(4, 84)
            else
                target:changeMusic(4, 247)
            end
            target:setAnimation(xi.anim.MOUNT)
        end

        -- XISP
        local hasChocobo = target:getCharVar('[XISP]chocoID')
        if hasChocobo > 0 then
            local choco = GetMobByID(hasChocobo)
            if choco then
                target:setLocalVar('ridingOwnChoco', 1)
                choco:setBehavior(bit.band(choco:getBehavior(), bit.bnot(xi.behavior.NO_DESPAWN)))
                DespawnMob(hasChocobo)
            end

            if target:getLocalVar('ownChoco') == 1 then
                target:changeMusic(4, 177) -- Special XISP mount music
            end
        end
        -- Reset chocobo ID
        target:setCharVar('[XISP]chocoID', 0)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setLocalVar('ownChoco', 0)
    target:setAnimation(xi.anim.NONE)

    -- Remove CharVars from player participating in chocobo riding game
    if target:isPC() then
        xi.chocoboGame.dismountChoco(target)

        -- XISP ---------------------
        if target:getLocalVar('ridingOwnChoco') == 1 then
            target:setLocalVar('ridingOwnChoco', 0)
            target:setCharVar('[XISP]chocoboTimer', os.time() + 300) -- 5 minutes
        end

        target:timer(3000, function(targetArg)
            if target:getCharVar('[XISP]hasChocobo') == 1 then
                xi.xispal.spawnChocobo(target, target:getZone())
            end
        end)
        -- --------------------------
    end
end

return effectObject
