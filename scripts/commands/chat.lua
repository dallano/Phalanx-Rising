-----------------------------------
-- func: chat
-- desc: Communicates with Python chat_npc.py directly, no LuaSocket required
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = "s"
}

commandObj.onTrigger = function(player, message)
    local npc = GetMobByID(player:getCharVar('[XISP]squireID'))

    if not message or message == "" then
        player:printToPlayer("Please enter a message for the chatbot.", xi.msg.channel.SYSTEM_3, '')
        return
    end

    if npc and npc:isAlive() then
        local playerName = player:getName()
        local sanitizedMessage = message:gsub('"', '\\"')

        -- Build the command
        local command = string.format('python chat_npc.py "%s" "%s"', playerName, sanitizedMessage)

        -- Execute the command and capture the output
        local handle = io.popen(command)

        if handle then
            local response = handle:read("*a")
            handle:close()
        end

        -- Clean up response (remove leading/trailing whitespace)
        response = response and response:gsub("^%s*(.-)%s*$", "%1") or ""

        -- Truncate response to 140 characters (optional)
        if #response > 140 then
            response = response:sub(1, 140) .. "..."
        end

        if response ~= "" then
            player:printToPlayer(response, xi.msg.channel.PARTY, npc:getName())
        else
            player:printToPlayer("Chatbot sent an empty response.", xi.msg.channel.SYSTEM_3, '')
        end
    else
        player:printToPlayer("Your squire is not present.", xi.msg.channel.SYSTEM_3, '')
    end
end

return commandObj
