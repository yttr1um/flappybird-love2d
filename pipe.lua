local Pipe = {}

function Pipe:load()

    self.width = 100
    self.height = 800

    self.p1 = {}
    self.p1.transform = math.random(-700, -300)
    self.p1.top_y = self.p1.transform
    self.p1.bottom_y = love.graphics.getHeight() + self.p1.transform + 20
    self.p1.x = love.graphics.getWidth()
    
    self.p2 = {}
    self.p2.x = love.graphics.getWidth() * 1.55
    self.p2.transform = math.random(-700, -300)
    self.p2.top_y = self.p2.transform
    self.p2.bottom_y = love.graphics.getHeight() + self.p2.transform + 20

end

function Pipe:update(dt)
    self:move()
end

function Pipe:move()
    self.p1.x = self.p1.x - 1
    self.p2.x = self.p2.x - 1

    if self.p1.x + self.width < 0 then
        self:randomizePipe(self.p1)
    end

    if self.p2.x + self.width < 0 then
        self:randomizePipe(self.p2)
    end
end

function Pipe:randomizePipe(pipe)
    pipe.x = love.graphics.getWidth()
        
    pipe.transform = math.random(-700, -300)

    pipe.top_y = pipe.transform
    pipe.bottom_y = love.graphics.getHeight() + pipe.transform + 20
end

function Pipe:draw()
    love.graphics.setColor(0, 0.7, 0)

    love.graphics.rectangle("fill", self.p1.x, self.p1.top_y, self.width, self.height)
    love.graphics.rectangle("fill", self.p1.x, self.p1.bottom_y, self.width, self.height)

    love.graphics.rectangle("fill", self.p2.x, self.p2.top_y, self.width, self.height)
    love.graphics.rectangle("fill", self.p2.x, self.p2.bottom_y, self.width, self.height)
end

return Pipe