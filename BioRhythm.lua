display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

scene = storyboard.newScene()

local widget = require("widget")
local sqlite = require("sqlite3")
widget.setTheme( "widget_theme_ios7" )



function scene:createScene(event)

_W = display.viewableContentWidth
_H = display.viewableContentHeight

font1 = "Belligerent Madness"
font2 = "EtharnigSc"
bgroup = self.view
  
    path = system.pathForFile("StressZapper.sqlite",system.DocumentsDirectory)
    db = sqlite.open(path)
    db:exec("CREATE TABLE IF NOT EXISTS BioRhythm(id INTEGER PRIMARY KEY, Date_Of_Birth, Day_Of_Birth, Month_Of_Birth, Year_Of_Birth, Days_Since_Birth, Physical, Emotional, Intellectual, Spiritual, Compassion, Self_Awareness, Aesthetics);")
	background = display.newRect(0,0,_W,_H)
	background.anchorX = 0
	background.anchorY= 0
    
    bgroup:insert(background)


    titleDOB = display.newImage("PleaseEnterYourDOB.png")
    titleDOB.anchorX = 0
    titleDOB.anchorY = 0
    titleDOB.x = _W/6
    titleDOB.y = _H/50
    bgroup:insert(titleDOB)

    
    -- Function to handle button events

local function handleButtonEvent( event )
    local loadingB = display.newImage("LoadingBio.png")
    loadingB.anchorX = 0
    loadingB.anchorY = 0
    loadingB.x = _W*0.5
    loadingB.y = _H*0.85
    bgroup:insert(loadingB)
    if ( "ended" == event.phase ) then
        local Bclick = audio.loadSound("click.mp3")
        audio.play(Bclick)
        storyboard.gotoScene("Visualizer", {effect = "crossFade", time = 300})
    end
end



function Back()
    localB2click = audio.loadSound("click.mp3")
    audio.play(B2click)
    storyboard.gotoScene("menu",{effect = "crossFade", time = 300})
end
 days = {}
 years = {}

-- Populate the "days" table
for d = 1, 31 do
    days[d] = d
end

-- Populate the "years" table
for y = 1, 300 do
    years[y] = 1900 + y
end

-- Configure the picker wheel columns

for row in db:nrows("SELECT COUNT(id) AS count FROM BioRhythm") do
    if row.count == 1 then
        for row in db:nrows("SELECT Day_Of_Birth FROM BioRhythm") do
            today = tonumber(row.Day_Of_Birth)
        end
        for row in db:nrows("SELECT Month_Of_Birth FROM BioRhythm") do
            tomonthString = row.Month_Of_Birth
            local monthNumbers = {}
            monthNumbers["January"] = 1
            monthNumbers["February"] = 2
            monthNumbers["March"] = 3
            monthNumbers["April"] = 4
            monthNumbers["May"] = 5
            monthNumbers["June"] = 6
            monthNumbers["July"] = 7
            monthNumbers["August"] = 8
            monthNumbers["September"] = 9
            monthNumbers["October"] = 10
            monthNumbers["November"] = 11
            monthNumbers["December"] = 12
            tomonth= monthNumbers[tomonthString]
        end
        for row in db:nrows("SELECT Year_Of_Birth FROM BioRhythm") do
            toyear = tonumber(row.Year_Of_Birth) -1900
        end
    elseif row.count == 0 then
        today = os.date ("%d")
        tomonth = os.date ("%m")
        toyear = os.date ("%Y") - 1900
    end
end




MDLeapYear = {31,29,31,30,31,30,31,31,30,31,30,31}
MDNoLeapYear = {31,28,31,30,31,30,31,31,30,31,30,31}
LeapYear = {31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366}
NoLeapYear = {31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365}

columnData = 
{
    -- Months
    { 
        align = "center",
        width = 100,
        startIndex = tonumber(tomonth),
        labels = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
    },
    -- Days
    {
        align = "center",
        width = 80,
        startIndex = tonumber(today),
        labels = days
    },
    -- Years
    {
        align = "center",
        width = 140,
        startIndex = tonumber(toyear),
        labels = years
    }
}

-- Image sheet options and declaration
 options = {
    frames = 
    {
        { x=0, y=0, width=322, height=222 },
        { x=322, y=0, width=322, height=222 },
        { x=644, y=0, width=4, height=222 }
    },
    sheetContentWidth = 648,
    sheetContentHeight = 222
}
 pickerWheelSheet = graphics.newImageSheet( "widget-pickerwheel.png", options )


-- Create the widget
 pickerWheel = widget.newPickerWheel
{
    top = _H/2.5,
    left= _W/3.5,
    columns = columnData,
    sheet = pickerWheelSheet,
    overlayFrame = 1,
    overlayFrameWidth = 322,
    overlayFrameHeight = 222,
    backgroundFrame = 2,
    backgroundFrameWidth = 322,
    backgroundFrameHeight = 222,
    seperatorFrame = 3,
    seperatorFrameWidth = 4,
    seperatorFrameHeight = 222
}
bgroup:insert(pickerWheel)
Submit = widget.newButton{
    width = 200,
    height = 100,
    defaultFile = "Submit1.png",
    overFile = "Submit2.png",
    onRelease = function()

    local b4click = audio.loadSound("click.mp3")
    audio.play(b4click)

    values = pickerWheel:getValues()
-- Get the value for each column in the wheel (by column index)
 MonthOfBirth = values[1].value
 DayOfBirth = values[2].value
 YearOfBirth = values[3].value
 


 date = os.date( "*t" ) 
 yearNow = date.year
 monthNow = date.month
 dayNow = date.day
 YearsSinceBirth = yearNow - (YearOfBirth + 1)


if (YearOfBirth % 4 == 0) then

    DaysOfFirstYear = 366-(LeapYear[values[1].index-1]+DayOfBirth-1)
else
    DaysOfFirstYear = 365-(NoLeapYear[values[1].index-1]+DayOfBirth-1)
end


 DaysOfCurrentYear = dayNow

if (yearNow % 4 == 0) then

DaysOfCurrentYear = LeapYear[monthNow-1] + dayNow
else

DaysOfCurrentYear = NoLeapYear[monthNow-1] + dayNow
end


DaysSinceBirth = 0
for i = YearOfBirth + 1, yearNow - 1 do
    if((i) % 4 == 0) then
        DaysSinceBirth = DaysSinceBirth + 366

    else
        DaysSinceBirth = DaysSinceBirth + 365
    end

end


DaysSinceBirth = DaysSinceBirth + DaysOfFirstYear + DaysOfCurrentYear

for row in db:nrows("SELECT COUNT(id) AS count FROM BioRhythm") do
    if row.count == 1 then
            sql = [[UPDATE BioRhythm SET Date_Of_Birth = "]]..DayOfBirth.." "..MonthOfBirth.." "..YearOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Day_Of_Birth = "]]..DayOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Month_Of_Birth = "]]..MonthOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Year_Of_Birth = "]]..YearOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
    else 
            sql = [[INSERT INTO BioRhythm (Date_Of_Birth) VALUES("]]..DayOfBirth.." "..MonthOfBirth.." "..YearOfBirth..[[")]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Day_Of_Birth = "]]..DayOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Month_Of_Birth = "]]..MonthOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
            sql = [[UPDATE BioRhythm SET Year_Of_Birth = "]]..YearOfBirth..[[" WHERE id="1"]]
            db:exec(sql)
    end
end

sql = [[ UPDATE BioRhythm SET Days_Since_Birth = "]]..DaysSinceBirth..[[" WHERE id="1"]]
db:exec(sql)

physicalPercentage = math.sin((2*math.pi*DaysSinceBirth)/23) * 100
emotionalPercentage = math.sin((2*math.pi*DaysSinceBirth)/28) * 100
intellectualPercentage = math.sin((2*math.pi*DaysSinceBirth)/33) * 100
spiritualPercentage = math.sin((2*math.pi*DaysSinceBirth)/53) * 100
selfAwarenessPercentage = math.sin((2*math.pi*DaysSinceBirth)/48) * 100
aestheticsPercentage = math.sin((2*math.pi*DaysSinceBirth)/43) * 100
intuitionCompassionPercentage = math.sin((2*math.pi*DaysSinceBirth)/38) * 100
sql = [[ UPDATE BioRhythm SET Physical = "]]..physicalPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Emotional = "]]..emotionalPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Intellectual = "]]..intellectualPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Spiritual = "]]..spiritualPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Self_Awareness = "]]..selfAwarenessPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Compassion = "]]..intuitionCompassionPercentage..[[" WHERE id="1"]]
db:exec(sql)
sql = [[ UPDATE BioRhythm SET Aesthetics = "]]..aestheticsPercentage..[[" WHERE id="1"]]
db:exec(sql)

pickerWheel.isVisible = false
Submit.isVisible = false
Submit:setEnabled (false)

titleDOB.isVisible = false
GoBack.isVisible = false

metalchart = display.newImageRect("Metal.png",_W,_W)
metalchart.anchorX = 0
metalchart.anchorY = 0
metalchart.x = 0
metalchart.y = _H/10

bgroup:insert(metalchart)
 

physical = display.newText(math.ceil(physicalPercentage).."%",100,100,font2,50)
physical.anchorX = 0
physical.anchorY = 0
physical.x = _W/1.4
physical.y = metalchart.y + 130
physical:setFillColor(Black)
bgroup:insert(physical)
physicalText = display.newText("Physical",100,50,font1,35)
physicalText.anchorX = 0.5
physicalText.anchorY = 0
physicalText.x = _W*0.28
physicalText.y = metalchart.y + 130
physicalText:setFillColor(0)
bgroup:insert(physicalText)

emotional = display.newText(math.ceil(emotionalPercentage).."%",100,100,font2,50)
emotional.anchorX = 0
emotional.anchorY = 0
emotional.x = _W/1.4
emotional.y = physical.y + 60
emotional:setFillColor(Black)
bgroup:insert(emotional)
emotionalText = display.newText("Emotional",100,50,font1,35)
emotionalText.anchorX = 0.5
emotionalText.anchorY = 0
emotionalText.x = _W*0.28
emotionalText.y = physical.y + 60
emotionalText:setFillColor(0)
bgroup:insert(emotionalText)

Intellectual = display.newText(math.ceil(intellectualPercentage).."%",100,100,font2,50)
Intellectual.anchorX = 0
Intellectual.anchorY = 0
Intellectual.x = _W/1.4
Intellectual.y = emotional.y + 60
Intellectual:setFillColor(Black)
bgroup:insert(Intellectual)
IntellectualText = display.newText("Intellectual",100,50,font1,35)
IntellectualText.anchorX = 0.5
IntellectualText.anchorY = 0
IntellectualText.x = _W*0.28
IntellectualText.y = emotional.y + 60
IntellectualText:setFillColor(0)
bgroup:insert(IntellectualText)

Spiritual = display.newText(math.ceil(spiritualPercentage).."%",100,100,font2,50)
Spiritual.anchorX = 0
Spiritual.anchorY = 0
Spiritual.x = _W/1.4
Spiritual.y = Intellectual.y + 60
Spiritual:setFillColor(Black)
bgroup:insert(Spiritual)
SpiritualText = display.newText("Spiritual",100,50,font1,35)
SpiritualText.anchorX = 0.5
SpiritualText.anchorY = 0
SpiritualText.x = _W*0.28
SpiritualText.y = Intellectual.y + 60
SpiritualText:setFillColor(0)
bgroup:insert(SpiritualText)

intuitionCompassion = display.newText(math.ceil(intuitionCompassionPercentage).."%",100,100,font2,50)
intuitionCompassion.anchorX = 0
intuitionCompassion.anchorY = 0
intuitionCompassion.x = _W/1.4
intuitionCompassion.y = Spiritual.y + 60
intuitionCompassion:setFillColor(Black)
bgroup:insert(intuitionCompassion)
intuitionCompassionText = display.newText("Intuition",100,50,font1,35)
intuitionCompassionText.anchorX = 0.5
intuitionCompassionText.anchorY = 0
intuitionCompassionText.x = _W*0.3
intuitionCompassionText.y = Spiritual.y + 60
intuitionCompassionText:setFillColor(0)
bgroup:insert(intuitionCompassionText)

aesthetics = display.newText(math.ceil(aestheticsPercentage).."%",100,100,font2,50)
aesthetics.anchorX = 0
aesthetics.anchorY = 0
aesthetics.x = _W/1.4
aesthetics.y = intuitionCompassion.y + 60
aesthetics.anchorX = 0
aesthetics:setFillColor(Black)
bgroup:insert(aesthetics)
aestheticsText = display.newText("Aesthetics",100,50,font1,35)
aestheticsText.anchorX = 0.5
aestheticsText.anchorY = 0
aestheticsText.x = _W*0.28
aestheticsText.y = intuitionCompassion.y + 60
aestheticsText:setFillColor(0)
bgroup:insert(aestheticsText)


selfAwareness = display.newText(math.ceil(selfAwarenessPercentage).."%",100,100,font2,50)
selfAwareness.anchorX = 0
selfAwareness.anchorY = 0
selfAwareness.x = _W/1.4
selfAwareness.y = aesthetics.y + 60
selfAwareness:setFillColor(Black)
bgroup:insert(selfAwareness)
selfAwarenessText = display.newText("Self-Awareness",100,50,font1,35)
selfAwarenessText.anchorX = 0.5
selfAwarenessText.anchorY = 0
selfAwarenessText.x = _W*0.28
selfAwarenessText.y = aesthetics.y + 60
selfAwarenessText:setFillColor(0)
bgroup:insert(selfAwarenessText)





for j in db:nrows([[SELECT Physical AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
 physical:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100) < 35 and math.ceil(j.Count*100) > -35) then
 physical:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100) < -35)  then
 physical:setFillColor(1,0,0)
end
end 
for j in db:nrows([[SELECT Emotional AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
 emotional:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
 emotional:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35)  then
emotional:setFillColor(1,0,0)
end
end
for j in db:nrows([[SELECT Intellectual AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
Intellectual:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
Intellectual:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35)  then
Intellectual:setFillColor(1,0,0)
end
end
for j in db:nrows([[SELECT Spiritual AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
Spiritual:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
Spiritual:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35)  then
Spiritual:setFillColor(1,0,0)
end
end
for j in db:nrows([[SELECT Self_Awareness AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
selfAwareness:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
selfAwareness:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35)  then
selfAwareness:setFillColor(1,0,0)
end
end
for j in db:nrows([[SELECT Compassion AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
intuitionCompassion:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
intuitionCompassion:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35)  then
intuitionCompassion:setFillColor(1,0,0)
end
end
for j in db:nrows([[SELECT Aesthetics AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count*100) > 35) then
aesthetics:setFillColor(0,1,0)
elseif(math.ceil(j.Count*100)<35 and -35 < math.ceil(j.Count*100)) then
aesthetics:setFillColor(106/255,5/255,250/255)
elseif(math.ceil(j.Count*100)<-35) then
aesthetics:setFillColor(1,0,0)
end
end

 option2 = {
    text = "Biorhythm Results",
    align = "center",
    x = _W/2,
    y = _H/20,
    font = font1,
    fontSize = 50
}
 ResultsTitle = display.newText(option2)
ResultsTitle:setFillColor(250/255,100/255,5/255)
bgroup:insert(ResultsTitle)
 option = {
    text = "For best effect of the therapy, hold your phone/tablet about 30cm away and put on your earphones. Focus on the colours, patterns and music. Enjoy!",
    x = _W/12,
    y = metalchart.y+metalchart.height+30,
    width = _W*0.90,
    height = _H/5,
    font = font2,
    fontSize = 26,
    align="center"
}
Instructions = display.newText(option)
Instructions.anchorX = 0
Instructions.anchorY = 0

Instructions:setFillColor(178/255,127/255,250/255)
bgroup:insert(Instructions)
button1.isVisible = true
button1:setEnabled(true)
button1:toFront()
end
}
    
Submit.x = _W/2
Submit.y = _H/1.45
bgroup:insert(Submit)
button1 = widget.newButton
{
    width = 120,
    height = 120,
    defaultFile = "go-button.png",
    overFile = "go-button2.png",
    onEvent = handleButtonEvent
}

-- Center the button
button1.x = _W*0.1
button1.y = _H*0.85
button1.anchorX = 0
button1.anchorY = 0
button1.isVisible = false
button1:setEnabled(false)
bgroup:insert(button1)
 
function Back()
    local b3click = audio.loadSound("click.mp3")
    audio.play(b3click)
    storyboard.gotoScene("menu",{effect = "crossFade"})
end

GoBack = display.newImage("GoBackBio.png")
GoBack.anchorX = 0
GoBack.anchorY = 0
GoBack.x = _W/4
GoBack.y = _H/2.6
GoBack.width = 50
GoBack.height = 50
bgroup:insert(GoBack)
GoBack:toFront()
GoBack:addEventListener("touch",Back)

end
function scene:enterScene( event )
    storyboard.purgeScene("menu")
end
function scene:exitScene( event )
    Runtime:removeEventListener("touch",BgFunction)
end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene

