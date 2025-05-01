-----------------------------------
-- Area: West Ronfaure
--  NPC: Kyanta-Pakyanta, W.W.
-- Type: Outpost Conquest Guards
-- !pos -450.571 -20.807 -219.970 100
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
<<<<<<<< HEAD:scripts/zones/West_Ronfaure/npcs/Laillera.lua
    xi.xispdragon.spawnDragon(npc:getZone())
========
    xi.xispal.quest1(player, npc, xi.nation.SANDORIA)
>>>>>>>> b31ce3374fb588161c3b2896f589c5b801027cca:scripts/zones/Chateau_dOraguille/npcs/Milchupain.lua
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
