local Player = {}

function Player:load()
    self.radius = 35
    self.x = love.graphics.getWidth() / 2 - self.radius
    self.y = love.graphics.getHeight() / 2
end

function Player:update(dt)

end

function Player:draw()
    love.graphics.setColor(1, 0.9, 0.1)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end 

return Player