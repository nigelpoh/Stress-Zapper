
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()

local widget = require("widget")

widget.setTheme( "widget_theme_ios7" )


function scene:createScene(event)
--Runtime:hideErrorAlerts()
w = display.viewableContentWidth
h = display.viewableContentHeight	
GTgroup = self.view

bgMusic1 = audio.loadSound("MainMenuSong.mp3")
GTClick = audio.loadSound("click.mp3")
GTZapChannel = audio.loadSound("bellring1.mp3")
GTSwipe = audio.loadSound("swipe1.mp3")
audio.setVolume(0.5)
audio.setVolume(0.5, {channel = 16})
bgMusicPlay1 = audio.play(bgMusic1, { channel=16, loops=-1, fadein=500 })

local  centerX = w/2
local  centerY = h/2


-- easy color codes and string translations
local  _TRANSPARENT_ = {0, 0, 0, 0}
local  _WHITE_ = {1, 1, 1, 1}
local  _BLACK_ = {0, 0, 0, 1}
local  _GREY_      = {0.5, 0.5, 0.5, 1}
local  _DARKGREY_  = {0.25, 0.25, 0.25, 1}
local  _DARKERGREY_  = {0.125, 0.125, 0.125, 1}
local  _LIGHTGREY_ = {0.75, 0.75, 0.75, 1}
local  _RED_   = {1, 0, 0, 1}
local  _GREEN_ = {0, 1, 0, 1}
local  _BLUE_  = {0, 0, 1, 1}
local  _CYAN_  = {0, 1, 1, 1}
local  _YELLOW_       = {1, 1, 0, 1}
local  _ORANGE_       = {1, 0.4, 0, 1}
local  _BRIGHTORANGE_ = {1, 0.6, 0, 1}
local  _PURPLE_       = {0.625, 0.125, 0.9375, 1}
local  _PINK_         = {1, 0.43, 0.7773, 1}


-- Localizing math functions for speedup!
local mDeg  = math.deg
local mRad  = math.rad
local mCos  = math.cos
local mSin  = math.sin
local mAcos = math.acos
local mAsin = math.asin
local mSqrt = math.sqrt
local mCeil = math.ceil
local mFloor = math.floor
local mAtan2 = math.atan2
local mPi = math.pi

function angle2Vector( angle )
	local screenAngle = mRad(-(angle+90))
	local x = mCos(screenAngle) 
	local y = mSin(screenAngle) 
	return { x=-x, y=y }
end

-- ==
--    scale( ..., scale [ , altRet ]) - Calculates a scaled vector scale * <x1, y1> = <scale * x1, scale * y1>
-- ==
function scale( ... ) 
	if( type(arg[1]) == "number" ) then
		local x,y = arg[1] * arg[3], arg[2] * arg[3]

		if(arg[4]) then
			return { x=x, y=y }
		else
			return x,y
		end
	else
		local x,y = arg[1].x * arg[2], arg[1].y * arg[2]
			
		if(arg[3]) then
			return x,y
		else
			return { x=x, y=y }
		end
	end
end

-- ==
--    add( ... [ , altRet ]) - Calculates the sum of two vectors: <x1, y1> + <x2, y2> == <x1 + x2 , y1 + y2>
-- ==
function add( ... ) 
	if( type(arg[1]) == "number" ) then
		local x,y = arg[1] + arg[3], arg[2] + arg[4]

		if(arg[5]) then
			return { x=x, y=y }
		else
			return x,y
		end
	else
		local x,y = arg[1].x + arg[2].x, arg[1].y + arg[2].y
			
		if(arg[3]) then
			return x,y
		else
			return { x=x, y=y }
		end
	end
end

-- ==
--    round(val, n) - Rounds a number to the nearest decimal places. (http://lua-users.org/wiki/FormattingNumbers)
--    val - The value to round.
--    n - Number of decimal places to round to.
-- ==
function _G.round(val, n)
  if (n) then
    return math.floor( (val * 10^n) + 0.5) / (10^n)
  else
    return math.floor(val+0.5)
  end
end



-- ==
--     Create Groups For Layering
-- ==

--local backGroup1 = display.newGroup()
local flyGroup1 = display.newGroup()
local mainGroup1 = display.newGroup()


-- ==
--     Add background image for contrast
-- ==
local backImage = display.newImageRect( "Background1.png", w, h )
backImage.width = w
backImage.height = h

backImage.x = centerX
backImage.y = centerY
backImage.alpha = 0.4
GTgroup:insert(backImage)
--backImage.rotation = 90


-- Main Button Used to open close 'menu'
local mb = display.newImageRect( mainGroup1, "Game.png", 180, 180)
mb.x = w * 0.5
mb.y = h * 0.5

--GTgroup:insert(mb)
--mb:toFront()
-- 'Menu' Buttons that fly out
local Image = {}
Image[1] = "WhackyMolly.png"
Image[2] = "AnimalJems.png"
Image[3] = "FingerTwister.png"
Image[4] = "BackMainMenu.png"
local buttonAngles = { 0, 90, 180, 270 }

local openPositions = {}
for i = 1,  #Image do
	local vec = angle2Vector( buttonAngles[i] )

	vec = scale( vec, w*0.3 )
	
	vec = add( vec, mb )

	vec.x = round(vec.x)
	vec.y = round(vec.y)
	
	openPositions[i] = vec
end

local flyButtons = {}
for i = 1,  #Image do
	
	local fb = display.newImage(flyGroup1, Image[i], 40, 40)
	fb:scale(0.35,0.35)
	fb.x = mb.x --openPositions[i].x
	fb.y = mb.y --openPositions[i].y
	
	

	fb.x0 = mb.x
	fb.y0 = mb.y

	fb.x1 = openPositions[i].x
	fb.y1 = openPositions[i].y

	flyButtons[i] = fb
end


local flyTimeX = 250
local flyTimeY = 250

local xEasing = easing.inOutBounce
local yEasing = easing.inOutBounce

function Openia()
	if dingG then
		audio.stop(dingG)
	end
	audio.setVolume (0.5, {channel = 17})
	audio.play(GTSwipe, {channel = 17})
--local button1 = flyButtons[1]
				transition.to( button1, { x = button1.x0, time = flyTimeX, rotation = -360, transition =  xEasing  } )
				transition.to( button1, { y = button1.y0, time = flyTimeY, rotation = -360, transition =  yEasing  } )
				--local button2 = flyButtons[2]
				transition.to( button2, { x = button2.x0, time = flyTimeX, rotation = -360, transition =  xEasing  } )
				transition.to( button2, { y = button2.y0, time = flyTimeY, rotation = -360, transition =  yEasing  } )
				--local button3 = flyButtons[3]
				transition.to( button3, { x = button3.x0, time = flyTimeX, rotation = -360, transition =  xEasing  } )
				transition.to( button3, { y = button3.y0, time = flyTimeY, rotation = -360, transition =  yEasing  } )
				--local button4 = flyButtons[4]
				transition.to( button4, { x = button4.x0, time = flyTimeX, rotation = -360, transition =  xEasing  } )
				transition.to( button4, { y = button4.y0, time = flyTimeY, rotation = -360, transition =  yEasing  } )
				
	end

mb.touch = function( self, event )

	if(event.phase == "began") then
		
		
		
		
		local fly2 = flyButtons[2]
				
		local function WhackyMolly()
		clickg1 = audio.loadSound("click.mp3")
		audio.setVolume (0.3, {channel = 4})
		clickgA = audio.play(clickg1, {channel = 4})
		display.remove(mb)
		audio.stop(bgMusicPlay1)
		storyboard.gotoScene("WhackyMolly" ,{effect = "crossFade", time = 300})
		
		end
		local function ThreeGems()
		clickg2 = audio.loadSound("click.mp3")
		audio.setVolume (0.3, {channel = 5})
		clickgB = audio.play(clickg2, {channel = 5})
		display.remove(mb)
		audio.stop(bgMusicPlay1)
		storyboard.gotoScene("ThreeGems", {effect = "crossFade", time = 300})
		
		end
		local function FingerTwister()
		clickg3 = audio.loadSound("click.mp3")
		audio.setVolume (0.3, {channel = 6})
		clickgC = audio.play(clickg3, {channel = 6})
		display.remove(mb)
		audio.stop(bgMusicPlay1)
		storyboard.gotoScene("FingerTwister", {effect = "crossFade", time = 300})
		
		end
		local function Back()
		clickg4 = audio.loadSound("click.mp3")
		audio.setVolume (0.3, {channel = 7})
		clickgD = audio.play(clickg4, {channel = 7})
		display.remove(mb)
		audio.stop(bgMusicPlay1)
		storyboard.gotoScene("menu", {effect = "crossFade", time = 300})
		
		end
		-- In closed position?
		if( fly2.x == fly2.x0 ) then
			
			audio.setVolume (0.3, {channel = 18})
			dingG = audio.play( ZapChannel, {channel = 18})
			
			-- Fly out to openia position
			--for i = 1, #flyButtons do
				button1 = flyButtons[1]
				--button1.isHitTestable = false
				transition.to( button1, { x = button1.x1, time = flyTimeX, rotation = 360, transition =  xEasing } )
				transition.to( button1, { y = button1.y1, time = flyTimeY, rotation = 360, transition =  yEasing  } )
				--button1.isHitTestable = true
				button1:addEventListener("touch", WhackyMolly)
				
		
				GTgroup:insert(button1)
				function Button2() 
				button2 = flyButtons[2]
				--button2.isHitTestable = false
				transition.to( button2, { x = button2.x1, time = flyTimeX, rotation = 360, transition =  xEasing } )
				transition.to( button2, { y = button2.y1, time = flyTimeY, rotation = 360, transition =  yEasing  } )
				--button2.isHitTestable = true
				button2:addEventListener("touch", ThreeGems)
				
		
				GTgroup:insert(button2)
				end
				function Button3()
				button3 = flyButtons[3]
				--button3.isHitTestable = false
				transition.to( button3, { x = button3.x1, time = flyTimeX, rotation = 360, transition =  xEasing } )
				transition.to( button3, { y = button3.y1, time = flyTimeY, rotation = 360, transition =  yEasing  } )
				--button3.isHitTestable = true
				button3:addEventListener("touch", FingerTwister)
				
		
				GTgroup:insert(button3)
				end
				function Button4()
				button4 = flyButtons[4]
				--button4.isHitTestable = false
				transition.to( button4, { x = button4.x1, time = flyTimeX, rotation = 360, transition =  xEasing } )
				transition.to( button4, { y = button4.y1, time = flyTimeY, rotation = 360, transition =  yEasing  } )
				--button4.isHitTestable = true
				button4:addEventListener("touch", Back)
				
		
				GTgroup:insert(button4)
				end
				
				timer.performWithDelay(flyTimeY+100, Button2, 1)
				timer.performWithDelay(flyTimeY*2+100, Button3, 1)
				timer.performWithDelay(flyTimeY*3+100, Button4, 1)

			--end

		-- Nope, in openia position
		
		


		else

			
			-- Fly in to closed position
				
			Openia()

		end

	end
	--GTgroup:insert(mb)
	mb:toFront()
	return true
	end
	
	

mb:addEventListener( "touch", mb )

end       
function scene:enterScene( event )
	 storyboard.purgeScene("menu")
	 storyboard.purgeScene("ThreeGems")
	 storyboard.purgeScene("WhackyMolly")
	 storyboard.purgeScene("FingerTwister")
end
function scene:exitScene( event )
	audio.stop(bgMusicPlay1)

end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene