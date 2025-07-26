local Player = require("player")
local Ground = require("ground")

function love.load()
    Player:load()
    Ground:load()
end

function love.update(dt)
    Player:update(dt)
    Ground:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.6, 0.9)

    Ground:draw()
    Player:draw()
end

function love.keypressed(key)
    Player:jump(key)
end