local PlayerModel = require("src/models/Player");
local BallModel = require("src/models/Ball");
local PlayerController = require("src/controllers/PlayerController");
local BallController = require("src/controllers/BallController");
local Paint = require("src/Paint");

function love.load()
    
    windowWidth = 600;
    windowHeight = 400;
    halfWindowWidth = windowWidth / 2;
    halfWindowHeight = windowHeight / 2;
    paddingPlayer = 20;

    love.window.setTitle("pong");
    love.window.setMode(windowWidth, windowHeight);

    players = PlayerModel.createPlayers(paddingPlayer);
    ball = BallModel.initialize(5, 3, 0.1);
    
end

function love.draw()
    love.graphics.setNewFont(20);
    Paint.player();
    Paint.ball();
end

function love.update()
    BallController.initializeRebound();
    for key, player in pairs(players) do
        PlayerController.move(player);
        BallController.detectCollisionWithPlayer(player);
    end
end