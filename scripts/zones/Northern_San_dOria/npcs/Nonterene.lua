-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Nonterene
-- Type: Adventurer's Assistant NPC
-- !pos -6.347 0.000 -11.265 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER) == xi.questStatus.QUEST_ACCEPTED then
        player:startEvent(523)
    else
        player:startEvent(503)
    end

    if true then
        return
    end

    -- Despawn all dynamic mobs
    local BODY_OFFSET  = 0x1000
    local HANDS_OFFSET = 0x2000
    local LEGS_OFFSET  = 0x3000
    local FEET_OFFSET  = 0x4000

    if npc:getLocalVar('control') == 1 then

        for _, mob in pairs(npc:getZone():getMobs()) do
            DespawnMob(mob:getID())
        end
        npc:setLocalVar('control', 0)
        print('done!')
    -- Spawn new set
    else
        npc:setLocalVar('control', 1)
        local offset = 0
        for i = 160, 250 do
            local zone = npc:getZone()
            local body = string.format("%04X", BODY_OFFSET + i)
            local hands = string.format("%04X", HANDS_OFFSET + i)
            local legs = string.format("%04X", LEGS_OFFSET + i)
            local feet = string.format("%04X", FEET_OFFSET + i)
            local look = "0x0100010100" .. body .. hands .. legs .. feet .. "50F96000700000"

            if zone then
                local pal = zone:insertDynamicEntity({
                    objtype               = xi.objType.MOB,
                    allegiance            = xi.allegiance.PLAYER,
                    name                  = "Model Man #" .. i,
                    x                     = -6,
                    y                     = 0,
                    z                     = -10,
                    rotation              = 250,
                    look                  = look,
                    groupId               = 1000,
                    groupZoneId           = xi.zone.GM_HOME,
                    releaseIdOnDisappear  = true,

                    onMobSpawn = function(pal)
                        pal:setRoamFlags(xi.roamFlag.SCRIPTED)
                    end,
                })
                if pal then
                    local pos = pal:getPos()
                    pal:setSpawn(pos.x, pos.y, pos.z + offset)
                    pal:spawn()
                    offset = offset + 1
                end
            end
        end
    end

end

return entity
