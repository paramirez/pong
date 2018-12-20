
local function createBall(radius, velocity, incrementVelocity, x, y)
    local ball = {}
    ball.radius = radius;
    ball.halfRadius = ball.radius / 2;
    ball.velocity = velocity;
    ball.initialVelocity = velocity;
    ball.incrementVelocity = incrementVelocity;
    ball.x = x and x or halfWindowWidth;
    ball.y = y and y or halfWindowHeight;
    ball.left = true;
    ball.top = true;
    ball.updatePositionBall = function(ball)
        ball.x1 = (ball.x - ball.radius);
        ball.x2 = (ball.x + ball.radius);
        ball.y1 = (ball.y - ball.radius);
        ball.y2 = (ball.y + ball.radius);
    end
    ball.updatePositionBall(ball);
    return ball;
end

return {
    initialize = createBall
}