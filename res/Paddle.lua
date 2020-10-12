Paddle = Class{}

function Paddle:init( type, size)
    
    self.x = VIRTUAL_WIDTH/2 - 32
    self.y = VIRTUAL_HEIGHT - 32 
    self.dx = 0
    self.height = 16
    self.type = type
    self.size = size
    self.width = self.size*32
    
end

function Paddle:update(dt)

    if love.keyboard.isDown('left') then
        self.dx = self.dx - PADDLE_SPEED * dt
        self.x = self.x + self.dx
    end
    self.dx = 0

    if love.keyboard.isDown('right') then
        self.dx = self.dx + PADDLE_SPEED * dt
        self.x = self.x + self.dx
    end
    self.dx = 0
    
    if self.x <= 0 then 
        self.x = 0
    end

    if self.x>= VIRTUAL_WIDTH - self.size*32 then
        self.x = VIRTUAL_WIDTH - self.size*32
    end
end
function Paddle:render()
    love.graphics.draw(gImages['blocks'], gGraphics['paddles'][self.size + (self.type-1)*4], self.x, self.y )
end
