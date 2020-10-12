ServeState = Class{__includes = BaseState}

function ServeState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function ServeState:render()
    
    love.graphics.printf('Press Enter to Serve ', 0, 200, VIRTUAL_WIDTH, 'center')

end