-----------------------------------
-- Undersea Scouting
-- Aht Uhrgan Mission 9
-----------------------------------
-- !addmission 4 8
-- Naja Salaheem : !pos 22.700 -8.804 -45.591 50
-----------------------------------

local mission = Mission:new(xi.mission.log_id.TOAU, xi.mission.id.toau.UNDERSEA_SCOUTING)

mission.reward =
{
    keyItem     = xi.ki.ASTRAL_COMPASS,
    nextMission = { xi.mission.log_id.TOAU, xi.mission.id.toau.ASTRAL_WAVES },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = mission:progressEvent(3051, { text_table = 0 })
        },

        [xi.zone.ALZADAAL_UNDERSEA_RUINS] =
        {
            onTriggerAreaEnter =
            {
                [23] = function(player, triggerArea)
                    return mission:progressEvent(1, xi.besieged.getMercenaryRank(player))
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
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
