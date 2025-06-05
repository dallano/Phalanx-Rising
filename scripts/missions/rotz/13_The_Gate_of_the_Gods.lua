-----------------------------------
-- The Gate of the Gods
-- Zilart M13
-----------------------------------
-- !addmission 3 24
-- Shimmering_Circle : !pos 0 -20 147 251
-- RuAun_Gardens     : !zone 130
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ZILART, xi.mission.id.zilart.THE_GATE_OF_THE_GODS)

mission.reward =
{
    nextMission = { xi.mission.log_id.ZILART, xi.mission.id.zilart.ARK_ANGELS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.RUAUN_GARDENS] =
        {
            onZoneIn = function(player, prevZone)
                return 51
            end,

            onEventFinish =
            {
                [51] = function(player, csid, option, npc)
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
