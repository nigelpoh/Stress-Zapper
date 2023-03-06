local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require("widget")
local sqlite = require("sqlite3")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

local mRandom = math.random()

local font1 = "Belligerent Madness"
local score
local scoreText
local TouchaS = 0

local gameTimer
local gameTimerText
local gameTimerBar
local gameTimerBar_bg


local gemsTable = {}
local numberOfMarkedToDestroy = 0
local gemToBeDestroyed  			-- used as a placeholder
local isGemTouchEnabled = true 		-- blocker for double touching gems

local gameOverLayout
local gameOverText1
local gameOverText2

 
local timers = {}

-- pre-declaration of function
local onGemTouch


Image = {}
	Image[1] = "Giraffe.png"
	Image[2] = "Lion.png"
	Image[3] = "Hippo.png"
	Image[4] = "Monkey.png"
	Image[5] = "Tiger.png"
	Image[6] = "Elephant.png"
	Image[7] = "Horse.png"
	Image[8] = "Bear.png"
Y = {}
   for i = 1,4 do
	X = math.random(1,8)
	if(i == 1) then
	Y[i] = X
elseif(i == 2) then
		while Y[1] == X do
			X = math.random(1,8)
		end
	Y[i] = X
elseif(i == 3) then
	while Y[1] == X or Y[2] == X do 
			X = math.random(1,8)
		end
	Y[i] = X
elseif(i == 4) then
	while Y[1] == X or Y[2] == X or Y[3] == X do 
			X = math.random(1,8)
		end
	Y[i] = X
end
end
local function newGem (i,j)
	
	local newGem
	local R = math.random(1,4)
	
	if 		(R == 1 ) then 
	
		newGem = display.newImage(Image[Y[1]])
		newGem.gemType = "red"
		newGem.height = _H/15.0588235
		newGem.width = _W/8.47058824
		
	newGem.i = i
	newGem.j = j
	newGem.isMarkedToDestroy = false

	newGem.destination_y = j*(_H/15.0588235)+200
	newGem.destination_x = i*(_W/8.47058824)-20

	elseif 	(R == 2 ) then 
	
		newGem = display.newImage(Image[Y[2]])
		newGem.gemType = "blue"
		newGem.height = _H/15.0588235
		newGem.width = _W/8.47058824

	newGem.i = i
	newGem.j = j
	newGem.isMarkedToDestroy = false

	newGem.destination_y = j*(_H/15.0588235)+200
	newGem.destination_x = i*(_W/8.47058824)-20

	elseif 	(R == 3 ) then 
	
		newGem = display.newImage(Image[Y[3]])
		newGem.gemType = "green"
		newGem.height = _H/15.0588235
		newGem.width = _W/8.47058824

	newGem.i = i
	newGem.j = j
	newGem.isMarkedToDestroy = false

	newGem.destination_y = j*(_H/15.0588235)+200
	newGem.destination_x = i*(_W/8.47058824)-20

	elseif 	(R == 4 ) then 
	
		newGem = display.newImage(Image[Y[4]])
		newGem.gemType = "yellow"
		newGem.height = _H/15.0588235
		newGem.width = _W/8.47058824

	newGem.i = i
	newGem.j = j
	newGem.isMarkedToDestroy = false

	newGem.destination_y = j*(_H/15.0588235)+200
	newGem.destination_x = i*(_W/8.47058824)-20

	end

	--new gem falling animation
	transition.to( newGem, { time=100, x=newGem.destination_x,y= newGem.destination_y} )

	groupGameLayer:insert( newGem )


	newGem.touch = onGemTouch
	newGem:addEventListener( "touch", newGem )

return newGem
end



local function shiftGems () 

--print ("Shifting Gems")

	-- first roww
	for i = 1, 8, 1 do
			if gemsTable[i][1].isMarkedToDestroy then

					-- current gem must go to a 'gemToBeDestroyed' variable holder to prevent memory leaks
					-- cannot destroy it now as gemsTable will be sorted and elements moved down
					gemToBeDestroyed = gemsTable[i][1]
					
					-- create a new one
					gemsTable[i][1] = newGem(i,1)
					
					-- destroy old gem
					gemToBeDestroyed:removeSelf()
					gemToBeDestroyed = nil
			end
	end

	-- rest of the rows
	for j = 2, 8, 1 do  -- j = row number - need to do like this it needs to be checked row by row
		for i = 1, 8, 1 do
			
			if gemsTable[i][j].isMarkedToDestroy then --if you find and empty hole then shift down all gems in column

					gemToBeDestroyed = gemsTable[i][j]
				
					-- shiftin whole column down, element by element in one column
					for k = j, 2, -1 do -- starting from bottom - finishing at the second row

						-- curent markedToDestroy Gem is replaced by the one above in the gemsTable
						gemsTable[i][k] = gemsTable[i][k-1]
						gemsTable[i][k].destination_y = gemsTable[i][k].destination_y +85
						transition.to( gemsTable[i][k], { time=100, y= gemsTable[i][k].destination_y} )
						
						-- we change its j value as it has been 'moved down' in the gemsTable
						gemsTable[i][k].j = gemsTable[i][k].j + 1
				
					end

					-- create a new gem at the first row as there is en ampty space due to gems
					-- that have been moved in the column
					gemsTable[i][1] = newGem(i,1)

					-- destroy the old gem (the one that was invisible and placed in gemToBeDestroyed holder)
					gemToBeDestroyed:removeSelf()
					gemToBeDestroyed = nil
			end 
		end
	end
end --shiftGems()



local function markToDestroy( self )

	self.isMarkedToDestroy = true
	numberOfMarkedToDestroy = numberOfMarkedToDestroy + 1
	
	-- check on the left
	if self.i>1 then
		if (gemsTable[self.i-1][self.j]).isMarkedToDestroy == false then

			if (gemsTable[self.i-1][self.j]).gemType == self.gemType then

			   markToDestroy( gemsTable[self.i-1][self.j] )
			end	 
		end
	end

	-- check on the right
	if self.i<8 then
		if (gemsTable[self.i+1][self.j]).isMarkedToDestroy == false then

			if (gemsTable[self.i+1][self.j]).gemType == self.gemType then

			    markToDestroy( gemsTable[self.i+1][self.j] )
			end	 
		end
	end

	-- check above
	if self.j>1 then
		if (gemsTable[self.i][self.j-1]).isMarkedToDestroy == false then

			if (gemsTable[self.i][self.j-1]).gemType == self.gemType then

			   markToDestroy( gemsTable[self.i][self.j-1] )
			end	 
		end
	end

	-- check below
	if self.j<8 then
		if (gemsTable[self.i][self.j+1]).isMarkedToDestroy== false then

			if (gemsTable[self.i][self.j+1]).gemType == self.gemType then

			   markToDestroy( gemsTable[self.i][self.j+1] )
			end	 
		end
	end
end



local function enableGemTouch()

	isGemTouchEnabled = true
end



local function destroyGems()
	
	numly = math.random(1,3)
 		if(numly == 1) then
			local Laser1 = audio.loadSound("Laser1.mp3")
			audio.setVolume(0.2, {channel = 25})
			audio.play(Laser1, {channel = 25})
			
		elseif(numly == 2) then
			local Laser2 = audio.loadSound("Laser2.mp3")
			
			audio.setVolume(0.2, {channel = 26})
			audio.play(Laser2, {channel = 26})

		elseif(numly == 3) then
			local Laser3 = audio.loadSound("Laser3.mp3")
			
			audio.setVolume(0.2,  {channel = 27})
			audio.play(Laser3, {channel = 27})
		end
	if numberOfMarkedToDestroy == 6 then 
		local ZapChannel1 = audio.loadSound("Good Job.mp3")
		audio.setVolume(0.6, {channel = 20})
		local Zap1 = audio.play( ZapChannel1, {channel = 20})
		
	elseif numberOfMarkedToDestroy == 7 then 
		local ZapChannel2 = audio.loadSound("Bravo.mp3")
		audio.setVolume(0.6, {channel = 21})
		local Zap2 = audio.play( ZapChannel2, {channel = 21})
		
	elseif numberOfMarkedToDestroy == 8 then
		local ZapChannel3 = audio.loadSound("Brilliant.mp3")
		audio.setVolume(0.6, {channel = 22})
		local Zap3 = audio.play( ZapChannel3, {channel = 22})
		
	elseif numberOfMarkedToDestroy >= 9 then
		local ZapChannel4 = audio.loadSound("Excellent.mp3")
		audio.setVolume(0.6, {channel = 23})
		local Zap4 = audio.play( ZapChannel4 , {channel = 23})
		
	end
	
	for i = 1, 8, 1 do
		for j = 1, 8, 1 do
			
			if gemsTable[i][j].isMarkedToDestroy then

				isGemTouchEnabled = false
				transition.to( gemsTable[i][j], { time=300, alpha=0.2, xScale=2, yScale = 2, onComplete=enableGemTouch } )

				-- update score
				score = score + 10
				scoreText.text = string.format( "SCORE: %6.0f", score )
				scoreText.anchorX = 0
				scoreText.anchorY = 0
				
				
			end
		end
	end

	numberOfMarkedToDestroy = 0
	shiftTimer = timer.performWithDelay( 320, shiftGems )

end



local function cleanUpGems()
	--print("Cleaning Up Gems")
		
	numberOfMarkedToDestroy = 0
	
	for i = 1, 8, 1 do
		for j = 1, 8, 1 do
			
			-- show that there is not enough
			if gemsTable[i][j].isMarkedToDestroy then
				transition.to( gemsTable[i][j], { time=100, xScale=1.2, yScale = 1.2 } )
				transition.to( gemsTable[i][j], { time=100, delay=100, xScale=1.0, yScale = 1.0} )
			end

			gemsTable[i][j].isMarkedToDestroy = false
			

		end
	end
end



function onGemTouch( self, event )	-- was pre-declared

	if event.phase == "began" and isGemTouchEnabled then

		markToDestroy(self)
		
		if numberOfMarkedToDestroy >= 3 then

			destroyGems()
		else 
			cleanUpGems()
		end
	end

return true

end




local function showGameOver ()

	gameOverLayout.alpha = 0.8
	gameOverText1.alpha = 1
	gameOverText2.alpha = 1
	gameOverText3.alpha = 1
	Gembutton1.alpha = 1
	Gembutton2.alpha = 1
	for row in db:nrows("SELECT COUNT(id) AS count FROM ThreeGems") do
	if row.count == 1 then
		for row in db:nrows("SELECT Score FROM ThreeGems") do
			if(tonumber(row.Score) < score) then
				local sql = [[UPDATE ThreeGems SET Score = "]]..score..[["]]
				db:exec(sql)
			    local newHighScore = display.newImage("NewHighScore.png")
			    newHighScore.width = 300
			    newHighScore.height = 300
			    newHighScore.x = _W * 0.5
			    newHighScore.y = _H * 0.2
			    local Con = audio.loadSound("Congratulations.mp3")
				local ConC = audio.play(Con)
			    groupEndGameLayer:insert(newHighScore)
			else

			end
		end
   	elseif row.count == 0 then
   		local sql = [[INSERT INTO ThreeGems ("Score") VALUES("]] .. score.. [[");]]
   		db:exec(sql)
   	end
end
end
local function gameTimerUpdate ()

	gameTimer = gameTimer - 1
	
	if gameTimer >= 0 then gameTimerText.text = gameTimer

	else
		gameOverText2.text = string.format( "SCORE: %6.0f", score )

		showGameOver()

	end
end
          

-- Called when the scene's view does not exist:
function scene:createScene( event )
      local screenGroup = self.view
        path = system.pathForFile("StressZapper.sqlite",system.DocumentsDirectory)
		db = sqlite.open(path)
		db:exec("CREATE TABLE IF NOT EXISTS ThreeGems(id INTEGER PRIMARY KEY, Score);")
		for row in db:nrows("SELECT COUNT(id) AS count FROM ThreeGems") do 
			if (row.count == 0) then
				local sql = [[INSERT INTO ThreeGems ("Score") VALUES("0");]]
   				db:exec(sql)
   	
   			end
   		end

		bgMusic1 = audio.loadSound("ThreeGemsAudio.mp3")
		bgMusicPlayG = audio.play(bgMusic1)
    score		= 0
    gameTimer 	= 60
	

   	groupGameLayer = display.newGroup()
   	groupEndGameLayer = display.newGroup()
   	groupTimer = display.newGroup()
   	titleText = display.newImage("AnimalJemsGame.png")
   	titleText.height = 275
   	titleText.width = 399
   	titleText.x = _W/2
	titleText.y = _H/11
    --score text
    scoreText = display.newText( "SCORE:" , 40, 20, font1, 60 )
	scoreText.text = string.format( "SCORE: %6.0f", score )
	scoreText.anchorX = 0
	scoreText.anchorY = 0
	scoreText.x = _W/4
	scoreText.y = _H/1.3
	scoreText:setTextColor(0, 0, 255)
	
	background = display.newImageRect("Background8.png",_W,_H)
    background.anchorX = 0
    background.anchorY = 0
    background:toBack()
	background.alpha = 0.5
	screenGroup:insert(background)
	gameTimerBar_bg = display.newRoundedRect( _W/10, _H/1.1, 560, 40, 4)
	gameTimerBar_bg:setFillColor( 0.9, 0.9, 0.9 )
	gameTimerBar_bg.anchorX = 0
	gameTimerBar_bg.anchorY = 0
	
 	gameTimerBar = display.newRoundedRect( _W/10, _H/1.1, 560, 40, 4)
 	gameTimerBar:setFillColor( 0, 150/255, 0 )
 	gameTimerBar.anchorX = 0
 	gameTimerBar.anchorY = 0
	
	--[[gameTimerBar_bg = display.newRoundedRect( _W/10, _H/1.1, _W*0.9-_W/10, 40, 4)
	gameTimerBar_bg:setFillColor( 0.9, 0.9, 0.9)
	gameTimerBar_bg.anchorX = 0
	gameTimerBar_bg.anchorY = 0
	
 	gameTimerBar = display.newRoundedRect( _W/10, _H/1.1, _W*0.9-_W/10, 40, 4)
 	gameTimerBar:setFillColor( 0, 150/255, 0 )
 	gameTimerBar.anchorX = 0
 	gameTimerBar.anchorY = 0]]--
 	
 	gameTimerText = display.newText( gameTimer , 0, 0, font1, 30 )
 	gameTimerText:setTextColor( 0, 0, 0 )
	gameTimerText.anchorX = 0
	gameTimerText.anchorY = 0
    gameTimerText.x = (_W/10)*5 
    gameTimerText.y = _H/1.1
    
	groupGameLayer:insert ( scoreText )
	groupGameLayer:insert ( titleText )
	groupGameLayer:insert ( gameTimerBar_bg )
 	groupGameLayer:insert ( gameTimerBar )
 	groupGameLayer:insert ( gameTimerText )
 	local Zappy = audio.loadSound("CountDown.mp3")
local ZappyC = audio.play(Zappy)
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
local ZappyC = audio.play(Zappy)
    --gemsTable
    function CreateGems()
    display.remove(CountDown1)
    for i = 1, 8, 1 do

    	gemsTable[i] = {}

		for j = 1, 8, 1 do

			gemsTable[i][j] = newGem(i,j)
	
 		end
 	end
 		end
 		createTimer = timer.performWithDelay(5000,CreateGems)
 		function gameOverLayoutPropagation()
 			return true
 		end
 	gameOverLayout = display.newRect( 0, 0, _W, _H)
 	gameOverLayout:setFillColor( 0, 0, 0 )
 	gameOverLayout.alpha = 0
 	gameOverLayout.anchorX = 0
 	gameOverLayout.anchorY = 0
 	gameOverLayout.isHitTestable = false
 	gameOverLayout:addEventListener("touch",gameOverLayoutPropagation)

 	gameOverText1 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 24 )
	gameOverText1:setFillColor( 1 )
	gameOverText1.anchorX = 0.5
	gameOverText1.anchorY = 0.5
	gameOverText1.x, gameOverText1.y = _W * 0.5, _H * 0.5 -150
	gameOverText1.alpha = 0

	gameOverText2 = display.newText( "SCORE: ", 0, 0, native.systemFontBold, 24 )
	gameOverText2.text = string.format( "SCORE: %6.0f", score )
	gameOverText2:setFillColor( 1 )
	gameOverText2.anchorY = 0.5
	gameOverText2.anchorX = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5 - 50
	gameOverText2.alpha = 0
	gameOverText3 = display.newText( "PREVIOUS HIGHSCORE: ",0,0,native.systemFontBold,24)
	for j in db:nrows("SELECT Score FROM ThreeGems") do
	textVariable =  j.Score 
	end
	gameOverText3.text = string.format( "PREVIOUS HIGHSCORE: %6.0f", textVariable)
	gameOverText3:setFillColor( 1 )
	gameOverText3.anchorY = 0.5
	gameOverText3.anchorX = 0.5
	gameOverText3.x, gameOverText3.y = _W * 0.5, _H * 0.5 -100
	gameOverText3.alpha = 0

function onTouchGameOverScreen (event)
	if (event.phase == "ended") then
		background.alpha = 0
		
		Gclick1 = audio.loadSound("click.mp3")
		audio.setVolume(0.5, {channel = 30})
        audio.play(Gclick1, {channel = 30})
        audio.stop(bgMusicPlayG)
		storyboard.gotoScene( "GameTherapy", {effect="crossFade", time = 300} )
	end
end	
function onPlayAgain(event)
	if (event.phase == "ended") then
		
		Gclick2 = audio.loadSound("click.mp3")
		audio.setVolume(0.5, {channel = 30})
        audio.play(Gclick2, {channel = 30})
        audio.stop(bgMusicPlayG)
		storyboard.gotoScene("Loading",{effect="crossFade", time = 300})
	end
end

	Gembutton1 = widget.newButton
{
    width = 150,
    height = 150,
    defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onEvent = onTouchGameOverScreen
}

-- Center the button
Gembutton1.x = _W/3
Gembutton1.y = _H/1.8

--Change the button's label text
Gembutton1.alpha = 0
Gembutton2 = widget.newButton
{
    width = 150,
    height = 150,
    defaultFile = "PlayAgainBefore.png",
    overFile = "PlayAgainAfter.png",
    onEvent = onPlayAgain
}

-- Center the button
Gembutton2.x = _W/1.5
Gembutton2.y = _H/1.8

Gembutton2.alpha = 0
gameOverLayout:addEventListener( "touch", gameOverLayout )


	groupEndGameLayer:insert ( gameOverLayout )
	groupEndGameLayer:insert ( gameOverText1 )
	groupEndGameLayer:insert ( gameOverText2 )
	groupEndGameLayer:insert ( gameOverText3 )

	groupEndGameLayer:insert ( Gembutton1 )
	groupEndGameLayer:insert ( Gembutton2 )

	-- insterting display groups to the screen group (storyboard group)
	screenGroup:insert ( groupGameLayer )
	screenGroup:insert ( groupEndGameLayer )
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
        local screenGroup = self.view
        
        -----------------------------------------------------------------------------
                
        --      This event requires build 2012.782 or later.
        
        -----------------------------------------------------------------------------
        
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local screenGroup = self.view
        
        -----------------------------------------------------------------------------
                
        --      INSERT code here (e.g. start timers, load audio, start listeners, etc.)
        
        -----------------------------------------------------------------------------
	
	-- remove previous scene's view

	--print( "1: enterScene event" )
	
	-- storyboard.purgeScene( "scene4" )

	-- reseting values
	score = 0
	
	function StartTimer()
	transition.to( gameTimerBar, { time = gameTimer * 1000, width=0 } )
	timers.gameTimerUpdate = timer.performWithDelay(1000, gameTimerUpdate, 0)
	end
	timer.performWithDelay(5000,StartTimer)
	storyboard.purgeScene("GameTherapy")
	storyboard.purgeScene("Loading")
end
 
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
        local screenGroup = self.view
        -----------------------------------------------------------------------------
        
        --      INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
        audio.stop(bgMusicPlayG)
        -----------------------------------------------------------------------------
	if timers.gameTimerUpdate then 
		timer.cancel(timers.gameTimerUpdate)
		timers.gameTimerUpdate = nil
	end

	if createTimer then 
		timer.cancel(createTimer)
		timers.gameTimerUpdate = nil
	 end

	 if shiftTimer then 
		timer.cancel(shiftTimer)
		shiftTimer = nil
	 end

end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
        local screenGroup = self.view
        
        -----------------------------------------------------------------------------
                
        --      This event requires build 2012.782 or later.
        
        -----------------------------------------------------------------------------
        
end
 
 
-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
        local screenGroup = self.view
        
        -----------------------------------------------------------------------------
        
        --      INSERT code here (e.g. remove listeners, widgets, save state, etc.)
        
        -----------------------------------------------------------------------------
        
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
        local screenGroup = self.view
        local overlay_scene = event.sceneName  -- overlay scene name
        
        -----------------------------------------------------------------------------
                
        --      This event requires build 2012.797 or later.
        
        -----------------------------------------------------------------------------
        
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
        local screenGroup = self.view
        local overlay_scene = event.sceneName  -- overlay scene name
 
        -----------------------------------------------------------------------------
                
        --      This event requires build 2012.797 or later.
        
        -----------------------------------------------------------------------------
        
end
 
 
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene