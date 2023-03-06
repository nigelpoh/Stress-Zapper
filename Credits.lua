display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()

local widget = require("widget")

widget.setTheme( "widget_theme_ios7" )




function scene:createScene(event)

	_W = display.viewableContentWidth
	_H = display.viewableContentHeight
	creditsgroup = self.view

	local backgroundcredit = display.newImageRect("CreditBackground.png",_W,_H)
	backgroundcredit.anchorX = 0
	backgroundcredit.anchorY = 0
	backgroundcredit.width = _W
	backgroundcredit.height = _H
	creditsgroup:insert(backgroundcredit)
	
	local Soptions =
    {
        width = 89.25,
        height = 50,
        numFrames = 4,
        sheetContentWidth = 357,  
        sheetContentHeight = 50  
    }
    local SimageSheet = graphics.newImageSheet( "Flying Saucer Sprite Sheet.png", Soptions )

	local sequenceData =
	{
    name="Flying Saucer",
    start=1,
    count=4,
    time=250,
    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
    loopDirection = "forward"    -- Optional ; values include "forward" or "bounce"
	}

	local UFO = display.newSprite( SimageSheet, sequenceData )

	UFO.anchorX = 0.5
	UFO.anchorY = 0.5
	UFO.x = _W * 0.85
	UFO.y = _H * 0.15
	UFO:scale(1.8,1.8)
	creditsgroup:insert(UFO)
	UFO:play()



	local Banner = display.newImage ("Banner.png")
	Banner.anchorX = 1
	Banner.anchorY = 0.5
	
	Banner.x = UFO.x - UFO.width/2 - 30
	Banner.y = UFO.y 
	creditsgroup:insert(Banner)
	

	-- Location of Ryan Yeo
	local Ryan = display.newImage ("Ryan1.png")
	Ryan.anchorX = 0.5
	Ryan.anchorY = 1
	Ryan.x = _W * 0.666
	Ryan.y = _H * 0.7
	creditsgroup:insert(Ryan)

	-- Location of Nigel Poh
	local Nigel = display.newImage ("Nigel1.png")
	Nigel.anchorX = 0.5
	Nigel.anchorY = 1
	Nigel.x = _W * 0.333
	Nigel.y = _H * 0.7
	creditsgroup:insert(Nigel)

	function onGoBack (event)
	if (event.phase == "ended") then

		local CCClick = audio.loadSound("click.mp3")
		audio.play(CCClick)
		audio.stop(BGMusic)
		storyboard.gotoScene( "menu", {effect = "crossFade", time = 300} )
	end
	end	

	GoBackbutton1 = widget.newButton
{
    width = 120,
    height = 120,
    defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onEvent = onGoBack
}
	GoBackbutton1.x = _W*0.5
	GoBackbutton1.y = _H*0.75
	creditsgroup:insert(GoBackbutton1)

	function RyanListener ( event )
		if (event.phase == "ended") then
			local touchSound1 = audio.loadSound("click.mp3")
			audio.play(touchSound1)

    		RyanBubble = display.newImage ("Ryan Bubble Text.png")
    		RyanBubble:scale(0.9,0.9)
    		RyanBubble.anchorX = 0
    		RyanBubble.anchorY = 1
    		RyanBubble.x = _W * 0.62
    		RyanBubble.y = _H * 0.7 - Ryan.height
    		creditsgroup:insert(RyanBubble)

    		local function DisplayRyanRole( event )
    			RyanBubble.alpha = 0
			end

			ryanTime = timer.performWithDelay( 5000, DisplayRyanRole )
		end
	end


	

	function NigelListener ( event )
		if (event.phase == "ended") then
			local touchSound2 = audio.loadSound("click.mp3")
			audio.play(touchSound2)

    		NigelBubble = display.newImage ("Nigel Bubble Text.png")
    		NigelBubble:scale(0.9,0.9)
    		NigelBubble.anchorX = 0
    		NigelBubble.anchorY = 1
    		NigelBubble.x = 12
    		NigelBubble.y = _H * 0.7 - Nigel.height
    		creditsgroup:insert(NigelBubble)
    		local function DisplayNigelRole( event )
    			NigelBubble.alpha = 0
			end

			nigelTime = timer.performWithDelay( 5000, DisplayNigelRole )
		end
	end

	CRBackgroundMusic = audio.loadSound ("Bach-Air.mp3")
	audio.setVolume(0.3)
	BGMusic = audio.play (CRBackgroundMusic, {channel = 10, loops=-1, fadein=1000 } )


	Ryan:addEventListener( "touch", RyanListener )
	Nigel:addEventListener( "touch", NigelListener )
	

end
function scene:enterScene( event )
	storyboard.purgeScene("menu")
end
function scene:exitScene( event )
	if (nigelTime) then
		timer.cancel(nigelTime)
		nigelTime = nil 
	end
	if (ryanTime) then
		timer.cancel(ryanTime)
		ryanTime = nil
	end
end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene