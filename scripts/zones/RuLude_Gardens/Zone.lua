-----------------------------------
-- Zone: RuLude_Gardens (243)
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerCuboidTriggerArea(1, -16, 2, 32, 16, 4, 86) -- Palace entrance. Ends at back exit. Needs retail confirmaton for the back entrance.

    zone:insertDynamicEntity({
        objtype   = xi.objType.NPC,
        name      = "Wiseman",
        look      = 2430,
        x         = 1.0,
        y         = 0,
        z         = -66.0,
        rotation  = 60,
        widescan  = 1,

        onTrade = function(player, npc, trade)
            xi.xisp.onAugmentTrade(player, npc, trade)
        end,

        onTrigger  = function(player, npc)
            xi.xisp.onAugmentTrigger(player, npc)
        end,
    })
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(1, 5) + 45
        player:setPos(position, 10, -73, 192)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
