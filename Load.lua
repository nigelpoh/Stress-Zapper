--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:389a2e1ac78545dc802bed229a175e81:fad53a4397fa727b63e209f803fd2296:467a202b6b41efaa8d13dd59630d06c1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- ajax-loader
            x=2,
            y=2,
            width=42,
            height=42,

        },
    },
    
    sheetContentWidth = 46,
    sheetContentHeight = 46
}

SheetInfo.frameIndex =
{

    ["ajax-loader"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
