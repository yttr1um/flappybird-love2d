local Player = {}

function Player:load()
    self.radius = 35
    self.x = love.graphics.getWidth() / 2 - self.radius
    self.y = love.graphics.getHeight() / 2

    self.gravity = 300
    self.jumpValue = -150
end

function Player:update(dt)
    self:applyGravity(dt)
end

function Player:applyGravity(dt)
    self.y = self.y + self.gravity * dt
end 

function Player:jump(key)
    if key == "space" then 
        self.y = self.y + self.jumpValue
    end
end

function Player:draw()
    love.graphics.setColor(1, 0.9, 0.1)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end 

return Player