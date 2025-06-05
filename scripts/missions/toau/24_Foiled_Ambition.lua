-----------------------------------
-- Foiled Ambition
-- Aht Uhrgan Mission 24
-----------------------------------
-- !addmission 4 23
-----------------------------------

local mission = Mission:new(xi.mission.log_id.TOAU, xi.mission.id.toau.FOILED_AMBITION)

mission.reward =
{
    item        = { { xi.item.IMPERIAL_GOLD_PIECE, 5 } },
    title       = xi.title.KARABABAS_SECRET_AGENT,
    nextMission = { xi.mission.log_id.TOAU, xi.mission.id.toau.PLAYING_THE_PART },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and
                not mission:getMustZone(player) and
                VanadielUniqueDay() >= mission:getVar(player, 'Timer')
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [3] = function(player, triggerArea)
                    return mission:progressEvent(3097, { text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [3097] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        local item = xi.xisp.augmentItems[2][math.random(1, #xi.xisp.augmentItems[2])]
                        player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, item)
                        player:addItem(item, 1)
                        player:setLocalVar('Mission[4][24]mustZone', 1)
                        player:setCharVar('Mission[4][24]Timer', VanadielUniqueDay() + 1)
                    end
                end,
            },
        },
    },
}

return mission
