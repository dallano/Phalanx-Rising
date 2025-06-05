-----------------------------------
-- Kazham's Chieftainess
-- Zilart M3
-----------------------------------
-- !addmission 3 6
-- Gilgamesh        : !pos 122.452 -9.009 -12.052 252
-- Jakoh Wahcondalo : !pos 101 -16 -115 250
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ZILART, xi.mission.id.zilart.KAZHAMS_CHIEFTAINESS)

mission.reward =
{
    keyItem     = xi.ki.SACRIFICIAL_CHAMBER_KEY,
    nextMission = { xi.mission.log_id.ZILART, xi.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.NORG] =
        {
            ['Gilgamesh']  = mission:event(7),
        },

        [xi.zone.KAZHAM] =
        {
            ['Jakoh_Wahcondalo'] = mission:progressEvent(114),

            onEventFinish =
            {
                [114] = function(player, csid, option, npc)
                    local item = xi.xisp.augmentItems[2][math.random(1, #xi.xisp.augmentItems[2])]
                    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, item)
                    player:addItem(item, 1)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
