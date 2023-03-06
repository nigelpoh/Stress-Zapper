display.setStatusBar( display.HiddenStatusBar )
local storyboard = require( "storyboard" )
local widget = require( "widget")
local sqlite = require("sqlite3")
local scene = storyboard.newScene()

function scene:createScene( event )

_W = display.viewableContentWidth
_H = display.viewableContentHeight

system.activate("multitouch")

FTgroup = self.view

local bground = display.newImageRect("Background9.png",_W,_H)
bground.anchorX = 0
bground.anchorY = 0
bground.width = _W
bground.height = _H
FTgroup:insert(bground)
 Toucha = 0
	function table.shuffle(t)
        function ran()
        	math.randomseed(os.time())
        end
        for i = 1,4 do
        	
        	timer.performWithDelay(1000,ran)
        assert(t, "table.shuffle() expected a table, got nil")
        local iterations = #t
        local j
        for i = iterations, 2, -1 do
                j = math.random(i)
                t[i], t[j] = t[j], t[i]
        end
    end
	end
	local array1 = {1,2,3,4}
	table.shuffle(array1)
	local array2 = {1,2,3,4}
	table.shuffle(array2)
	local array3 = {1,2,3,4}
	table.shuffle(array3)
	local array4 = {1,2,3,4}
	table.shuffle(array4)
	print("array1: "..table.concat(array1,", "))
	RedaCircle = {"Red_Circle_1","Red_Circle_2","Red_Circle_3","Red_Circle_4"}
	RedaCircle1 = RedaCircle[array1[1]]
	txt = display.newText("",_W/2,_H*0.05,native.systemFontBold,30)
	txt.anchorX = 0.5
	txt.anchorY = 0.5
	FTgroup:insert(txt)
	RedaCircle[array1[1]] = display.newImage("RedCircle"..array1[1]..".png")
	RedaCircle[array1[1]].anchorX = 0
	RedaCircle[array1[1]].anchorY = 0
	RedaCircle[array1[1]].x = _W/20
	RedaCircle[array1[1]].y = _H/10.24
	RedaCircle[array1[1]].width = 150
	RedaCircle[array1[1]].height = 150
	FTgroup:insert(RedaCircle[array1[1]])

	RedaCircle2 = RedaCircle[array1[2]]
	RedaCircle[array1[2]] = display.newImage("RedCircle"..array1[2]..".png")
	RedaCircle[array1[2]].anchorX = 0
	RedaCircle[array1[2]].anchorY = 0
	RedaCircle[array1[2]].x = _W/3.5
	RedaCircle[array1[2]].y = _H/3.413
	RedaCircle[array1[2]].width = 150
	RedaCircle[array1[2]].height = 150
	FTgroup:insert(RedaCircle[array1[2]])

	RedaCircle3 = RedaCircle[array1[3]]
	RedaCircle[array1[3]] = display.newImage("RedCircle"..array1[3]..".png")
	RedaCircle[array1[3]].anchorX = 0
	RedaCircle[array1[3]].anchorY = 0
	RedaCircle[array1[3]].x = _W/1.9
	RedaCircle[array1[3]].y = _H/2.048
	RedaCircle[array1[3]].width = 150
	RedaCircle[array1[3]].height = 150
	FTgroup:insert(RedaCircle[array1[3]])

	RedaCircle4 = RedaCircle[array1[4]]
	RedaCircle[array1[4]] = display.newImage("RedCircle"..array1[4]..".png")
	RedaCircle[array1[4]].anchorX = 0
	RedaCircle[array1[4]].anchorY = 0
	RedaCircle[array1[4]].x = _W/20
	RedaCircle[array1[4]].y = _H/1.462857
	RedaCircle[array1[4]].width = 150
	RedaCircle[array1[4]].height = 150
	FTgroup:insert(RedaCircle[array1[4]])
	
	BlueaCircle = {"Blue_Circle_1","Blue_Circle_2","Blue_Circle_3","Blue_Circle_4"}
	
	BlueaCircle1 = BlueaCircle[array2[1]]
	BlueaCircle[array2[1]] = display.newImage("BlueCircle"..array2[1]..".png")
	BlueaCircle[array2[1]].anchorX = 0
	BlueaCircle[array2[1]].anchorY = 0
	BlueaCircle[array2[1]].x = _W/20
	BlueaCircle[array2[1]].y = _H/2.048
	BlueaCircle[array2[1]].width = 150
	BlueaCircle[array2[1]].height = 150
	FTgroup:insert(BlueaCircle[array2[1]])

	BlueaCircle2 = BlueaCircle[array2[2]]
	BlueaCircle[array2[2]] = display.newImage("BlueCircle"..array2[2]..".png")
	BlueaCircle[array2[2]].anchorX = 0
	BlueaCircle[array2[2]].anchorY = 0
	BlueaCircle[array2[2]].x = _W/3.5
	BlueaCircle[array2[2]].y = _H/10.24
	BlueaCircle[array2[2]].width = 150
	BlueaCircle[array2[2]].height = 150
	FTgroup:insert(BlueaCircle[array2[2]])

	BlueaCircle3 = BlueaCircle[array2[3]]
	BlueaCircle[array2[3]] = display.newImage("BlueCircle"..array2[3]..".png")
	BlueaCircle[array2[3]].anchorX = 0
	BlueaCircle[array2[3]].anchorY = 0
	BlueaCircle[array2[3]].x = _W/1.9
	BlueaCircle[array2[3]].y = _H/3.413
	BlueaCircle[array2[3]].width = 150
	BlueaCircle[array2[3]].height = 150
	FTgroup:insert(BlueaCircle[array2[3]])

	BlueaCircle4 = BlueaCircle[array2[4]]
	BlueaCircle[array2[4]] = display.newImage("BlueCircle"..array2[4]..".png")
	BlueaCircle[array2[4]].anchorX = 0
	BlueaCircle[array2[4]].anchorY = 0
	BlueaCircle[array2[4]].x = _W/1.3
	BlueaCircle[array2[4]].y = _H/1.462857
	BlueaCircle[array2[4]].width = 150
	BlueaCircle[array2[4]].height = 150
	FTgroup:insert(BlueaCircle[array2[4]])

	GoldaCircle = {"Yellow_Circle_1","Yellow_Circle_2","Yellow_Circle_3","Yellow_Circle_4"}
	GoldaCircle1 = GoldaCircle[array3[1]]
	GoldaCircle[array3[1]] = display.newImage("GoldCircle"..array3[1]..".png")
	GoldaCircle[array3[1]].anchorX = 0
	GoldaCircle[array3[1]].anchorY = 0
	GoldaCircle[array3[1]].x = _W/3.5
	GoldaCircle[array3[1]].y = _H/1.462857
	GoldaCircle[array3[1]].width = 150
	GoldaCircle[array3[1]].height = 150
	FTgroup:insert(GoldaCircle[array3[1]])

	GoldaCircle2 = GoldaCircle[array3[2]]
	GoldaCircle[array3[2]] = display.newImage("GoldCircle"..array3[2]..".png")
	GoldaCircle[array3[2]].anchorX = 0
	GoldaCircle[array3[2]].anchorY = 0
	GoldaCircle[array3[2]].x = _W/1.9
	GoldaCircle[array3[2]].y = _H/10.24
	GoldaCircle[array3[2]].width = 150
	GoldaCircle[array3[2]].height = 150
	FTgroup:insert(GoldaCircle[array3[2]])

	GoldaCircle3 = GoldaCircle[array3[3]]
	GoldaCircle[array3[3]] = display.newImage("GoldCircle"..array3[3]..".png")
	GoldaCircle[array3[3]].anchorX = 0
	GoldaCircle[array3[3]].anchorY = 0
	GoldaCircle[array3[3]].x = _W/1.3
	GoldaCircle[array3[3]].y = _H/3.413
	GoldaCircle[array3[3]].width = 150
	GoldaCircle[array3[3]].height = 150
	FTgroup:insert(GoldaCircle[array3[3]])

	GoldaCircle4 = GoldaCircle[array3[4]]
	GoldaCircle[array3[4]] = display.newImage("GoldCircle"..array3[4]..".png")
	GoldaCircle[array3[4]].anchorX = 0
	GoldaCircle[array3[4]].anchorY = 0
	GoldaCircle[array3[4]].x = _W/1.9
	GoldaCircle[array3[4]].y = _H/1.462857
	GoldaCircle[array3[4]].width = 150
	GoldaCircle[array3[4]].height = 150
	FTgroup:insert(GoldaCircle[array3[4]])

	GreenaCircle = {"Green_Circle_1","Green_Circle_2","Green_Circle_3","Green_Circle_4"}
	GreenaCircle1 = GreenaCircle[array4[1]]
	GreenaCircle[array4[1]] = display.newImage("GreenCircle"..array4[1]..".png")
	GreenaCircle[array4[1]].anchorX = 0
	GreenaCircle[array4[1]].anchorY = 0
	GreenaCircle[array4[1]].x = _W/20
	GreenaCircle[array4[1]].y = _H/3.413
	GreenaCircle[array4[1]].width = 150
	GreenaCircle[array4[1]].height = 150
	FTgroup:insert(GreenaCircle[array4[1]])

	GreenaCircle2 = GreenaCircle[array4[2]]
	GreenaCircle[array4[2]] = display.newImage("GreenCircle"..array4[2]..".png")
	GreenaCircle[array4[2]].anchorX = 0
	GreenaCircle[array4[2]].anchorY = 0
	GreenaCircle[array4[2]].x = _W/3.5
	GreenaCircle[array4[2]].y = _H/2.048
	GreenaCircle[array4[2]].width = 150
	GreenaCircle[array4[2]].height = 150
	FTgroup:insert(GreenaCircle[array4[2]])

	GreenaCircle3 = GreenaCircle[array4[3]]
	GreenaCircle[array4[3]] = display.newImage("GreenCircle"..array4[3]..".png")
	GreenaCircle[array4[3]].anchorX = 0
	GreenaCircle[array4[3]].anchorY = 0
	GreenaCircle[array4[3]].x = _W/1.3
	GreenaCircle[array4[3]].y = _H/2.048
	GreenaCircle[array4[3]].width = 150
	GreenaCircle[array4[3]].height = 150
	FTgroup:insert(GreenaCircle[array4[3]])

	GreenaCircle4 = GreenaCircle[array4[4]]
	GreenaCircle[array4[4]] = display.newImage("GreenCircle"..array4[4]..".png")
	GreenaCircle[array4[4]].anchorX = 0
	GreenaCircle[array4[4]].anchorY = 0
	GreenaCircle[array4[4]].x = _W/1.3
	GreenaCircle[array4[4]].y = _H/10.24
	GreenaCircle[array4[4]].width = 150
	GreenaCircle[array4[4]].height = 150
	FTgroup:insert(GreenaCircle[array4[4]])
	
	Y = {}
	CircleRandom = {"Red_Circle_1","Red_Circle_2","Red_Circle_3","Red_Circle_4","Blue_Circle_1","Blue_Circle_2","Blue_Circle_3","Blue_Circle_4","Yellow_Circle_1","Yellow_Circle_2","Yellow_Circle_3","Yellow_Circle_4","Green_Circle_1","Green_Circle_2","Green_Circle_3","Green_Circle_4"}
	for i = 1,5 do
	X = math.random(1,16)
	if(i == 1) then
	Y[i] = X
elseif(i == 2) then
		while Y[1] == X do
			X = math.random(1,16)
		end
	Y[i] = X
elseif(i == 3) then
	while Y[1] == X or Y[2] == X do 
			X = math.random(1,16)
		end
	Y[i] = X
elseif(i == 4) then
	while Y[1] == X or Y[2] == X or Y[3] == X do 
			X = math.random(1,16)
		end
	Y[i] = X
elseif(i == 5) then
	while Y[1] == X or Y[2] == X or Y[3] == X or Y[4] == X do 
			X = math.random(1,16)
		end
	Y[i] = X
end
end

		function onTouchGameOverScreen1 (event)
		if (event.phase == "ended") then
		
		FTgroup:insert(bground)
		FTgroup:insert(RedaCircle[array1[1]])
		FTgroup:insert(RedaCircle[array1[2]])
		FTgroup:insert(RedaCircle[array1[3]])
		FTgroup:insert(RedaCircle[array1[4]])
		FTgroup:insert(BlueaCircle[array2[1]])
		FTgroup:insert(BlueaCircle[array2[2]])
		FTgroup:insert(BlueaCircle[array2[3]])
		FTgroup:insert(BlueaCircle[array2[4]])
		FTgroup:insert(GoldaCircle[array3[1]])
		FTgroup:insert(GoldaCircle[array3[2]])
		FTgroup:insert(GoldaCircle[array3[3]])
		FTgroup:insert(GoldaCircle[array3[4]])
		FTgroup:insert(GreenaCircle[array4[1]])
		FTgroup:insert(GreenaCircle[array4[2]])
		FTgroup:insert(GreenaCircle[array4[3]])
		FTgroup:insert(GreenaCircle[array4[4]])
		FTgroup:insert(GreenaCircle[array4[4]])
		
		audio.stop() 
		
		
		Toucha = Toucha + 1
		local FTclick = audio.loadSound("click.mp3")
		audio.setVolume(0.5)
		audio.play(FTclick)
		
		storyboard.gotoScene( "GameTherapy", {effect="crossFade", time = 300} )
		
		end
		return false
	end
		function onPlayAgain1(event)
		if (event.phase == "ended") then
			
		FTgroup:insert(bground)
		
		FTgroup:insert(RedaCircle[array1[1]])
		FTgroup:insert(RedaCircle[array1[2]])
		FTgroup:insert(RedaCircle[array1[3]])
		FTgroup:insert(RedaCircle[array1[4]])
		FTgroup:insert(BlueaCircle[array2[1]])
		FTgroup:insert(BlueaCircle[array2[2]])
		FTgroup:insert(BlueaCircle[array2[3]])
		FTgroup:insert(BlueaCircle[array2[4]])
		FTgroup:insert(GoldaCircle[array3[1]])
		FTgroup:insert(GoldaCircle[array3[2]])
		FTgroup:insert(GoldaCircle[array3[3]])
		FTgroup:insert(GoldaCircle[array3[4]])
		FTgroup:insert(GreenaCircle[array4[1]])
		FTgroup:insert(GreenaCircle[array4[2]])
		FTgroup:insert(GreenaCircle[array4[3]])
		FTgroup:insert(GreenaCircle[array4[4]])
		FTgroup:insert(GreenaCircle[array4[4]])
	
		
		audio.stop()
		
		Toucha = Toucha + 1
		local FTclick = audio.loadSound("click.mp3")
		audio.setVolume(0.5)
		audio.play(FTclick)
		storyboard.gotoScene("LoadingF", {effect="crossFade", time = 300})
		
		end
		return false
	end

	button1 = widget.newButton
{
    width = 150,
    height = 150,
    defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onEvent = onTouchGameOverScreen1
}
	button1.x = _W*0.3333
	button1.y = _H*0.88
	button1:setEnabled(false)
	button1.isVisible = false
	FTgroup:insert(button1)

	button2 = widget.newButton
	{
    width = 150,
    height = 150,
    defaultFile = "PlayAgainBefore.png",
    overFile = "PlayAgainAfter.png",
    onEvent = onPlayAgain1
	}

	button2.x = _W*0.6666
	button2.y = _H*0.88
	button2:setEnabled(false)
	button2.isVisible = false
	FTgroup:insert(button2)

function Congratulations()
	CountDown.isVisible = false
	
	local optionsas = {
    width = 440,
    height = 302,
    numFrames = 2,
    sheetContentWidth = 880,
    sheetContentHeight = 302
}
local spinnerMultiSheets = graphics.newImageSheet( "Congratulations.png", optionsas )

local sequenceData =
{
    frames= {2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 0        -- Optional ; default is 0
}


	gameOverLayout = display.newRect( 0, 0, _W, _H)
 	gameOverLayout:setFillColor( 0, 0, 0 )
 	gameOverLayout.alpha = 0.8
 	gameOverLayout.anchorX = 0
 	gameOverLayout.anchorY = 0
 	FTgroup:insert(gameOverLayout)

 	gameOverText1opt = { 
 		text = "Congratulations! Can you untangle your fingers now?",
 		x = 0, 
 		y = 0, 
 		width = _W*0.9, 
 		height = _H*0.3, 
 		font = native.systemFontBold, 
 		fontSize = 40, 
 		align = "center"
	}
	gameOverText1 = display.newText(gameOverText1opt)
	gameOverText1:setFillColor( 1 )
	gameOverText1.anchorX = 0.5
	gameOverText1.anchorY = 0.5
	gameOverText1.x, gameOverText1.y = _W * 0.5, _H * 0.6
	gameOverText1.align = "center"
	FTgroup:insert(gameOverText1)
		
	Congrats = display.newSprite( spinnerMultiSheets, sequenceData )
	Congrats.anchorX = 0.5
	Congrats.anchorY = 0
	Congrats.x = _W*0.5
	Congrats.y = _H*0.1
	Congrats.alpha = 1
	Congrats:toFront()

	FTgroup:insert(Congrats)
	Congrats:play()

	audio.stop()
	CountDown:pause()
	
	
	local Con = audio.loadSound("Congratulations.mp3")
	local ConC = audio.play(Con)
	
 	gameOverLayout = display.newRect( 0, 0, _W, _H)
 	gameOverLayout:setFillColor( 0, 0, 0 )
 	gameOverLayout.alpha = 0
 	gameOverLayout.anchorX = 0
 	gameOverLayout.anchorY = 0
 	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()


	for j = 1, 5 do
		RedaCircle[array1[j]]:removeEventListener("touch", NextQ5)
		RedaCircle[array1[j]]:removeEventListener("touch", NextQ4)
		RedaCircle[array1[j]]:removeEventListener("touch", NextQ3)
		RedaCircle[array1[j]]:removeEventListener("touch", NextQ2)
		RedaCircle[array1[j]]:removeEventListener("touch", NextQ1)

		BlueaCircle[array2[j]]:removeEventListener("touch", NextQ5)
		BlueaCircle[array2[j]]:removeEventListener("touch", NextQ4)
		BlueaCircle[array2[j]]:removeEventListener("touch", NextQ3)
		BlueaCircle[array2[j]]:removeEventListener("touch", NextQ2)
		BlueaCircle[array2[j]]:removeEventListener("touch", NextQ1)

		GoldaCircle[array3[j]]:removeEventListener("touch", NextQ5)
		GoldaCircle[array3[j]]:removeEventListener("touch", NextQ4)
		GoldaCircle[array3[j]]:removeEventListener("touch", NextQ3)
		GoldaCircle[array3[j]]:removeEventListener("touch", NextQ2)
		GoldaCircle[array3[j]]:removeEventListener("touch", NextQ1)

		GreenaCircle[array4[j]]:removeEventListener("touch", NextQ5)
		GreenaCircle[array4[j]]:removeEventListener("touch", NextQ4)
		GreenaCircle[array4[j]]:removeEventListener("touch", NextQ3)
		GreenaCircle[array4[j]]:removeEventListener("touch", NextQ2)
		GreenaCircle[array4[j]]:removeEventListener("touch", NextQ1)
	end
end


function NextQ5(event)
	if(event.phase == "began") then
	
	local options5 = {
    width = 88.3,
    height = 90,
    numFrames = 6,
    sheetContentWidth = 530,
    sheetContentHeight = 90
}
local spinnerMultiSheet5 = graphics.newImageSheet( "CountDown.png", options5 )

local sequenceData =
{
    name="walking",
    frames= { 6, 5, 4, 3, 2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 0        -- Optional ; default is 0
}

CountDown = display.newSprite( spinnerMultiSheet5, sequenceData )
CountDown.anchorX = 0.5
CountDown.anchorY = 0.5
CountDown.x = _W/2
CountDown.y = _H/1.07
FTgroup:insert(CountDown)
CountDown:play()
local Zappy5 = audio.loadSound("CountDown.mp3")
local ZappyC5 = audio.play(Zappy5)
	wellDone = timer.performWithDelay(5000,Congratulations)
	
	elseif(event.phase == "ended") then
	CountDown.isVisible = false
	timer.cancel(wellDone)
	wellDone = nil
	
	gameOverLayout2 = display.newRect( 0, 0, _W, _H)
 	gameOverLayout2:setFillColor( 0, 0, 0 )
 	gameOverLayout2.alpha = 0.8
 	gameOverLayout2.anchorX = 0
 	gameOverLayout2.anchorY = 0
 	FTgroup:insert(gameOverLayout2)

 	gameOverText2 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 40 )
	gameOverText2:setFillColor( 1, 0, 0 )
	gameOverText2.anchorX = 0.5
	gameOverText2.anchorY = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5
	FTgroup:insert(gameOverText2)

	audio.stop()
	CountDown:pause()
	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()
	
end
end
function Questions5()
	if Toucha == 0 then
	Questions[5] = "Put your middle finger on "..CircleRandom[Y[5]]
	txt.text = Questions[5]
	
	
	CountDown.isVisible = false
	
	if(CircleRandom[Y[5]] == RedaCircle1) then
		
		RedaCircle[array1[1]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == RedaCircle2) then
		
	    RedaCircle[array1[2]]:addEventListener("touch",NextQ5)
	    timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == RedaCircle3) then
		
		RedaCircle[array1[3]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == RedaCircle4) then
		
		RedaCircle[array1[4]]:addEventListener("touch",NextQ5) 
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == BlueaCircle1) then
		
		BlueaCircle[array2[1]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == BlueaCircle2) then
		
		BlueaCircle[array2[2]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == BlueaCircle3) then
		
		BlueaCircle[array2[3]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == BlueaCircle4) then
		
		BlueaCircle[array2[4]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == GoldaCircle1) then
		
		GoldaCircle[array3[1]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == GoldaCircle2) then
		
		GoldaCircle[array3[2]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == GoldaCircle3) then
		
		GoldaCircle[array3[3]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == GoldaCircle4) then
		
		GoldaCircle[array3[4]]:addEventListener("touch",NextQ5)
		timer.performWithDelay(5000,removeText5)
	elseif(CircleRandom[Y[5]] == GreenaCircle1) then
		
    	GreenaCircle[array4[1]]:addEventListener("touch",NextQ5)
    	timer.performWithDelay(5000,removeText5)
    elseif(CircleRandom[Y[5]] == GreenaCircle2) then
    	
    	GreenaCircle[array4[2]]:addEventListener("touch",NextQ5)
    	timer.performWithDelay(5000,removeText5)
    elseif(CircleRandom[Y[5]] == GreenaCircle3) then
    	
    	GreenaCircle[array4[3]]:addEventListener("touch",NextQ5)
    	timer.performWithDelay(5000,removeText5)
    elseif(CircleRandom[Y[5]] == GreenaCircle4) then
    	
    	GreenaCircle[array4[4]]:addEventListener("touch",NextQ5)
    	timer.performWithDelay(5000,removeText5)
    end
else
	end
end

function NextQ4(event)
	if(event.phase == "began") then
	
	local options4 = {
    width = 88.3,
    height = 90,
    numFrames = 6,
    sheetContentWidth = 530,
    sheetContentHeight = 90
}
local spinnerMultiSheet4 = graphics.newImageSheet( "CountDown.png", options4 )

local sequenceData =
{
    name="walking",
    frames= { 6, 5, 4, 3, 2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 1        -- Optional ; default is 0
}

CountDown = display.newSprite( spinnerMultiSheet4, sequenceData )
CountDown.anchorX = 0.5
CountDown.anchorY = 0.5
CountDown.x = _W/2
CountDown.y = _H/1.07
CountDown:play()

local Zappy4 = audio.loadSound("CountDown.mp3")
local ZappyC4 = audio.play(Zappy4)
	byebye4 = timer.performWithDelay(5000,Questions5)
	elseif(event.phase == "ended") then
	CountDown.isVisible = false
	timer.cancel(byebye4)
	byebye4 = nil

	gameOverLayout2 = display.newRect( 0, 0, _W, _H)
 	gameOverLayout2:setFillColor( 0, 0, 0 )
 	gameOverLayout2.alpha = 0.8
 	gameOverLayout2.anchorX = 0
 	gameOverLayout2.anchorY = 0
 	FTgroup:insert(gameOverLayout2)

 	gameOverText2 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 40 )
	gameOverText2:setFillColor( 1, 0, 0 )
	gameOverText2.anchorX = 0.5
	gameOverText2.anchorY = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5
	FTgroup:insert(gameOverText2)
	
	
	audio.stop()
	CountDown:pause()
	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()

	
end
end
function Questions4()
	if Toucha == 0 then
	Questions[4] = "Put your last finger on "..CircleRandom[Y[4]]
	txt.text = Questions[4]
	--group:insert(txt)
	
	CountDown.isVisible = false
	
	if(CircleRandom[Y[4]] == RedaCircle1) then
		RedaCircle[array1[1]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == RedaCircle2) then
	    RedaCircle[array1[2]]:addEventListener("touch",NextQ4)
	    --timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == RedaCircle3) then
		RedaCircle[array1[3]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == RedaCircle4) then
		RedaCircle[array1[4]]:addEventListener("touch",NextQ4) 
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == BlueaCircle1) then
		BlueaCircle[array2[1]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == BlueaCircle2) then
		BlueaCircle[array2[2]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == BlueaCircle3) then
		BlueaCircle[array2[3]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == BlueaCircle4) then
		BlueaCircle[array2[4]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == GoldaCircle1) then
		GoldaCircle[array3[1]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == GoldaCircle2) then
		GoldaCircle[array3[2]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == GoldaCircle3) then
		GoldaCircle[array3[3]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == GoldaCircle4) then
		GoldaCircle[array3[4]]:addEventListener("touch",NextQ4)
		--timer.performWithDelay(5000,removeText4)
	elseif(CircleRandom[Y[4]] == GreenaCircle1) then
    	GreenaCircle[array4[1]]:addEventListener("touch",NextQ4)
    	--timer.performWithDelay(5000,removeText4)
    elseif(CircleRandom[Y[4]] == GreenaCircle2) then
    	GreenaCircle[array4[2]]:addEventListener("touch",NextQ4)
    	--timer.performWithDelay(5000,removeText4)
    elseif(CircleRandom[Y[4]] == GreenaCircle3) then
    	GreenaCircle[array4[3]]:addEventListener("touch",NextQ4)
    	--timer.performWithDelay(5000,removeText4)
    elseif(CircleRandom[Y[4]] == GreenaCircle4) then
    	GreenaCircle[array4[4]]:addEventListener("touch",NextQ4)
    	--timer.performWithDelay(5000,removeText4)
    end
    else 
    end
end

function NextQ3(event)
	if(event.phase == "began") then
	print("Event Started")
	local options3 = {
    width = 88.3,
    height = 90,
    numFrames = 6,
    sheetContentWidth = 530,
    sheetContentHeight = 90
}
local spinnerMultiSheet3 = graphics.newImageSheet( "CountDown.png", options3 )

local sequenceData =
{
    name="walking",
    frames= { 6, 5, 4, 3, 2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 0        -- Optional ; default is 0
}

CountDown = display.newSprite( spinnerMultiSheet3, sequenceData )
CountDown.anchorX = 0.5
CountDown.anchorY = 0.5
CountDown.x = _W/2
CountDown.y = _H/1.07
CountDown:play()

local Zappy3 = audio.loadSound("CountDown.mp3")
local ZappyC3 = audio.play(Zappy3)

	byebye3 = timer.performWithDelay(5000,Questions4)
	elseif(event.phase == "ended") then
	CountDown.isVisible = false
	timer.cancel(byebye3)
	byebye3 = nil
	
	gameOverLayout2 = display.newRect( 0, 0, _W, _H)
 	gameOverLayout2:setFillColor( 0, 0, 0 )
 	gameOverLayout2.alpha = 0.8
 	gameOverLayout2.anchorX = 0
 	gameOverLayout2.anchorY = 0
 	FTgroup:insert(gameOverLayout2)

 	gameOverText2 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 40 )
	gameOverText2:setFillColor( 1, 0, 0 )
	gameOverText2.anchorX = 0.5
	gameOverText2.anchorY = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5
	FTgroup:insert(gameOverText2)
	
	audio.stop()
	CountDown:pause()
	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()
	

end
end
function Questions3()
	if Toucha == 0 then
	Questions[3] = "Put your thumb on "..CircleRandom[Y[3]]
	txt.text = Questions[3]
	--group:insert(txt)
	
	CountDown.isVisible = false
	
	if(CircleRandom[Y[3]] == RedaCircle1) then
		RedaCircle[array1[1]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == RedaCircle2) then
	    RedaCircle[array1[2]]:addEventListener("touch",NextQ3)
	    --timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == RedaCircle3) then
		RedaCircle[array1[3]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == RedaCircle4) then
		RedaCircle[array1[4]]:addEventListener("touch",NextQ3) 
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == BlueaCircle1) then
		BlueaCircle[array2[1]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == BlueaCircle2) then
		BlueaCircle[array2[2]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == BlueaCircle3) then
		BlueaCircle[array2[3]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == BlueaCircle4) then
		BlueaCircle[array2[4]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == GoldaCircle1) then
		GoldaCircle[array3[1]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == GoldaCircle2) then
		GoldaCircle[array3[2]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == GoldaCircle3) then
		GoldaCircle[array3[3]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == GoldaCircle4) then
		GoldaCircle[array3[4]]:addEventListener("touch",NextQ3)
		--timer.performWithDelay(5000,removeText3)
	elseif(CircleRandom[Y[3]] == GreenaCircle1) then
    	GreenaCircle[array4[1]]:addEventListener("touch",NextQ3)
    	--timer.performWithDelay(5000,removeText3)
    elseif(CircleRandom[Y[3]] == GreenaCircle2) then
  
    	GreenaCircle[array4[2]]:addEventListener("touch",NextQ3)
    	--timer.performWithDelay(5000,removeText3)
    elseif(CircleRandom[Y[3]] == GreenaCircle3) then
  
    	GreenaCircle[array4[3]]:addEventListener("touch",NextQ3)
    	--timer.performWithDelay(5000,removeText3)
    elseif(CircleRandom[Y[3]] == GreenaCircle4) then
  
    	GreenaCircle[array4[4]]:addEventListener("touch",NextQ3)
    	--timer.performWithDelay(5000,removeText3)
    end
else
	end
end
function NextQ2(event)
	if(event.phase == "began") then
	
	local options2 = {
    width = 88.3,
    height = 90,
    numFrames = 6,
    sheetContentWidth = 530,
    sheetContentHeight = 90
}
local spinnerMultiSheet2 = graphics.newImageSheet( "CountDown.png", options2 )

local sequenceData =
{
    name="walking",
    frames= { 6, 5, 4, 3, 2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 0        -- Optional ; default is 0
}

CountDown = display.newSprite( spinnerMultiSheet2, sequenceData )
CountDown.anchorX = 0.5
CountDown.anchorY = 0.5
CountDown.x = _W/2
CountDown.y = _H/1.07
CountDown:play()

local Zappy2 = audio.loadSound("CountDown.mp3")
local ZappyC2 = audio.play(Zappy2)

	byebye2 = timer.performWithDelay(5000,Questions3)
	elseif(event.phase == "ended") then
	CountDown.isVisible = false
	timer.cancel(byebye2)
	byebye2 = nil

	gameOverLayout2 = display.newRect( 0, 0, _W, _H)
 	gameOverLayout2:setFillColor( 0, 0, 0 )
 	gameOverLayout2.alpha = 0.8
 	gameOverLayout2.anchorX = 0
 	gameOverLayout2.anchorY = 0
 	FTgroup:insert(gameOverLayout2)

 	gameOverText2 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 40 )
	gameOverText2:setFillColor( 1, 0, 0 )
	gameOverText2.anchorX = 0.5
	gameOverText2.anchorY = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5
	FTgroup:insert(gameOverText2)
	
	audio.stop()
	CountDown:pause()
	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()
	
	
end
end
function Questions2()
	if Toucha == 0 then
    Questions[2] = "Put your ring finger on "..CircleRandom[Y[2]]
	txt.text = Questions[2]
	--group:insert(txt)
	CountDown.isVisible = false
	
	if(CircleRandom[Y[2]] == RedaCircle1) then
		RedaCircle[array1[1]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == RedaCircle2) then
	    RedaCircle[array1[2]]:addEventListener("touch",NextQ2)
	    --timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == RedaCircle3) then
		RedaCircle[array1[3]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == RedaCircle4) then
		RedaCircle[array1[4]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2) 
	elseif(CircleRandom[Y[2]] == BlueaCircle1) then
		BlueaCircle[array2[1]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == BlueaCircle2) then
		BlueaCircle[array2[2]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == BlueaCircle3) then
		BlueaCircle[array2[3]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == BlueaCircle4) then
		BlueaCircle[array2[4]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == GoldaCircle1) then
		GoldaCircle[array3[1]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == GoldaCircle2) then
		GoldaCircle[array3[2]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == GoldaCircle3) then
		GoldaCircle[array3[3]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == GoldaCircle4) then
		GoldaCircle[array3[4]]:addEventListener("touch",NextQ2)
		--timer.performWithDelay(5000,removeText2)
	elseif(CircleRandom[Y[2]] == GreenaCircle1) then
    	GreenaCircle[array4[1]]:addEventListener("touch",NextQ2)
    	--timer.performWithDelay(5000,removeText2)
    elseif(CircleRandom[Y[2]] == GreenaCircle2) then
  
    	GreenaCircle[array4[2]]:addEventListener("touch",NextQ2)
    	--timer.performWithDelay(5000,removeText2)
    elseif(CircleRandom[Y[2]] == GreenaCircle3) then
  
    	GreenaCircle[array4[3]]:addEventListener("touch",NextQ2)
    	--timer.performWithDelay(5000,removeText2)
    elseif(CircleRandom[Y[2]] == GreenaCircle4) then
  
    	GreenaCircle[array4[4]]:addEventListener("touch",NextQ2)
    	--timer.performWithDelay(5000,removeText2)
    end
  else 

  end
    end




function NextQ1(event)
	if(event.phase == "began") then
	
	local options1 = {
    width = 88.3,
    height = 90,
    numFrames = 6,
    sheetContentWidth = 530,
    sheetContentHeight = 90
}
local spinnerMultiSheet1 = graphics.newImageSheet( "CountDown.png", options1 )

local sequenceData =
{
    name="walking",
    frames= { 6, 5, 4, 3, 2, 1}, -- frame indexes of animation, in image sheet
    time = 5000,
    loopCount = 1        -- Optional ; default is 0
}
CountDown = display.newSprite( spinnerMultiSheet1, sequenceData )
CountDown.anchorX = 0.5
CountDown.anchorY = 0.5
CountDown.x = _W/2
CountDown.y = _H/1.07
CountDown:play()

local Zappy1 = audio.loadSound("CountDown.mp3")
local ZappyC1 = audio.play(Zappy1) 
	--byebye1 = timer.performWithDelay(5000,Congratulations)
	byebye1 = timer.performWithDelay(5000,Questions2)
	elseif(event.phase == "ended") then
	CountDown.isVisible = false
	timer.cancel(byebye1)
	byebye1 = nil

	gameOverLayout2 = display.newRect( 0, 0, _W, _H)
 	gameOverLayout2:setFillColor( 0, 0, 0 )
 	gameOverLayout2.alpha = 0.8
 	gameOverLayout2.anchorX = 0
 	gameOverLayout2.anchorY = 0
 	FTgroup:insert(gameOverLayout2)

 	gameOverText2 = display.newText( "GAME OVER", 0, 0, native.systemFontBold, 40 )
	gameOverText2:setFillColor( 1, 0, 0 )
	gameOverText2.anchorX = 0.5
	gameOverText2.anchorY = 0.5
	gameOverText2.x, gameOverText2.y = _W * 0.5, _H * 0.5
	FTgroup:insert(gameOverText2)
	
	audio.stop()
	CountDown:pause()
	button1:setEnabled(true)
	button1.isVisible = true
	button2:setEnabled(true)
	button2.isVisible = true
	button1:toFront()
	button2:toFront()


	
end
end
if Toucha == 0 then
	Questions = {}
	Questions[1] = "Put your index finger on "..CircleRandom[Y[1]]
	txt.text = Questions[1]
	--group:insert(txt)
	
	if(CircleRandom[Y[1]] == RedaCircle1) then
		
		RedaCircle[array1[1]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == RedaCircle2) then
	
	    RedaCircle[array1[2]]:addEventListener("touch",NextQ1)
	    --timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == RedaCircle3) then
		
		RedaCircle[array1[3]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == RedaCircle4) then
		
		RedaCircle[array1[4]]:addEventListener("touch",NextQ1) 
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == BlueaCircle1) then
		
		BlueaCircle[array2[1]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == BlueaCircle2) then
		
		BlueaCircle[array2[2]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == BlueaCircle3) then
		
		BlueaCircle[array2[3]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == BlueaCircle4) then
		
		BlueaCircle[array2[4]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == GoldaCircle1) then
	
		GoldaCircle[array3[1]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == GoldaCircle2) then
		
		GoldaCircle[array3[2]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == GoldaCircle3) then
		
		GoldaCircle[array3[3]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == GoldaCircle4) then
		
		GoldaCircle[array3[4]]:addEventListener("touch",NextQ1)
		--timer.performWithDelay(5000,removeText1)
	elseif(CircleRandom[Y[1]] == GreenaCircle1) then
		
    	GreenaCircle[array4[1]]:addEventListener("touch",NextQ1)
    	--timer.performWithDelay(5000,removeText1)
    elseif(CircleRandom[Y[1]] == GreenaCircle2) then
    	
    	GreenaCircle[array4[2]]:addEventListener("touch",NextQ1)
    	--timer.performWithDelay(5000,removeText1)
    elseif(CircleRandom[Y[1]] == GreenaCircle3) then
    	
    	GreenaCircle[array4[3]]:addEventListener("touch",NextQ1)
    	--timer.performWithDelay(5000,removeText1)
    elseif(CircleRandom[Y[1]] == GreenaCircle4) then
    	
    	GreenaCircle[array4[4]]:addEventListener("touch",NextQ1)
    	--timer.performWithDelay(5000,removeText1)
    end
else

end	



end
function scene:enterScene( event )
	 storyboard.purgeScene("GameTherapy")
	 storyboard.purgeScene("LoadingF")
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