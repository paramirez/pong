local function createPlayers(paddingPlayer)
    local players = {}
    for i = 1, 2 do
        local player = {
            width = 10,
            height = 100,
            y = halfWindowHeight - 50,
            velocity = 5,
            keyUp = i == 1 and "w" or "up",
            keyDown = i == 1 and "s" or "down",
            points = 0
        }
        player.x = i == 1 and paddingPlayer or love.graphics.getWidth() - player.width - paddingPlayer;
        player.id = i == 1 and 1 or 2;
        player.setPosition = function(player, moveX)
            if moveX then
                player.x = i == 1 and paddingPlayer or love.graphics.getWidth() - player.width - paddingPlayer;
                player.y = halfWindowHeight - (player.height / 2);
            else
                player.x2 = player.x + player.width;
                player.y2 = player.y + player.height;
            end
        end
        player.setPosition(player);
        players[i] = player;
    end
    return players
end

return {
    createPlayers = createPlayers
}