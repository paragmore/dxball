LevelMaker = Class{}

function LevelMaker.createmap(level)
    local bricks = {}
    local noRows = math.random(3,6)
    local noColumns = math.random (9,13)
    local x = 0
    local y = 0
    local tier = math.random(level)
    local colour = math.random(level)
    
    for j=1, noRows do
        for i = 1, noColumns do
            b = Brick( (i-1)*32 +8 +(13-noColumns)*32/2 , j*16+8, math.random(tier), colour )
            table.insert(bricks,b)
        end
    end
    return bricks
end

    