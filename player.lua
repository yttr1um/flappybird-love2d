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

    self.falling = false
    self.hit = false

    self.sounds = {}
    self.sounds.flap = love.audio.newSource("sounds/flap.wav", "static")
    self.sounds.score = love.audio.newSource("sounds/point.wav", "static")
    self.sounds.hit = love.audio.newSource("sounds/hit.wav", "static")
    self.sounds.fall = love.audio.newSource("sounds/fall.wav", "static")
end

function Player:update(dt)
    self:applyGravity()
    self:collide()
    self:passPipe(Pipe.p1)
    self:passPipe(Pipe.p2)
end

function Player:incrementScore()
    if self.x + self.width == Pipe.p1.x + Pipe.width / 2 or self.x + self.width == Pipe.p2.x + Pipe.width / 2 then
        self.score = self.score + 1
        self.sounds.score:play()
    end
end

function Player:collide()
    self.falling = false
    if self.y + self.height > Ground.y then
        self.y = Ground.y - self.height
        self:reset()
    end
end

function Player:passPipe(pipe)
    if (self.x + self.width >= pipe.x) and (self.x < pipe.x + Pipe.width) then
        if (self.y + self.height < pipe.bottom_y) and (self.y > pipe.top_y + Pipe.height) then
            self:incrementScore()

        else
            if not self.hit then
                self.sounds.hit:play()
                self.sounds.fall:play()
                self.hit = true
            end
            if not self.falling then 
                self:fall() 
                self.falling = true
            end
        end
    end
end

function Player:reset()
    self.x = love.graphics.getWidth() / 2 - self.width
    self.y = love.graphics.getHeight() / 2
    self.score = 0
    self.hit = false
    Pipe.moving = true
    gamestate = "home"
end

function Player:fall()
    Pipe.moving = false

    if self.y + self.height < Ground.y then
        self.y = self.y + 2
    end

    if self.y + self.height > Ground.y then
        self.falling = false
    end
end

function Player:applyGravity()
    self.gravity = self.gravity + 0.3
    self.y = self.y + self.gravity
end 

function Player:jump(key)
    if not self.falling then
        if key == "space" then 
            self.sounds.flap:play()
            self.gravity = -7
        end
    end
end

function Player:draw()
    love.graphics.setColor(1, 0.9, 0.1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end 

return Player