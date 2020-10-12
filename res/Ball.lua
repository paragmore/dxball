Ball = Class{}

function Ball:init(type)
    self.x = VIRTUAL_WIDTH / 2 -8
    self.y = VIRTUAL_HEIGHT - 40
    self.width = 8
    self.height = 8
    self.dx = BALL_SPEED
    self.dy = BALL_SPEED
    self.type = type
end

function Ball:collides(target)

    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    return true
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.x > VIRTUAL_WIDTH - 8 then
        self.x = VIRTUAL_WIDTH - 8
        self.dx = - self.dx
    end

    if self.x < 0 then
        self.x = 0
        self.dx = - self.dx
    end

    if self.y > VIRTUAL_HEIGHT - 8 then
        --gStateMachine:change('serve')
        self.y = VIRTUAL_HEIGHT - 8
        self.dy = - self.dy
    end

    if self.y < 0 then
        self.y = 0
        self.dy = - self.dy
    end

end

function Ball:render()
    love.graphics.draw(gImages['blocks'], gGraphics['balls'][self.type], self.x, self.y)
end