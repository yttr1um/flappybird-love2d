local Home = {}

function Home:load()
    self.title = {}
    self.title.x = 0
    self.title.y = 250
end

function Home:update(dt)

end

function Home:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.printf("Flappy Bird", self.title.x, self.title.y, love.graphics.getWidth() ,"center")
end

return Home