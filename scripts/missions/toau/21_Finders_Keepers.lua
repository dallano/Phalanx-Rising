-----------------------------------
-- Finders Keepers
-- Aht Uhrgan Mission 21
-----------------------------------
-- !addmission 4 20
-- Naja Salaheem : !pos 22.700 -8.804 -45.591 50
-----------------------------------

local mission = Mission:new(xi.mission.log_id.TOAU, xi.mission.id.toau.FINDERS_KEEPERS)

mission.reward =
{
    nextMission = { xi.mission.log_id.TOAU, xi.mission.id.toau.SHIELD_OF_DIPLOMACY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [3] = function(player, triggerArea)
                    return mission:progressEvent(3093, 1, 1, 0, 0, 0, 0, 0, 0, 0)
                end,
            },

            onEventFinish =
            {
                [3093] = function(player, csid, option, npc)
                    mission:complete(player)
                    local item = xi.xisp.augmentItems[2][math.random(1, #xi.xisp.augmentItems[2])]
                    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, item)
                    player:addItem(item, 1)
                end,
            },
        },
    },
}

return mission
