local Player = require("player")

function love.load()
    Player:load()
end

function love.update(dt)
    Player:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.6, 0.9)

    Player:draw()
end