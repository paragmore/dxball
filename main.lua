require 'res/Dependencies'

function love.load()
    
    love.graphics.setDefaultFilter('nearest' , 'nearest' )
    
    math.randomseed(os.time()) --randomseed

    love.window.setTitle('BreakOut') -- title

    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    love.graphics.setFont(gFonts['small'])

    gImages = {
        ['background'] = love.graphics.newImage('images/background.png'),
        ['blocks'] = love.graphics.newImage('images/breakout.png')
    }

    gGraphics ={
        ['paddles'] = GeneratePaddles(gImages['blocks']),
        ['balls'] = GenerateBalls(gImages['blocks']),
        ['bricks'] = GenerateBricks(gImages['blocks'])
    }

    gSounds = {
        ['brickHit1'] = love.audio.newSource('sounds/brick-hit-1.wav', 'static'),
        ['brickHit2'] = love.audio.newSource('sounds/brick-hit-2.wav', 'static'),
        ['paddleHit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['victory'] = love.audio.newSource('sounds/victory.wav', 'static'),
        ['wallHit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
        ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),

        ['music'] = love.audio.newSource('sounds/music.wav', 'static')

    }

    

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync= true,
        fullscreen = false,
        resizable = true   
    })

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['serve'] = function() return ServeState() end
    }

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w,h)
end

function love.keypressed(key)
    
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)

    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}

end

function love.draw()

    push:apply('start')

    Background:render()
    gStateMachine:render()

    push:apply('end')
end
