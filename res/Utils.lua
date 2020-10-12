function GenerateQuads(atlas, tilewidth, tileheight)

    local atlasWidth = atlas:getWidth()
    local atlasHeight = atlas:getHeight()
    
    local xcounter = atlasWidth/ tilewidth -1
    local ycounter = atlasHeight/ tileheight -1
    local counter = 1

    local quads = {}

    for i=0, ycounter do
        for j=0, xcounter do
            quads[counter] = love.graphics.newQuad(j * tilewidth, i * tileheight, tilewidth, tileheight, atlas:getDimensions())
            counter = counter +1
        end
    end
    return quads
end

function table.slice(tbl, first, last, step)
    local sliced = {}
  
    for i = first or 1, last or #tbl, step or 1 do
      sliced[#sliced+1] = tbl[i]
    end
  
    return sliced
end

function GenerateBricks(atlas)
    return table.slice(GenerateQuads(atlas, 32 , 16), 1, 21)
end

function GeneratePaddles(atlas)

    local quads = {}
    local counter = 1
    local x = 0
    local y = 0
    for type = 1, 4 do
        y = 64 + 32*(type-1)
        for size = 1 , 4 do
            x = x + 32* (size-1)
            if x == 32*6 then
                x = 0
                y = y + 16
            end
            quads[counter] = love.graphics.newQuad( x , y, 32 * size , 16 , atlas:getDimensions())
            
            counter = counter + 1 
        end
    end
    return quads
end

function GenerateBalls(atlas)

    local quads = {}
    local counter = 1 
    local x = 3* 32
    local y = 3* 16
    
    for i = 0, 1 do    
        for type = 1 , 4 do
            quads[counter] = love.graphics.newQuad( x + 8* (type-1) , y + 8* i, 8 , 8, atlas:getDimensions() )
            counter = counter +1
        end
    end
    return quads
end
    

    