
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()

local widget = require("widget")

widget.setTheme( "widget_theme_ios7" )


_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
	local group = self.view

	local background = display.newImageRect("Background5.png",_W,_H)
	background.anchorX = 0
	background.anchorY = 0
	background.width = _W
	background.height = _H
	group:insert(background)
local options = {
    width = 100,
    height = 100,
    numFrames = 12,
    sheetContentWidth = 1200,
    sheetContentHeight = 100
}
TextLoad = display.newImage("LoadingText.png")
TextLoad.x = _W/1.22
TextLoad.y = _H/2 + 100
group:insert(TextLoad)

	local function Black1()
	Black1 = display.newImage("StressFree1.png")	
	Black1.anchorX = 0
	Black1.anchorY = 0
	Black1.x = _W/2+75
	Black1.y = _H/2-100
	group:insert(Black1)
	end
	local function Blue()
	Blue = display.newImage("StressFree2.png")	
	Blue.anchorX = 0
	Blue.anchorY = 0
	Blue.x = _W/2+75
	Blue.y = _H/2-100
	group:insert(Blue)
	end
	local function White()
	White = display.newImage("StressFree3.png")	
	White.anchorX = 0
	White.anchorY = 0
	White.x = _W/2+75
	White.y = _H/2-100
	group:insert(White)
	end
	local function Pink()
	Pink = display.newImage("StressFree4.png")	
	Pink.anchorX = 0
	Pink.anchorY = 0
	Pink.x = _W/2+75
	Pink.y = _H/2-100
	group:insert(Pink)
	end
	local function Brown()
	Brown = display.newImage("StressFree5.png")
	Brown.anchorX = 0
	Brown.anchorY = 0
	Brown.x = _W/2+75
	Brown.y = _H/2-100
	group:insert(Brown)
	end
	local function Black2()
	Black2 = display.newImage("StressFree6.png")	
	Black2.anchorX = 0
	Black2.anchorY = 0
	Black2.x = _W/2+75
	Black2.y = _H/2-100
	group:insert(Black2)
	end
	local function Transition()
	storyboard.gotoScene("ThreeGems",{effect = "crossFade", time = 300} ) 
	end
	Black1()
	timer.performWithDelay(500,Blue,1)
	timer.performWithDelay(1000,White,1)
	timer.performWithDelay(1500,Pink,1)
	timer.performWithDelay(2000,Brown,1)
	timer.performWithDelay(2500,Black2,1)
	timer.performWithDelay(3000,Transition,1)
end
function scene:enterScene( event )
	storyboard.purgeScene("ThreeGems")
end
function scene:exitScene( event )
end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene