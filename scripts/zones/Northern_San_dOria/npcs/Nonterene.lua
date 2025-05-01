-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Nonterene
-- Type: Adventurer's Assistant NPC
-- !pos -6.347 0.000 -11.265 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- if player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER) == xi.questStatus.QUEST_ACCEPTED then
    --     player:startEvent(523)
    -- else
    --     player:startEvent(503)
    -- end

    if false then
        return
    end

    -- Despawn all dynamic mobs
    local BODY_OFFSET  = 0x1000
    local HANDS_OFFSET = 0x2000
    local LEGS_OFFSET  = 0x3000
    local FEET_OFFSET  = 0x4000
    local MAIN_OFFSET  = 0x5000
    local SUB_OFFSET   = 0x6000
    local RANGE_OFFSET = 0x7000

    if npc:getLocalVar('control') == 1 then

        for _, mob in pairs(npc:getZone():getMobs()) do
            DespawnMob(mob:getID())
        end
        npc:setLocalVar('control', 0)
        print('Despawned!')
    -- Spawn new set
    else
        print('Spawning!')
        npc:setLocalVar('control', 1)
        local offset = 0
        for i = 249, 290 do
            local zone = npc:getZone()
            local body = string.format("%04X", BODY_OFFSET + 0)
            local hands = string.format("%04X", HANDS_OFFSET + 0)
            local legs = string.format("%04X", LEGS_OFFSET + 0)
            local feet = string.format("%04X", FEET_OFFSET + 0)
            local main = string.format("%04X", MAIN_OFFSET + i)
            local sub = string.format("%04X", SUB_OFFSET + 28)
            local range = string.format("%04X", RANGE_OFFSET)
            local look = "0x0100010100" .. body .. hands .. legs .. feet .. main .. sub .. range .. "80"
            print(look)

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
