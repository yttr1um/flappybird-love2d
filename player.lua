local Player = {}

local Ground = require("ground")
local Pipe = require("pipe")

function Player:load()
    self.width = 75
    self.height = 50
    self.x = love.graphics.getWidth() / 2 - self.width
    self.y = love.graphics.getHeight() / 2
    self.gravity = 0
    self.score = 0
end

function Player:update(dt)
    self:applyGravity()
    self:collide()
    self:incrementScore()
end

function Player:incrementScore()
    if self.x + self.width == Pipe.p1.x + Pipe.width / 2 or self.x + self.width == Pipe.p2.x + Pipe.width / 2 then
        self.score = self.score + 1
    end
end

function Player:collide()
    if self.y + self.height > Ground.y then
        self.y = Ground.y - self.height
        love.event.quit()
    end
end

function Player:applyGravity()
    self.gravity = self.gravity + 0.3
    self.y = self.y + self.gravity
end 

function Player:jump(key)
    if key == "space" then 
        self.gravity = -7
    end
end

function Player:draw()
    love.graphics.setColor(1, 0.9, 0.1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end 

return Player