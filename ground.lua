local Ground = {}

function Ground:load()
    self.width = love.graphics.getWidth()
    self.height = 100
    self.x = 0
    self.y = love.graphics.getHeight() - self.height
end

function Ground:update(dt)

end

function Ground:draw()
    love.graphics.setColor(0, 0.9, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    love.graphics.setColor(0.85, 0.8, 0.5)
    local dirt_height = 80
    local dirt_y = love.graphics.getHeight() - dirt_height
    love.graphics.rectangle("fill", self.x, dirt_y, self.width, dirt_height)
end

return Ground