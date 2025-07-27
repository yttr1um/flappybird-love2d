local Player = require("player")
local Ground = require("ground")
local Pipe = require("pipe")

math.randomseed(os.time())

function love.load()
    Player:load()
    Pipe:load()
    Ground:load()
end

function love.update(dt)
    Player:update(dt)
    Pipe:update(dt)
    Ground:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.6, 0.9)

    Pipe:draw()
    Ground:draw()
    Player:draw()

    love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
    Player:jump(key)
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x< b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end