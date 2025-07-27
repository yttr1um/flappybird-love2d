local Player = require("player")
local Ground = require("ground")
local Pipe = require("pipe")

math.randomseed(os.time())

function love.load()

    gamestate = "home"

    Player:load()
    Pipe:load()
    Ground:load()
end

function love.update(dt)
    if gamestate == "running" then
        Player:update(dt)
        Pipe:update(dt)
        Ground:update(dt)
    end
end

function love.draw()

    if gamestate == "home" then
        love.graphics.setBackgroundColor(0, 0, 0)
        love.graphics.printf("Flappy Bird", love.graphics.newFont(64),0, 250, love.graphics.getWidth(), "center")
    end

    if gamestate == "running" then
        love.graphics.setBackgroundColor(0.4, 0.6, 0.9)

        Pipe:draw()
        Ground:draw()
        Player:draw()

        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(Player.score, love.graphics.newFont(64), love.graphics.getWidth() / 2, 50, love.graphics.getWidth())

        love.graphics.setColor(1, 1, 1)
    end
end

function love.keypressed(key)

    Player:jump(key)

    if key == "space" then
        if gamestate == "home" then
            gamestate = "running"
        end
    end
end