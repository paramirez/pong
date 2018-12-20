local function drawPlayer()
    for key, player in pairs(players) do
        love.graphics.setColor({1, 1, 1})
        love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
        love.graphics.print(player.points, key == 1 and halfWindowWidth - 150 or halfWindowWidth + 140, 20)
        love.graphics.line(halfWindowWidth, 0, halfWindowWidth, windowHeight)
    end
end

local function drawBall()
    love.graphics.setColor({1, 1, 1})
    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end

return {
    player = drawPlayer,
    ball = drawBall
}
