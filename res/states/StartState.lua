StartState = Class {__includes = BaseState}

function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function StartState:render()
    
    love.graphics.printf('Press Enter to Start ', 0, 200, VIRTUAL_WIDTH, 'center')

end