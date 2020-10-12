PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.paddle = Paddle(2,3) 
    self.ball = Ball(4)
    self.bricks = LevelMaker.createmap(3)
end
function PlayState:update(dt)
    self.paddle:update(dt)
    self.ball:update(dt)
    for k, brick in  pairs(self.bricks) do
        if self.ball:collides(brick) and brick.inPlay == true then
            if self.ball.dx > 0 and self.ball.y >= brick.y and self.ball.y <= brick.y + brick.height then
                self.ball.x = self.ball.x 
                self.ball.dx = -self.ball.dx
            end 
            if self.ball.dx < 0 and self.ball.y >= brick.y and self.ball.y <= brick.y + brick.height then
                self.ball.x = self.ball.x  
                self.ball.dx = -self.ball.dx
            end 
            if self.ball.dy < 0 and self.ball.x >= brick.x and self.ball.x <= brick.x + brick.width then
                self.ball.y = self.ball.y 
                self.ball.dy = -self.ball.dy
            else
                self.ball.y = self.ball.y 
                self.ball.dy = -self.ball.dy
            end
            
            brick:hit()
        end
    end
    if self.ball:collides(self.paddle) then
        self.ball.dy = - self.ball.dy
        if self.ball.y <= self.paddle.y + 8 then
            self.ball.y = VIRTUAL_HEIGHT - 41
        else
            self.ball.y = VIRTUAL_HEIGHT - 15
        end
        if self.ball.x <= self.paddle.x + self.paddle.width/2 then
            if self.ball.dx < 0 then
                self.ball.dx = -BALL_SPEED - 3*(self.paddle.x + self.paddle.width/2 - self.ball.x) 
            else
                self.ball.dx = BALL_SPEED + 3*(self.paddle.x + self.paddle.width/2 - self.ball.x)
            end
        end
        if self.ball.x > self.paddle.x + self.paddle.width/2 then
            if self.ball.dx > 0 then
                self.ball.dx = BALL_SPEED + 3*(self.ball.x - self.paddle.x - self.paddle.width/2 )   
            else
                self.ball.dx = -BALL_SPEED - 3*(self.ball.x - self.paddle.x - self.paddle.width/2 )
            end
        end
        if self.ball.x < self.paddle.x + self.paddle.width/10 or self.ball.x > self.paddle.x + self.paddle.width*9/10  then
            self.ball.dx = -self.ball.dx 
        end
    end 
    

end

function PlayState:render()
    self.paddle:render()
    self.ball:render()
    for k, brick in pairs(self.bricks) do
        brick:render()
    end
end
