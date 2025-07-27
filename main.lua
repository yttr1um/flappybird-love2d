local Home = require("home")
local Player = require("player")
local Ground = require("ground")
local Pipe = require("pipe")

math.randomseed(os.time())

function love.load()

    gamestate = "home"

    Home:load()
    Player:load()
    Pipe:load()
    Ground:load()
end

function love.update(dt)

    if gamestate == "home" then Home:update(dt) end

    if gamestate == "running" then
        Player:update(dt)
        Pipe:update(dt)
        Ground:update(dt)
    end
end

function love.draw()

    local font = love.graphics.newFont("flappy.ttf", 88)
    love.graphics.setFont(font)

    if gamestate == "home" then
        Home:draw()
    end

    if gamestate == "running" then
        love.graphics.setBackgroundColor(0.4, 0.6, 0.9)

        Pipe:draw()
        Ground:draw()
        Player:draw()

        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(Player.score, love.graphics.getWidth() / 2, 50, love.graphics.getWidth())

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