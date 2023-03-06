display.setStatusBar(display.HiddenStatusBar)
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require "widget"


function scene:createScene( event )

AveScore = 5
QuestionNumber = 1
score = 0
STClick = audio.loadSound("click.mp3")
audio.setVolume (0.3)
-- define the questions
question = {
	{"Do you often get neck or shoulder pain in the day?", 1},
	{"Do you feel depressed often?", 1},
	{"How often are you feeling weak & susceptible to illness?", 1},
	{"How often do you feel that you are worthless?", 1},
	{"Do you feel anxious often?", 1},
	{"Do you feel that there is never sufficient time to get everything done?", 1},
	{"Do you complain about time wasted and the past?", 1},
	{"Do you have time to do something for fun at least once a week?", 0},
	{"How often are you happy?", 0},
	{"Do you rush through everything you do?", 1},
	{"Do you get irritated easily?", 1},
	{"Do you feel that you are achieving less than you should?", 1},
	{"How often do you feel that you are having a good day?", 0},
	{"How often are you calm when kept waiting/late for an appointment?", 0},
	{"How often do you lose your appetite?", 1},
	{"How often do you have trouble thinking clearly?", 1},
	{"Do you find that you do not have time to plan as much as you would like to?", 1},
	{"Do you feel run down and drained of physical or emotional energy?", 1},
	{"How often do you find yourself not having enough sleep?", 1},
	{"Do you find it hard to spot humour in situations where others deem humorous?", 1}
}

batteryStatus = {}
_W = display.viewableContentWidth
_H = display.viewableContentHeight
font1 = "DK Cool Crayon"
stresstestgroup = self.view

-- display a background image
local background = display.newImageRect( "Background11.png", _W, _H)
background.anchorX = 0
background.anchorY = 0
background.x, background.y = 0, 0
stresstestgroup:insert (background)

-- display a TV image
local TV = display.newImageRect( "TV.png", _W/2, _H/2)
TV.anchorX = 0.5
TV.anchorY = 0.5
TV:scale(1.8,1)
TV.x, TV.y = _W/2, _H*0.35
stresstestgroup:insert (TV)

-- display title 
pagetitleopt = {

	text = "Stress-O-Meter",
	x = _W/2,
	y = _H * 0.08,
	font = font1,
	fontSize = 50,
	align = "center"
}

local pagetitle = display.newText (pagetitleopt) 
pagetitle:setFillColor(1,0,0.8)
stresstestgroup:insert (pagetitle)

-- display summary of results at end of test

function displaySummary ()
	AnsBtn1.alpha = 0
	AnsBtn1:setEnabled (false)
	AnsBtn2.alpha = 0
	AnsBtn2:setEnabled (false)
	AnsBtn3.alpha = 0
	AnsBtn3:setEnabled (false)
	AnsBtn4.alpha = 0
	AnsBtn4:setEnabled (false)
	AnsBtn5.alpha = 0
	AnsBtn5:setEnabled (false)
	QuestionNum.alpha = 0
	QuestionText.alpha = 0 
	if (AveScore >= 4) then
		stressLevel = "zero or very low"
	elseif (AveScore < 4 and AveScore >= 3) then
		stressLevel = "moderate"
	elseif (AveScore < 3 and AveScore >= 2) then
		stressLevel = "high"
	elseif (AveScore < 2) then
		stressLevel = "very high"
	end
	resultTextOpt = {
	text = "Test Results: You are experiencing "..stressLevel.." level of stress. You may want to try our therapy modules (especially our unique Biorhythmic Therapy) to enhance your well being or reduce your stress level.",
	x = _W * 0.23,
	y = _H * 0.2,
	width = 350,
	height = 360,
	font = font1,
	fontSize = 26,
	align = "left"
	}

	resultText = display.newText (resultTextOpt)
	resultText:setFillColor (1, 0, 1)
	resultText.anchorX = 0
	resultText.anchorY = 0
	stresstestgroup:insert(resultText)

end
	
-- create 5 widget buttons for answers 
	

function onAnsBtn1 (event)

	if (event.phase == "ended") then
		
		
		audio.play(STClick)
		if (QuestionNumber <= 20) then
			if (event.phase == "ended") then
				if (question[QuestionNumber][2] == 1) then
					score = score + 5
				else
					score = score + 1
				end

				-- calculate average score
				AveScore = score/QuestionNumber

				-- show battery indicator
				battStatus.alpha = 0
				if (AveScore == 5) then
					battStatus = batteryStatus[1]
					battStatus.alpha = 1
				elseif (AveScore < 5 and AveScore >= 4) then
					battStatus = batteryStatus[2]
					battStatus.alpha = 1
				elseif (AveScore < 4 and AveScore >= 3) then
					battStatus = batteryStatus[3]
					battStatus.alpha = 1
				elseif (AveScore < 3 and AveScore >= 2) then
					battStatus = batteryStatus[4]
					battStatus.alpha = 1
				elseif (AveScore < 2) then 
					battStatus = batteryStatus[5]
					battStatus.alpha = 1
				end
				battStatus.x = _W * 0.82
				battStatus.y = _H * 0.25
				batteryStatusText.text = string.format("%.1f", AveScore)

				-- Next question number
				QuestionNumber = QuestionNumber + 1
				
				-- display new question
				QuestionNum.text = "Question: "..QuestionNumber.." of 20"
				QuestionText.text = question[QuestionNumber][1]

			end
		end
		if (QuestionNumber >= 20) then
			displaySummary()
		end
	end	
end



AnsBtn1 = widget.newButton{
	label="Never",
	labelColor = { default={1,1,1}, over={1,0,0} },
	labelAlign = "center",
	defaultFile="Pebble1.png",
	overFile="Pebble1.png",
	width=120, 
	height=90,
	font = font1,
	fontSize = 25,
	onEvent = onAnsBtn1	-- event listener function
	}

	AnsBtn1.anchorX = 0
	AnsBtn1.anchorY = 0
	AnsBtn1.x = 0
	AnsBtn1.y = _H*0.8
	stresstestgroup:insert (AnsBtn1)
	
function onAnsBtn2 (event)
	if (event.phase == "ended") then
		
		audio.play(STClick)
		if (QuestionNumber <= 20) then
			if (event.phase == "ended") then
				if (question[QuestionNumber][2] == 1) then
					score = score + 4
				else
					score = score + 2
				end

				-- calculate average score
				AveScore = score/QuestionNumber

				-- show battery indicator
				battStatus.alpha = 0
				if (AveScore == 5) then
					battStatus = batteryStatus[1]
					battStatus.alpha = 1
				elseif (AveScore < 5 and AveScore >= 4) then
					battStatus = batteryStatus[2]
					battStatus.alpha = 1
				elseif (AveScore < 4 and AveScore >= 3) then
					battStatus = batteryStatus[3]
					battStatus.alpha = 1
				elseif (AveScore < 3 and AveScore >= 2) then
					battStatus = batteryStatus[4]
					battStatus.alpha = 1
				elseif (AveScore < 2) then 
					battStatus = batteryStatus[5]
					battStatus.alpha = 1
				end
				battStatus.x = _W * 0.82
				battStatus.y = _H * 0.25
				batteryStatusText.text = string.format("%.1f", AveScore)

				-- Next question number
				QuestionNumber = QuestionNumber + 1
				
				-- display new question
				QuestionNum.text = "Question: "..QuestionNumber.." of 20"
				QuestionText.text = question[QuestionNumber][1]
				
			end
		end
		if (QuestionNumber >= 20) then
			displaySummary()
		end
	end	
end

AnsBtn2 = widget.newButton{
	label=" Rarely",
	labelAlign = "center",
	labelColor = { default={1,1,1}, over={1,0,0} },
	defaultFile="Pebble2.png",
	overFile="Pebble2.png",
	width=135, 
	height=90,
	font = font1,
	fontSize = 25,
	onEvent = onAnsBtn2	-- event listener function
	}

	AnsBtn2.anchorX = 0
	AnsBtn2.anchorY = 0
	AnsBtn2.x = _W*0.18
	AnsBtn2.y = _H*0.76
	stresstestgroup:insert (AnsBtn2)

function onAnsBtn3 (event)
	if (event.phase == "ended") then
		
		
		audio.play(STClick)
		if (QuestionNumber <= 20) then
			if (event.phase == "ended") then
				if (question[QuestionNumber][2] == 1) then
					score = score + 3
				else
					score = score + 3
				end

				-- calculate average score
				AveScore = score/QuestionNumber

				-- show battery indicator
				battStatus.alpha = 0
				if (AveScore == 5) then
					battStatus = batteryStatus[1]
					battStatus.alpha = 1
				elseif (AveScore < 5 and AveScore >= 4) then
					battStatus = batteryStatus[2]
					battStatus.alpha = 1
				elseif (AveScore < 4 and AveScore >= 3) then
					battStatus = batteryStatus[3]
					battStatus.alpha = 1
				elseif (AveScore < 3 and AveScore >= 2) then
					battStatus = batteryStatus[4]
					battStatus.alpha = 1
				elseif (AveScore < 2) then 
					battStatus = batteryStatus[5]
					battStatus.alpha = 1
				end
				battStatus.x = _W * 0.82
				battStatus.y = _H * 0.25
				batteryStatusText.text = string.format("%.1f", AveScore)

				-- Next question number
				QuestionNumber = QuestionNumber + 1
			
				-- display new question
				QuestionNum.text = "Question: "..QuestionNumber.." of 20"
				QuestionText.text = question[QuestionNumber][1]
				
			end
		end
		if (QuestionNumber >= 20) then
			displaySummary()
		end
	end	
end

AnsBtn3 = widget.newButton{
	label="  Sometimes",
	labelAlign = "center",
	labelColor = { default={1,1,1}, over={1,0,0} },
	defaultFile="Pebble3.png",
	overFile="Pebble3.png",
	width=150, 
	height=90,
	font = font1,
	fontSize = 20,
	onEvent = onAnsBtn3	-- event listener function
	}
	AnsBtn3.anchorX = 0
	AnsBtn3.anchorY = 0
	AnsBtn3.x = _W*0.35
	AnsBtn3.y = _H*0.72
	stresstestgroup:insert (AnsBtn3)

function onAnsBtn4 (event)
	
	if (event.phase == "ended") then
		
		audio.play(STClick)
		if (QuestionNumber <= 20) then
			if (event.phase == "ended") then
				if (question[QuestionNumber][2] == 1) then
					score = score + 2
				else
					score = score + 4
				end

				-- calculate average score
				AveScore = score/QuestionNumber

				-- show battery indicator
				battStatus.alpha = 0
				if (AveScore == 5) then
					battStatus = batteryStatus[1]
					battStatus.alpha = 1
				elseif (AveScore < 5 and AveScore >= 4) then
					battStatus = batteryStatus[2]
					battStatus.alpha = 1
				elseif (AveScore < 4 and AveScore >= 3) then
					battStatus = batteryStatus[3]
					battStatus.alpha = 1
				elseif (AveScore < 3 and AveScore >= 2) then
					battStatus = batteryStatus[4]
					battStatus.alpha = 1
				elseif (AveScore < 2) then 
					battStatus = batteryStatus[5]
					battStatus.alpha = 1
				end
				battStatus.x = _W * 0.82
				battStatus.y = _H * 0.25
				batteryStatusText.text = string.format("%.1f", AveScore)

				-- Next question number
				QuestionNumber = QuestionNumber + 1
				
				-- display new question
				QuestionNum.text = "Question: "..QuestionNumber.." of 20"
				QuestionText.text = question[QuestionNumber][1]
				
			end
		end
		if (QuestionNumber >= 20) then
			displaySummary()
		end
	end	
end

AnsBtn4 = widget.newButton{
	label=" Often",
	labelAlign = "center",
	labelColor = { default={1,1,1}, over={1,0,0} },
	defaultFile="Pebble4.png",
	overFile="Pebble4.png",
	width=120, 
	height=70,
	font = font1,
	fontSize = 20,
	onEvent = onAnsBtn4	-- event listener function
	}
	AnsBtn4.anchorX = 0
	AnsBtn4.anchorY = 0
	AnsBtn4.x = _W*0.52
	AnsBtn4.y = _H*0.68
	stresstestgroup:insert (AnsBtn4)

function onAnsBtn5 (event)
	if (event.phase == "ended") then
		
		audio.play(STClick)
		if (QuestionNumber <= 20) then
			if (event.phase == "ended") then
				if (question[QuestionNumber][2] == 1) then
					score = score + 1
				else
					score = score + 5
				end

				-- calculate average score
				AveScore = score/QuestionNumber

				-- show battery indicator
				battStatus.alpha = 0
				if (AveScore == 5) then
					battStatus = batteryStatus[1]
					battStatus.alpha = 1
				elseif (AveScore < 5 and AveScore >= 4) then
					battStatus = batteryStatus[2]
					battStatus.alpha = 1
				elseif (AveScore < 4 and AveScore >= 3) then
					battStatus = batteryStatus[3]
					battStatus.alpha = 1
				elseif (AveScore < 3 and AveScore >= 2) then
					battStatus = batteryStatus[4]
					battStatus.alpha = 1
				elseif (AveScore < 2) then 
					battStatus = batteryStatus[5]
					battStatus.alpha = 1
				end
				battStatus.x = _W * 0.82
				battStatus.y = _H * 0.25
				batteryStatusText.text = string.format("%.1f", AveScore)

				-- Next question number
				QuestionNumber = QuestionNumber + 1

				-- display new question
				QuestionNum.text = "Question: "..QuestionNumber.." of 20"
				QuestionText.text = question[QuestionNumber][1]
				
			end
		end
		if (QuestionNumber >= 20) then
			displaySummary()
		end
	end	
end

AnsBtn5 = widget.newButton{
	label="  Always",
	labelAlign = "center",
	labelColor = { default={1,1,1}, over={255/255,0/255,0/255} },
	defaultFile="Pebble5.png",
	overFile="Pebble5.png",
	width=120, 
	height=80,
	font = font1,
	fontSize = 20,
	onEvent = onAnsBtn5	-- event listener function
	}
	AnsBtn4.anchorX = 0
	AnsBtn4.anchorY = 0
	AnsBtn5.x = _W*0.68
	AnsBtn5.y = _H*0.65
	stresstestgroup:insert (AnsBtn5)

-- Hermit Crab back button
function onBackBtn1 (event)
	if (event.phase == "ended") then
		
		audio.play(STClick)
		storyboard.gotoScene( "menu", {effect = "crossFade", time = 300} )
	end
end

BackBtn1 = widget.newButton{
	defaultFile="hcbackicon1.png",
	overFile="hcbackicon2.png",
	width=150, 
	height=150,
	onEvent = onBackBtn1	-- event listener function
	}
	BackBtn1.anchorX = 0
	BackBtn1.anchorY = 0
	BackBtn1.x = _W * 0.77
	BackBtn1.y = _H * 0.73
	stresstestgroup:insert (BackBtn1)	

-- Load battery icon into memory

for i = 1, 6 do
	batteryStatus[i] = display.newImageRect("battery"..i..".png",48,192)
	batteryStatus[i].anchorX = 0
	batteryStatus[i].anchorY = 0
	batteryStatus[i].alpha = 0
	stresstestgroup:insert (batteryStatus[i])	
end

	-- display battery indicator
	battStatus = batteryStatus[1]
	battStatus.alpha = 1
	battStatus.x = _W * 0.82
	battStatus.y = _H * 0.25
	batteryStatusTextopt = {
		text = string.format("%.1f", AveScore),
		x = batteryStatus[1].x,
		y = batteryStatus[1].y + batteryStatus[1].height + 10,
		font = font1,
		fontSize = 30
	}
	batteryStatusText = display.newText (batteryStatusTextopt)
	batteryStatusText.anchorX = 0
	batteryStatusText.anchorY = 0
	batteryStatusText:setFillColor(0,0,0)
	stresstestgroup:insert(batteryStatusText)

-- Display Question Number
QuestionNum = display.newText("Question: "..QuestionNumber.." of 20",_W*0.45,_H*0.554,font1,30)
QuestionNum:setFillColor(1,0,0)
stresstestgroup:insert(QuestionNum)

-- Display First Question
QuestionTextOpt = {
	text = question[QuestionNumber][1],
	x = _W * 0.23,
	y = _H * 0.2,
	width = 350,
	height = 360,
	font = font1,
	fontSize = 40,
	align = "left"
}

QuestionText = display.newText(QuestionTextOpt)
QuestionText.anchorX = 0
QuestionText.anchorY = 0
QuestionText:setFillColor (0,0,1)
stresstestgroup:insert(QuestionText)

-- Set everything to invisible and disabled first
AnsBtn1.alpha = 0
AnsBtn1:setEnabled (false)
AnsBtn2.alpha = 0
AnsBtn2:setEnabled (false)
AnsBtn3.alpha = 0
AnsBtn3:setEnabled (false)
AnsBtn4.alpha = 0
AnsBtn4:setEnabled (false)
AnsBtn5.alpha = 0
AnsBtn5:setEnabled (false)
QuestionNum.alpha = 0
QuestionText.alpha = 0

-- Display Instructions first
displayTextopt = {
	text = "Welcome! Stress-O-Meter is to test your current stress level. The battery indicator on the right shows your current stress level as you answer through the 20 questions. Green is low level of Stress while Red is high. Ready to Go?",
	x = _W * 0.23,
	y = _H * 0.2,
	width = 350,
	height = 360,
	font = font1,
	fontSize = 25,
	align = "left"
	}

displayText = display.newText(displayTextopt)
displayText.anchorX = 0
displayText.anchorY = 0
displayText:setFillColor (0,0,1)
stresstestgroup:insert(displayText)

function BeginTest ()
	-- Display Question 1 and Pebbles
	AnsBtn1.alpha = 1
	AnsBtn1:setEnabled (true)
	AnsBtn2.alpha = 1
	AnsBtn2:setEnabled (true)
	AnsBtn3.alpha = 1
	AnsBtn3:setEnabled (true)
	AnsBtn4.alpha = 1
	AnsBtn4:setEnabled (true)
	AnsBtn5.alpha = 1
	AnsBtn5:setEnabled (true)
	QuestionNum.alpha = 1
	QuestionNum.text = "Question: "..QuestionNumber.." of 20"
	QuestionText.text = question[QuestionNumber][1]
	QuestionText.alpha = 1
end

function onBeginBtn1 (event)
	if (event.phase == "ended") then
		
		audio.play(STClick)
		displayText.alpha = 0
		displayText.text = nil
		BeginBtn1:setEnabled (false)
		BeginBtn1.alpha = 0
		BeginTest ()
	end
end

BeginBtn1 = widget.newButton{	
	defaultFile = "TurtleGo1.png",
	overFile = "TurtleGo2.png",
	width = 150, 
	height = 150,
	onEvent = onBeginBtn1	-- event listener function
	}
	BeginBtn1.anchorX = 0
	BeginBtn1.anchorY = 0
	BeginBtn1.x = _W * 0.03
	BeginBtn1.y = _H * 0.72
	stresstestgroup:insert (BeginBtn1)	
end

function scene:enterScene( event )
	storyboard.purgeScene("menu")
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