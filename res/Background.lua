Background = Class{}

function Background:init()
 
    self.x =0
    self.y =0

end

function Background:render()

    local backgroundWidth = gImages['background']:getWidth()
    local backgroundHeight = gImages['background']:getHeight()
    
    love.graphics.draw(gImages['background'], 
        -- draw at coordinates 0, 0
        self.x, self.y, 
        -- no rotation
        0,
        -- scale factors on X and Y axis so it fills the screen
        VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))

end