local Player = {}

function Player:load()
    self.radius = 35
    self.x = love.graphics.getWidth() / 2 - self.radius
    self.y = love.graphics.getHeight() / 2

    self.gravity = 0
end

function Player:update(dt)
    self:applyGravity()
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
    love.graphics.circle("fill", self.x, self.y, self.radius)
end 

return Player