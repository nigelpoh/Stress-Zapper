display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()

local sqlite = require("sqlite3")

local widget = require("widget")

widget.setTheme( "widget_theme_ios7" )

_W = display.viewableContentWidth
_H = display.viewableContentHeight




function scene:createScene(event)

local WMgroup = self.view

path = system.pathForFile("StressZapper.sqlite",system.DocumentsDirectory)
db = sqlite.open(path)
db:exec("CREATE TABLE IF NOT EXISTS WhackyMolly(id INTEGER PRIMARY KEY, Moles);")
for row in db:nrows("SELECT COUNT(id) AS count FROM WhackyMolly") do 
	if (row.count == 0) then
		local sql = [[INSERT INTO WhackyMolly ("Moles") VALUES("0");]]
		db:exec(sql)
   	
	end
end

WMClick = audio.loadSound("click.mp3")
local bg = display.newImageRect('bgWhackyMolly.png',_W,_H)
bg.anchorX = 0
bg.anchorY = 0
WMgroup:insert(bg)
bye = 0
local heart1 = display.newImage("Heart1.png")
heart1.anchorX = 0
heart1.anchorY = 0
heart1.x = _W/30
heart1.y = _H/30
heart1:scale(0.1,0.1)
WMgroup:insert(heart1)
local heart2 = display.newImage("Heart1.png")
heart2.anchorX = 0
heart2.anchorY = 0
heart2.x = _W/8
heart2.y = _H/30
heart2:scale(0.1,0.1)
WMgroup:insert(heart2)
local heart3 = display.newImage("Heart1.png")
heart3.anchorX = 0
heart3.anchorY = 0
heart3.x = _W/4.7
heart3.y = _H/30
heart3:scale(0.1,0.1)
WMgroup:insert(heart3)
HitCount = 0
local titleBg
local playBtn
local creditsBtn
local titleView
local score
local m1,m2,m3,m4,m5,m6,m7,m8
local moles
local lastMole = {}
local hit = audio.loadSound('MoleHit.mp3',{channel = 9})

local timerSource
currentmoles = 0
local molesHit = 0
local totalMoles = 100000

local Main = {}
local startButtonListeners = {}
local showGameView = {}
local prepareMoles = {}
local startTimer = {}
local showMole = {}
local popOut = {}
local moleHit = {}
local alert = {}
countLoop = 0


function Moles()
	display.remove(CountDown1)


function Main()
	startButtonListeners('add')
end -- Main ()

function startButtonListeners(action)
	if(action == 'add') then
		showGameView()
	
	end -- end for if
end -- end for startButtonListeners


function showGameView(e)
	score = display.newText('0 moles', 58, 6, native.systemFontBold, 30)
	score:setTextColor(238/255, 238/255, 238/255)
	score.x = _W/2
	score.y = _H/100
	prepareMoles()
	WMgroup:insert(score)
end -- end showGameView

--RECTIFY PROBLEM
function prepareMoles()
	m1 = display.newImage('mole1.png', _W/15.65, _H/1.155)
	m2 = display.newImage('mole1.png', _W/2.069, _H/4.183)
	m3 = display.newImage('mole1.png', _W/1.385, _H/1.813)
	m4 = display.newImage('mole1.png', _W/1.121, _H/1.149)
	m5 = display.newImage('mole1.png', _W/1.538, _H/1.100)
	m6 = display.newImage('mole1.png', _W/2.553, _H/1.413)
	m7 = display.newImage('mole1.png', _W/10.91, _H/2.319)
	m8 = display.newImage('mole1.png', _W/3.130, _H/1.689)
	
	mole = {m1, m2, m3, m4, m5, m6, m7, m8}
	for i = 1, 8 do
		mole[i]:addEventListener('tap', moleHit)
		mole[i].isVisible = false
		WMgroup:insert(mole[i])
	end
	startTimer()
end -- end prepareMoles

--Correct this
function startTimer()
	
	random1 = math.random(2000,2500) 
	random2 = math.random(1500,2000)
	random3 = math.random(1000,1500) 
	random4 = math.random(500,1000) 
	random5 = math.random(100,500)
	
	tim1 = timer.performWithDelay(random1, showMole, 10)
	
	function ran2()
	
	timerSource2 = timer.performWithDelay(random2,showMole, 10)
	end -- end ran2

	tim2= timer.performWithDelay(random1*11,ran2)

	function ran3()
	
	timerSource3 = timer.performWithDelay(random3,showMole, 10)
	end -- end ran3

	tim3 = timer.performWithDelay(random1*11+random2*11,ran3)

	function ran4()
	
	timerSource4 = timer.performWithDelay(random4,showMole, 10)
	end --end ran4

	tim4 = timer.performWithDelay(random1*11+random2*11+random3*11,ran4)

	function ran5()
	 
	timerSource5 = timer.performWithDelay(random5,showMole, 0)
	end --end ran5

	tim5 = timer.performWithDelay(random1*11+random2*11+random3*11+random4*11,ran5)
end --end startTimer

function showMole(e)
	
	if(currentmoles - HitCount >= 3) then
		display.remove(heart1)
		Runtime:removeEventListener('enterFrame', popOut)
		bye = 1
		countLoop = countLoop + 1
		timer.cancel(tim1)
		timer.cancel(tim2)
		timer.cancel(tim3)
		timer.cancel(tim4)
		timer.cancel(tim5)
		
		
		alert()
		
	else

		if(currentmoles - HitCount == 1) then
			display.remove(heart3)
	
		elseif(currentmoles - HitCount == 2) then
			display.remove(heart2)
		end
	end
		if (bye == 0) then
			lastMole.isVisible = false
			local randomHole = math.floor(math.random() * 8) + 1
			lastMole = mole[randomHole]
			lastMole.anchorX = 0.5
			lastMole.anchorY = 1
			lastMole.yScale = 0.1
			lastMole.isVisible = true
			WMgroup:insert(lastMole)
			Runtime:addEventListener('enterFrame', popOut)
		end
		currentmoles = currentmoles + 1

end --end showMole
--end

function popOut(e)
	lastMole.yScale = lastMole.yScale + 0.2
	
	if(lastMole.yScale >= 1) then
		Runtime:removeEventListener('enterFrame', popOut)
	end
end --end popOut

function stopAnimationMole()
	spinner:stop()
	display.remove(spinner)
end
function stopAnimationMole1()
	spinner1:stop()
	display.remove(spinner1)
end
function moleHit:tap(event)
	HitCount = HitCount + 1
	local playHit = audio.play(hit)
	audio.setVolume(0.2,{channel = 9})
	local options = {
    width = 130,
    height = 194,
    numFrames = 2,
    sheetContentWidth = 260,
    sheetContentHeight = 194
	}
	local spinnerMultiSheet = graphics.newImageSheet( "HammerMole.png", options )
	-- Create the widget
	spinner = widget.newSpinner
	{
    width = 130,
    height = 194,
    sheet = spinnerMultiSheet,
    startFrame = 1,
    count = 2,
    time = 300
	}
	spinner.x = event.x 
	spinner.y = event.y - 87
	spinner:start()
	WMgroup:insert(spinner)
	local options1 = {
    width = 82.3333333,
    height = 87,
    numFrames = 3,
    sheetContentWidth = 247,
    sheetContentHeight = 87
	}
	local spinner1MultiSheet = graphics.newImageSheet( "moleHitSprite.png", options1 )
	-- Create the widget
	spinner1 = widget.newSpinner
	{
    width = 82.3333333,
    height = 87,
    sheet = spinner1MultiSheet,
    startFrame = 1,
    count = 3,
    time = 500
	}
	spinner1.x = event.x
	spinner1.y = event.y+10
	spinner1:start()
	molesHit = molesHit + 1
	score.text = molesHit .. ' moles'
	lastMole.isVisible = false
	timer.performWithDelay(300,stopAnimationMole)
	timer.performWithDelay(500,stopAnimationMole1)
	WMgroup:insert(spinner1)
end


function alert()
	
	if (countLoop == 1) then
	gameOverLayout = display.newRect( 0, 0, _W, _H)
 	gameOverLayout:setFillColor( 0, 0, 0 )
 	gameOverLayout.alpha = 0.8
 	gameOverLayout.anchorX = 0
 	gameOverLayout.anchorY = 0
 	WMgroup:insert(gameOverLayout)
 	gameOverText1 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 24 )
	gameOverText1:setFillColor( 1 )
	gameOverText1.anchorX = 0.5
	gameOverText1.anchorY = 0.5
	gameOverText1.x, gameOverText1.y = _W * 0.5, _H * 0.5 -150
	WMgroup:insert(gameOverText1)
	gameOverText2 = display.newText( molesHit.." moles hit", 220, 190, native.systemFontBold, 24 )
	gameOverText2:setFillColor( 1 )
	gameOverText2.anchorY = 0.5
	gameOverText2.anchorX = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5 - 50
	WMgroup:insert(gameOverText2)

	gameOverText3 = display.newText( "PREVIOUS HIGH MOLES: ",0,0,native.systemFontBold,24)
	

	for j in db:nrows("SELECT Moles FROM WhackyMolly") do
	textVariable =  j.Moles
	end
	gameOverText3.text = string.format( "PREVIOUS HIGH MOLES: %6.0f", textVariable)
	gameOverText3:setFillColor( 1 )
	gameOverText3.anchorY = 0.5
	gameOverText3.anchorX = 0.5
	gameOverText3.x, gameOverText3.y = _W * 0.5, _H * 0.5 -100
	

	
	for row in db:nrows("SELECT COUNT(id) AS count FROM WhackyMolly") do
	if row.count == 1 then
		for row in db:nrows("SELECT Moles FROM WhackyMolly") do
			if(tonumber(row.Moles) < molesHit) then
				local sql = [[UPDATE WhackyMolly SET Moles = "]]..molesHit..[["]]
				db:exec(sql)
			    newHighScore = display.newImage("NewHighScore.png")

			    newHighScore.width = 300
			    newHighScore.height = 300
			    newHighScore.x = _W * 0.5
			    newHighScore.y = _H * 0.2
			   	local Con = audio.loadSound("Congratulations.mp3")
				local ConC = audio.play(Con)

			end
		end
   	elseif row.count == 0 then
   		local sql = [[INSERT INTO WhackyMolly ("Moles") VALUES("]] .. molesHit.. [[");]]
   		db:exec(sql)
   	end
   	 
end

	end
	function onTouchGameOverScreen1 (event)
	if (event.phase == "ended") then

		display.remove(newHighScore)
		display.remove(gameOverText3)
		WMbutton1:setEnabled (false)
		WMbutton2:setEnabled (false)
		WMbutton1.isVisible = false
		WMbutton2.isVisible = false
		audio.play(WMClick)
		storyboard.gotoScene( "GameTherapy", {effect = "crossFade", time = 300} )
	end
	end	

	WMbutton1 = widget.newButton
{
    width = 150,
    height = 150,
    defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onEvent = onTouchGameOverScreen1
}
	WMbutton1.x = _W/3
	WMbutton1.y = _H/1.8
	WMgroup:insert(WMbutton1)

	function onPlayAgain1(event)
		if (event.phase == "ended") then
			display.remove(newHighScore)
			display.remove(gameOverText3)
			WMbutton1:setEnabled (false)
			WMbutton2:setEnabled (false)
			WMbutton1.isVisible = false
			WMbutton2.isVisible = false
			audio.play(WMClick)
			storyboard.gotoScene("LoadingW",{effect = "crossFade", time = 300})
		end
	end
	WMbutton2 = widget.newButton
	{
    width = 150,
    height = 150,
    defaultFile = "PlayAgainBefore.png",
    overFile = "PlayAgainAfter.png",
    onEvent = onPlayAgain1
	}

	WMbutton2.x = _W/1.5
	WMbutton2.y = _H/1.8
	WMgroup:insert(WMbutton2)
end

Main()
end


CountDown5 = display.newImage("53Gems.png")
CountDown5.x = _W/2
CountDown5.y = _H/2

function Four()
	display.remove(CountDown5)
	CountDown4 = display.newImage("43Gems.png")
	CountDown4.x = _W/2
	CountDown4.y = _H/2
end
function Three()
	display.remove(CountDown4)
	CountDown3 = display.newImage("33Gems.png")
	CountDown3.x = _W/2
	CountDown3.y = _H/2
end
function Two()
	display.remove(CountDown3)
	CountDown2 = display.newImage("23Gems.png")
	CountDown2.x = _W/2
	CountDown2.y = _H/2
end
function One()
	display.remove(CountDown2)
	CountDown1 = display.newImage("13Gems.png")
	CountDown1.x = _W/2
	CountDown1.y = _H/2
end

timer.performWithDelay(1000,Four)
timer.performWithDelay(2000,Three)
timer.performWithDelay(3000,Two)
timer.performWithDelay(4000,One)
local Zappy = audio.loadSound("CountDown.mp3")
audio.play(Zappy)
timer.performWithDelay(5000,Moles)

end

function scene:enterScene( event )
	local WMgroup = self.view
	storyboard.purgeScene("GameTherapy")
	storyboard.purgeScene("LoadingW")

end
function scene:exitScene( event )
	timer.cancel(tim1)
	timer.cancel(tim2)
	timer.cancel(tim3)
	timer.cancel(tim4)
	timer.cancel(tim5)
	Runtime:removeEventListener("enterframe",popOut)



end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene