local function incrementVelocity()
    ball.velocity = ball.velocity + ball.incrementVelocity
end

local function resetBall(player)
    ball.velocity = ball.initialVelocity
    ball.left = not ball.left
    ball.top = not ball.top
    ball.x = love.graphics.getWidth() / 2
    ball.y = love.graphics.getHeight() / 2
end

local function initializeRebound()
    if ball.x1 < -(ball.radius * 4) or ball.x2 >= windowWidth + (ball.radius * 4) then
        local player = players[ball.x1 < - (ball.radius * 4) and 2 or 1];
        player.points = player.points + 1;
        resetBall();
    end

    if ball.y1 < 0 or ball.y2 >= windowHeight then
        ball.top = not ball.top
    end

    ball.x = ball.left and ball.x - ball.velocity or ball.x + ball.velocity
    ball.y = ball.top and ball.y - ball.velocity or ball.y + ball.velocity
    ball.updatePositionBall(ball)
end

local function handleCollisionWith(position)
    if position == "top" then
        ball.top = true
    elseif position == "bottom" then
        ball.top = false
    elseif position == "left" then
        ball.left = true
    elseif position == "right" then
        ball.left = false
    end
end

local function validYAxisCollision(player)
    if (ball.y1 >= player.y + (player.height / 2)) and (ball.y1 <= player.y2) then
        handleCollisionWith("bottom")
    end
    if (ball.y2 >= player.y) and (ball.y2 <= player.y + (player.height / 2)) then
        handleCollisionWith("top")
    end
end

local function detectCollisionWithPlayer(player)
    -- Para el jugador que este al lado izquierdo
    if ball.x1 < halfWindowWidth and player.x < halfWindowWidth then
        if
            (ball.x1 <= player.x2) and (ball.x1 >= player.x2 - (player.width / 2)) and
                (ball.y1 >= player.y or ball.y2 >= player.y) and
                (ball.y1 <= player.y2 or ball.y2 <= player.y2)
         then
            handleCollisionWith("right")
            incrementVelocity()
        end
        if (ball.x1 <= player.x2 - (player.width / 2)) then
            validYAxisCollision(player)
        end
    end

    -- Para el jugador que este al lado derecho
    if ball.x2 > halfWindowWidth and player.x > halfWindowWidth then
        if
            (ball.x2 >= player.x) and (ball.x2 <= player.x + (player.width / 2)) and
                (ball.y1 >= player.y or ball.y2 >= player.y) and
                (ball.y1 <= player.y2 or ball.y2 <= player.y2)
         then
            handleCollisionWith("left")
            incrementVelocity()
        end
        if (ball.x2 >= player.x + (player.width / 2)) then
            validYAxisCollision(player)
        end
    end
end

return {
    initializeRebound = initializeRebound,
    detectCollisionWithPlayer = detectCollisionWithPlayer
}
