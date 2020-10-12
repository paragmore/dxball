Brick = Class{}

function Brick:init(x,y,tier,colour)
    self.x = x
    self.y = y
    self.inPlay = true
    self.width = 32
    self.height = 16
    self.tier = tier
    self.colour = colour
end

function Brick:hit()
    if self.tier == 1 then
        self.inPlay = false
    else 
        self.tier = self.tier - 1
        gSounds['brickHit2']:play()
        
    end
    if self.inPlay == false then
        gSounds['brickHit1']:play()
    end
end


function Brick:render()
    if self.inPlay == true then
        love.graphics.draw(gImages['blocks'], gGraphics['bricks'][math.min(self.colour*4 + self.tier,21)], self.x, self.y)
    end
end
