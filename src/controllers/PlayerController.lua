local function move(player, cb)
    if love.keyboard.isDown(player.keyUp) then
        if player.y >= player.velocity then
            player.y = player.y - player.velocity
            player.setPosition(player)
        end
    elseif love.keyboard.isDown(player.keyDown) then
        if player.y + player.height <= windowHeight - player.velocity then
            player.y = player.y + player.velocity
            player.setPosition(player)
        end
    end
end

return {
    move = move,
}
