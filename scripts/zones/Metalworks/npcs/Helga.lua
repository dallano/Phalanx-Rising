-----------------------------------
-- Area: Metalworks
--  NPC: Helga
-- Type: XISP Squire Quest Giver
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.xispal.quest1(player, npc, npc:getNation())
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
