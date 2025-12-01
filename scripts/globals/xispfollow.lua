xi = xi or {}
xi.xispal = xi.xispal or {}

xi.xispal.getFollowTarget = function(pal, player)
    local followers = xi.xispal.getFollowers(player)

    for followerIndex = #followers, 1, -1 do -- Loop through followers
        local follower = GetMobByID(followers[followerIndex])

        if follower and follower == pal then -- Ensure we only arrange logic for ourselves
            if followerIndex > 1 then -- if index == 1 then follow player
                local newIndex = followerIndex

                while newIndex > 1 do
                    local newLeader = GetMobByID(followers[newIndex - 1])

                    if -- See if new Leader is a good candidate as a leader
                        newLeader and
                        newLeader:isAlive() and
                        not newLeader:hasStatusEffect(xi.effect.HEALING)
                    then
                        return newLeader
                    else
                        newIndex = newIndex - 1
                    end
                end
            end
        end
    end

    return player -- Fallback onto player if no other leader was found
end

xi.xispal.follow = function(pal, player)
    local leader = xi.xispal.getFollowTarget(pal, player)
    local lPos   = leader:getPos()
    local posX, posZ = xi.xisp.getPointAroundLoc(lPos, 2, 2)
    local pos    = pal:getPos()
    local dist   = 6
    local job    = pal:getMainJob()

    if player:hasStatusEffect(xi.effect.MOUNTED) then
        dist = 8
    end

    -- Engagement Handling
    if player:isEngaged() then
        local target = player:getTarget()

        for _, mob in pairs(player:getNotorietyList()) do
            if mob:isMob() and mob == target then
                if
                    job ~= xi.job.WHM and
                    job ~= xi.job.BLM and
                    job ~= xi.job.SMN and
                    job ~= xi.job.BRD
                then
                    pal:updateEnmity(target)
                end
            end
        end

    end

    -- Follow Target Handling
    if pal:checkDistance(leader) > 50 then
        pal:setPos(posX, lPos.y, posZ)
    end
    if
        pal:checkDistance(leader) > dist and
        not pal:hasStatusEffect(xi.effect.HEALING) and
        pal:getCurrentAction() ~= xi.action.MAGIC_CASTING
    then
        pal:setLocalVar('isMoving', 1)
        pal:pathTo(posX, lPos.y, posZ, xi.path.flag.RUN)
    else
        pal:setLocalVar('isMoving', 0)
        pal:pathTo(pos.x, pos.y, pos.z)
    end
end