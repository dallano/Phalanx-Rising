xi = xi or {}
xi.xispal = xi.xispal or {}

-- Forward declarations (required)
local menu      = {}
local dialogue1 = {}

local menu2     = {}
local dialogue2 = {}

local menu3     = {}
local dialogue3 = {} -- Boys
local dialogue4 = {} -- Girls

local menu4      = {}
local dialogue5  = {} -- Elvaan Male Names
local dialogue6  = {} -- Hume Male Names
local dialogue7  = {} -- Taru M Names
local dialogue8  = {} -- Galka Names
local dialogue9  = {} -- Elvaan F Names
local dialogue10 = {} -- Hume F Names
local dialogue11 = {} -- Taru F Names
local dialogue12 = {} -- Mithra Names

local menu5 = {}
local dialogue13 = {}


local sendMenu = function(player, menuID)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuID)
    end)
end

local race   = ''
local name   = ''

menu =
{
    title = 'Hear more?',
    options = {},
}

dialogue1 =
{
    {
        'I\'m interested.',
        function(playerArg)
            menu2.options = dialogue2
            sendMenu(playerArg, menu2)
            playerArg:printToPlayer("Excellent! What kind of squire are you looking for?", xi.msg.channel.SAY, ' ')
        end,
    },
    {
        'I play solo...',
        function(playerArg)
        end,
    },
}

menu2 =
{
    title = 'A boy or girl?',
    options = {},
}

dialogue2 =
{
    {
        'Boy.',
        function(playerArg)
            menu3.options = dialogue3
            sendMenu(playerArg, menu3)
            gender = 'boy'
            playerArg:printToPlayer("A boy. Understood. Does their appearance matter?", xi.msg.channel.SAY, ' ')
        end,
    },
    {
        'Girl.',
        function(playerArg)
            menu3.options = dialogue4
            sendMenu(playerArg, menu3)
            gender = 'girl'
            playerArg:printToPlayer("A girl. Understood. Does their appearance matter?", xi.msg.channel.SAY, ' ')
        end,
    },
}

menu3 =
{
    title = 'Squire\'s looks:',
    options = {},
}

dialogue3 = -- Boys
{
    {
        'Tall for his age.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.ELVAAN_M)
            race   = '' -- reset previous selections
            race = race .. 'Tall for his age'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue5
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'About average.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.HUME_M)
            race   = '' -- reset previous selections
            race = race .. 'About average'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue6
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'Small as a mouse.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.TARU_M)
            race   = '' -- reset previous selections
            race = race .. 'Small as a mouse'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue7
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'A lumbering oaf.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.GALKA)
            race   = '' -- reset previous selections
            race = race .. 'A lumbering oaf'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue8
            sendMenu(playerArg, menu4)
        end,
    },
}

dialogue4 =
{
    {
        'Tall for her age.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.ELVAAN_F)
            race   = '' -- reset previous selections
            race = race .. 'Tall for her age'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue9
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'About average.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.HUME_F)
            race   = '' -- reset previous selections
            race = race .. 'About average'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue10
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'Small as a mouse.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.TARU_F)
            race   = '' -- reset previous selections
            race = race .. 'Small as a mouse'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue11
            sendMenu(playerArg, menu4)
        end,
    },
    {
        'Nimble on her toes.',
        function(playerArg)
            playerArg:setCharVar('[XISP]squireRace', xi.race.MITHRA)
            race   = '' -- reset previous selections
            race = race .. 'Nimble on her toes'
            playerArg:printToPlayer("Hm... " .. race .. " you say? I think I know someone like that...", xi.msg.channel.SAY, ' ')
            menu4.options = dialogue12
            sendMenu(playerArg, menu4)
        end,
    },
}

menu4 =
{
    title = 'What was their name again?',
    options = {},
}

dialogue5 = -- Elvaan Male
{
    {
        xi.xispal.name[0],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 0)
            name = xi.xispal.name[0]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[1],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 1)
            name = xi.xispal.name[1]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[2],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 2)
            name = xi.xispal.name[2]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[3],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 3)
            name = xi.xispal.name[3]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue6 = -- Hume Male
{
    {
        xi.xispal.name[4],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 4)
            name = xi.xispal.name[4]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[5],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 5)
            name = xi.xispal.name[5]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[6],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 6)
            name = xi.xispal.name[6]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[7],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 7)
            name = xi.xispal.name[7]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue7 = -- Taru Male
{
    {
        xi.xispal.name[8],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 7)
            name = xi.xispal.name[7]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[9],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 9)
            name = xi.xispal.name[9]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[10],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 10)
            name = xi.xispal.name[10]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[11],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 11)
            name = xi.xispal.name[11]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue8 = -- Galka
{
    {
        xi.xispal.name[12],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 12)
            name = xi.xispal.name[12]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[13],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 13)
            name = xi.xispal.name[13]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[14],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 14)
            name = xi.xispal.name[14]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[15],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 15)
            name = xi.xispal.name[15]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue9 = -- Elvaan F
{
    {
        xi.xispal.name[16],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 16)
            name = xi.xispal.name[16]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[17],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 17)
            name = xi.xispal.name[17]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[18],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 18)
            name = xi.xispal.name[18]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[19],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 19)
            name = xi.xispal.name[19]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue10 = -- Hume F
{
    {
        xi.xispal.name[20],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 20)
            name = xi.xispal.name[20]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[21],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 21)
            name = xi.xispal.name[21]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[22],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 22)
            name = xi.xispal.name[22]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[23],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 23)
            name = xi.xispal.name[23]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue11 = -- Taru F
{
    {
        xi.xispal.name[24],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 24)
            name = xi.xispal.name[24]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[25],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 25)
            name = xi.xispal.name[25]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[26],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 26)
            name = xi.xispal.name[26]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[27],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 27)
            name = xi.xispal.name[27]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}
dialogue12 = -- Mithra
{
    {
        xi.xispal.name[28],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 28)
            name = xi.xispal.name[28]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[29],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 29)
            name = xi.xispal.name[29]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[30],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 30)
            name = xi.xispal.name[30]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
    {
        xi.xispal.name[31],
        function(playerArg)
            playerArg:setCharVar('[XISP]squireName', 31)
            name = xi.xispal.name[31]
            playerArg:printToPlayer(name .. "... " .. race .. "... How does that sound?", xi.msg.channel.SAY, ' ')
            menu5.options = dialogue13
            sendMenu(playerArg, menu5)
        end,
    },
}

menu5 =
{
    title = 'How does this look?',
    options = {},
}

dialogue13 =
{
    {
        'Wonderful!',
        function(playerArg)
            playerArg:printToPlayer("Congratulations on your new squire!", xi.msg.channel.SAY, ' ')
            playerArg:setCharVar('[XISP]quest1Var', 1)
            xi.xispal.spawnYoungSquire(playerArg)
        end,
    },
    {
        'Let\'s start again...',
        function(playerArg)
            menu2.options = dialogue2
            sendMenu(playerArg, menu2)
        end,
    },
}

xi.xispal.quest1 = function(player, npc, nation)
    local name = npc:getName()
    local prog = player:getCharVar('[XISP]squireProg')

    if
        player:getNation() == nation and
        player:getCharVar('[XISP]quest1Var') == 0 and
        prog <= 6
    then
        -- Player must be lvl 10 + rank 2
        if player:getMainLvl() < 10 or player:getRank() < 2 then
            player:printToPlayer("Hmm? Here to talk about the squire program? Come back when you have more experience.", xi.msg.channel.SAY, name)
            return
        end

        player:printToPlayer("Adventurer. You've come at a good time. Are you interested in taking on a squire?", xi.msg.channel.SAY, name)

        menu.options = dialogue1
        sendMenu(player, menu)
    else
        player:printToPlayer("How goes your squire? I hope all is in order... Let's see here.", xi.msg.channel.SAY, name)

        if prog == 6 then
            xi.xispal.quest2(player, npc, nation)
        elseif prog == 5 then
            player:printToPlayer("Almost ready for the real world it seems. Keep up the good work, " .. player:getName() .. "!", xi.msg.channel.SAY, name)
        elseif prog == 4 then
            player:printToPlayer("They've learned a lot I see. Those aren't the same eyes I once saw when they first left this place.", xi.msg.channel.SAY, name)
        elseif prog == 3 then
            player:printToPlayer("Still a greenhorn. But noticeable progress. Keep up the good work, adventurer.", xi.msg.channel.SAY, name)
        elseif prog > 0 then
            player:printToPlayer("They've been asking you for favors? Hah! I thought it ought to be the other way around.", xi.msg.channel.SAY, name)
        else
            player:printToPlayer("It seems you two are still just getting to know each other.", xi.msg.channel.SAY, name)
        end
    end
end
