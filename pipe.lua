local Pipe = {}

function Pipe:load()

    self.width = 100
    self.height = 300

    self.top = {y = 0}
    self.bottom = {y = love.graphics.getHeight() - 100 - self.height}

    self.pipe1 = {}
    self.pipe1.x = love.graphics.getWidth()

    self.pipe2 = {}
    self.pipe2.x = love.graphics.getWidth() * 1.55

end

function Pipe:update(dt)
    self:move()
end

function Pipe:move()
    self.pipe1.x = self.pipe1.x - 2
    self.pipe2.x = self.pipe2.x - 2

    if self.pipe1.x + self.width < 0 then
        self.pipe1.x = love.graphics.getWidth()
    end

    if self.pipe2.x + self.width < 0 then
        self.pipe2.x = love.graphics.getWidth()
    end
end

function Pipe:draw()
    love.graphics.setColor(0, 0.7, 0)
    love.graphics.rectangle("fill", self.pipe1.x, self.top.y, self.width, self.height)
    love.graphics.rectangle("fill", self.pipe1.x, self.bottom.y, self.width, self.height)

    love.graphics.rectangle("fill", self.pipe2.x, self.top.y, self.width, self.height)
    love.graphics.rectangle("fill", self.pipe2.x, self.bottom.y, self.width, self.height)
end

return Pipe