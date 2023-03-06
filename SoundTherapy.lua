display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()

local widget = require("widget")

local physics = require("physics")




function scene:createScene(event)
_W = display.viewableContentWidth
_H = display.viewableContentHeight
font1 = "Belligerent Madness"

physics.start()

Soundgroup = self.view


local songsInfo = {{'Songs/HarmonyBalance1.mp3', 'Daybreak', '1', 'Daybreak.png',' Harmony Balance','Touch1','Mental Rejuvenation'}, 
                    {'Songs/HarmonyBalance2.mp3', 'Flight', '2', 'Flight.png','Harmony Balance','Touch2','Mental Rejuvenation'},
                    {'Songs/HarmonyBalance3.mp3', 'Calming Skies', '3', 'CalmingSkies.png','Harmony Balance','Touch3','Mental Rejuvenation'},
                    {'Songs/HarmonyBalance4.mp3', 'Flight of the Eagle', '4', 'FlightOfTheEagle.png','Harmony Balance','Touch4','Soul Relaxation'},
                    {'Songs/HarmonyBalance5.mp3', 'Magic Garden', '5', 'MagicGarden.png','Harmony Balance','Touch5','Soul Relaxation'},
                    {'Songs/HarmonyBalance6.mp3', 'Meditation', '6', 'Meditation.png','Harmony Balance','Touch6','Soul Relaxation'},
                    {'Songs/HarmonyBalance7.mp3', 'Pure Relaxation', '7', 'PureRelaxation.png','Harmony Balance','Touch7','Body Destress'},
                    {'Songs/HarmonyBalance8.mp3', 'Quiet Meadow', '8', 'QuietMeadow.png','Harmony Balance','Touch8','Body Destress'},
                    {'Songs/HarmonyBalance9.mp3', 'Whispering Winds', '9', 'WhisperingWinds.png','Harmony Balance','Touch9','Body Destress'},
                    {'Songs/Song1.mp3', 'Give Me Your Hand', '10', 'GiveMeYourHands.png','General Songs','Touch10','For Enjoyment'},
                    {'Songs/Song2.mp3', 'The Power of the Hang', '11', 'ThePowerOfTheHang.png','General Music','Touch11','For Enjoyment'},
                    {'Songs/Song3.mp3', 'The Wings of Jkarus', '12', 'TheWingsOfJkarus.png','General Music','Touch12','For Enjoyment'},
                    {'Songs/Song4.mp3', 'Through The Arbor', '13', 'ThroughTheArbor.png','General Music','Touch13','For Enjoyment'},
                    {'Songs/Song5.mp3', 'Turning', '14', 'Turning.png','General Music','Touch14','For Enjoyment'},
                    {'SoundTherapy.mp3', 'Homoresque', '15', 'Homoresque.png','Humoresque','Touch15','By Dvořák'}}
                    -- Variables
local currentSong = 1
local playing

--local song1 = audio.loadSound(songsInfo[1][1])
--local song2 = audio.loadSound(songsInfo[2][1])
--local songs = {song1, song2}
-- Functions

local Main = {}
local buildGUI = {}
local playCurrentSong = {}
local stopSong = {}
local nextSong = {}
local prevSong = {}
local updateInfo = {}
local updateProgress = {}
TouchCount = 0
PausedTimer = 0
    bg2 = display.newRect(0,0,_W,_H)
    bg2.anchorX = 0
    bg2.anchorY = 0
    bg2:setFillColor(1,1,1)
    Soundgroup:insert(bg2)
    bg = display.newImageRect('BackgroundST.png',_W,_H)
    bg.anchorX = 0
    bg.anchorY = 0
    bg.alpha = 0.7
    Soundgroup:insert(bg)
    greyLine = display.newRect(0,_H/50,_W,50)
    greyLine.anchorX = 0
    greyLine.anchorY = 0
    greyLine:setFillColor(234/255,255/255,168/255)
    Soundgroup:insert(greyLine)
    titleText = display.newText("Choose a song", _W/3, _H/10, native.systemFontBold, 30)
    titleText:setFillColor(0.3, 0.4, 0.5)
    titleText.anchorX = 0
    titleText.anchorY = 0
    Soundgroup:insert(titleText)
    endTextRect = display.newRect(0,_H/1.175,_W,50)
    endTextRect:setFillColor(1,1,1)
    endTextRect.anchorX = 0
    endTextRect.anchorY = 0
    Soundgroup:insert(endTextRect)
    endText = display.newText("Music Length: 00:00",_W/2,_H/1.15,native.systemFontBold,50)
    endText:setFillColor(0,0,0)
    Soundgroup:insert(endText)
    GenreText1 = display.newText("",_W/2.2,_H/15,200,100,font1,25)
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    Soundgroup:insert(GenreText1)
    GenreText2 = display.newText("",_W/2.2,_H/15,400,100,font1,25)
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    Soundgroup:insert(GenreText2)
    CurrentTimeRect = display.newRect(0,_H/1.125,_W,50)
    CurrentTimeRect:setFillColor(0,0,0)
    CurrentTimeRect.anchorX = 0
    CurrentTimeRect.anchorY = 0
    Soundgroup:insert(CurrentTimeRect)
    CurrentTime = display.newText("Play Time: 00:00",_W/2,_H/1.1,native.systemFontBold,50)
    CurrentTime:setFillColor(1,1,1)
    Soundgroup:insert(CurrentTime)
    local ZappyZap = audio.loadSound("SoundTherapy.mp3")
    audio.setVolume (0.5, {channel = 3})
    local Zappy = audio.play(ZappyZap, {channel = 3, fadein = 1000})

    --local song1 = audio.loadSound(songsInfo[1][1])
    --local song2 = audio.loadSound(songsInfo[2][1])
    --local songs = {song1, song2}

function Play()
timer.resume(TimerZ)
audio.resume()
playbtn.isVisible = false
playbtn.isHitTestable = false
end

    playbtn = display.newImage("PlayBtn.png")
    playbtn.anchorX = 0
    playbtn.anchorY = 0
    playbtn.x = _W/1.52
    playbtn.y = _H/6
    playbtn.width = 50
    playbtn.height = 50
    playbtn:addEventListener("touch",Play)
    playbtn.isVisible = false
    playbtn.isHitTestable = false
    Soundgroup:insert(playbtn)
    
min1 = 0
sec1 = 0
TimerCheck = 0

function TimerY(event)
sec1 = sec1 + 1
TimerCheck = TimerCheck + 1
if (sec1 == 60) then
    sec1 = 0
    min1 = min1 + 1
end
if(sec1 < 10 and min1 < 10) then
CurrentTime.text = "Play Time: ".."0"..min1..":".."0"..sec1
elseif(sec1 < 10) then
CurrentTime.text = "Play Time: "..min1..":".."0"..sec1
elseif(min1 < 10) then
CurrentTime.text = "Play Time: ".."0"..min1..":"..sec1
else
CurrentTime.text = "Play Time: "..min1..":"..sec1
end
du = DurationOfSong + 1
if(TimerCheck == du) then
    TouchCount = TouchCount - 1
    sec1 = 0
    min1 = 0
    timer.cancel(event.source)
elseif(TouchCount > 1) then
     TouchCount = TouchCount - 1
    sec1 = 0
    min1 = 0
    timer.cancel(event.source)
end

end
function Pause()
PausedTimer = PausedTimer + 1
timer.pause(TimerZ)
audio.pause()
playbtn.isVisible = true
playbtn.isHitTestable = true
end
function Touch1(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[1][4]
    titleText1 = display.newImage(songsInfo[1][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[1][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[1][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[1][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1) 
end
function Touch2(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[2][4]
    titleText1 = display.newImage(songsInfo[2][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[2][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[2][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[2][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end

function Touch3(event)
  TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[3][4]
    titleText1 = display.newImage(songsInfo[3][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[3][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[3][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[3][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch4(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[4][4]
    titleText1 = display.newImage(songsInfo[4][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[4][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[4][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[4][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
   
   DurationOfSong = math.floor(audio.getDuration(Song)/1000)
   if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch5(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[5][4]
    titleText1 = display.newImage(songsInfo[5][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[5][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[5][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[5][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch6(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[6][4]
    titleText1 = display.newImage(songsInfo[6][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()   
    GenreText1.text = songsInfo[6][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[6][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[6][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch7(event)
TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[7][4]
    titleText1 = display.newImage(songsInfo[7][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[7][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[7][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[7][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
   
   DurationOfSong = math.floor(audio.getDuration(Song)/1000)
   if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
   
end
function Touch8(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[8][4]
    titleText1 = display.newImage(songsInfo[8][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[8][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[8][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[8][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end

DurationOfSong = math.floor(audio.getDuration(Song)/1000)
if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch9(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[9][4]
    titleText1 = display.newImage(songsInfo[9][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[9][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[9][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
       Song = audio.loadSound(songsInfo[9][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch10(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[10][4]
    titleText1 = display.newImage(songsInfo[10][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[10][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[10][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[10][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch11(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[11][4]
    titleText1 = display.newImage(songsInfo[11][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[11][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[11][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[11][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch12(event)
  TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[12][4]
    titleText1 = display.newImage(songsInfo[12][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[12][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[12][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[12][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch13(event)
 TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[13][4]
    titleText1 = display.newImage(songsInfo[13][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[13][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[13][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[13][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
    
    DurationOfSong = math.floor(audio.getDuration(Song)/1000)
    if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1)
end
function Touch14(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[14][4]
    titleText1 = display.newImage(songsInfo[14][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[14][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[14][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[14][1])
   SongPlay = audio.play(Song)
   min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
   
   DurationOfSong = math.floor(audio.getDuration(Song)/1000)
   if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1) 
end
    function Touch15(event)
    TouchCount = TouchCount + 1
    audio.stop()
    titleText.isVisible = false
    filename = songsInfo[15][4]
    titleText1 = display.newImage(songsInfo[15][4])
    titleText1.x =  _W/2
    titleText1.y =  _H/6.8
    titleText1.width = 150
    titleText1.height = 150
    titleText1:setFillColor(0,1,0.2)
    Soundgroup:insert(titleText1)
    titleText1:addEventListener("touch",Pause)
    physics.addBody(titleText1,"static",{density = 1,friction = 1, bounce = 1})
    pause = display.newImage("Pause.png")
    pause.x =  _W/2
    pause.y =  _H/7
    pause.width = 300
    pause.height = 300
    pause.alpha = 0.4
    Soundgroup:insert(pause)
    pause:toFront()
    GenreText1.text = songsInfo[15][5]
    GenreText1.x = _W/7
    GenreText1.y = _H/40
    GenreText1.anchorX = 0
    GenreText1.anchorY = 0
    GenreText1:setFillColor(0,0.4,1)
    GenreText2.text = songsInfo[15][7]
    GenreText2.fontSize = 30
    GenreText2.x = _W/1.5
    GenreText2.y = _H/40
    GenreText2.anchorX = 0
    GenreText2.anchorY = 0
    GenreText2:setFillColor(0,0.4,1)
    
    Song = audio.loadSound(songsInfo[15][1])
    SongPlay = audio.play(Song)
    min = math.floor(audio.getDuration(Song)/60000)
    sec = math.floor((audio.getDuration(Song)-(min*60000))/1000)
    if(sec<10) then
    endText.text = "Total Time: "..min..":".."0"..sec
    elseif(min<10) then
        endText.text = "Total Time: ".."0"..min..":"..sec
    elseif(min<10 and sec<10) then
     endText.text = "Total Time: ".."0"..min..":".."0"..sec
    else
        endText.text = "Total Time: "..min..":"..sec
    end
   
   DurationOfSong = math.floor(audio.getDuration(Song)/1000)
   if (PausedTimer > 0) then
        PausedTimer = PausedTimer - 1
        timer.resume(TimerZ)
    else
    end
    TimerZ = timer.performWithDelay(1000,TimerY,-1) 
end
YingYang = display.newImage("YingYangSymbol.png")
    YingYang.anchorX = 0
    YingYang.anchorY = 0
    YingYang.x = _W/2.2
    YingYang.y = _H/110
    YingYang:scale(0.2,0.2)
    YingYang:addEventListener("touch",Touch15)
    Soundgroup:insert(YingYang)
physics.setGravity(0,0)

local wall1 = display.newImage("Wall.jpg",_W/30,_H/5.9)
wall1.anchorX = 0
wall1.anchorY = 0
wall1.width = 10
wall1.height = 800
wall1.alpha = 0
physics.addBody( wall1,  "static",{ density=1, friction=1, bounce=1})
Soundgroup:insert(wall1)
local wall2 = display.newImage("Wall.jpg",_W/1.01,_H/5.9)
wall2.anchorX = 0
wall2.anchorY = 0
wall2.width = 10
wall2.height = 800
wall2.alpha = 0
Soundgroup:insert(wall2)
physics.addBody( wall2, "static", { density=1, friction=1,bounce=1})
local wall3 = display.newImage("Wall.jpg",_W/30,_H/5.5)
wall3.anchorX = 0
wall3.anchorY = 0
wall3.width = 800
wall3.height = 10
wall3.alpha = 0
Soundgroup:insert(wall3)
physics.addBody( wall3,  "static",{ density=1, friction=1,bounce=1})
local wall4 = display.newImage("Wall.jpg",_W/72,_H/1.25490196)
wall4.anchorX = 0
wall4.anchorY = 0
wall4.width = 800
wall4.height = 10
wall4.alpha = 0
Soundgroup:insert(wall4)
physics.addBody( wall4, "static",{ density=1, friction=1,bounce=1})
Turning = display.newImage("Turning.png",_W/1.5,_H/5)
Turning.width = 150
Turning.height = 150
Turning.anchorX = 0
Turning.anchorY = 0
Turning:addEventListener("touch",Touch14)
physics.addBody( Turning, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly1()
Turning.isFixedRotation = true
Turning:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm1 = timer.performWithDelay(500, moveRandomly1, -1);
Soundgroup:insert(Turning)
ThroughTheArbor = display.newImage("ThroughTheArbor.png",_W/3,_H/5)
ThroughTheArbor.width = 150
ThroughTheArbor.height = 150
ThroughTheArbor.anchorX = 0
ThroughTheArbor.anchorY = 0
ThroughTheArbor:addEventListener("touch",Touch13)

physics.addBody( ThroughTheArbor, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly2()
ThroughTheArbor.isFixedRotation = true
ThroughTheArbor:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm2 = timer.performWithDelay(500, moveRandomly2, -1);
Soundgroup:insert(ThroughTheArbor)
TheWingsOfJkarus = display.newImage("TheWingsOfJkarus.png",_W/20,_H/1.5)
TheWingsOfJkarus.width = 150
TheWingsOfJkarus.height = 150
TheWingsOfJkarus.anchorX = 0
TheWingsOfJkarus.anchorY = 0

TheWingsOfJkarus:addEventListener("touch",Touch12)
physics.addBody( TheWingsOfJkarus, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly3()
TheWingsOfJkarus:setLinearVelocity(math.random(-300,300), math.random(-300,300));
TheWingsOfJkarus.isFixedRotation = true
end
tm3 = timer.performWithDelay(500, moveRandomly3, -1);
Soundgroup:insert(TheWingsOfJkarus)
ThePowerOfTheHang = display.newImage("ThePowerOfTheHang.png",_W/20,_H/3)
ThePowerOfTheHang.width = 150
ThePowerOfTheHang.height = 150
ThePowerOfTheHang.anchorX = 0
ThePowerOfTheHang.anchorY = 0
ThePowerOfTheHang:addEventListener("touch",Touch11)
physics.addBody( ThePowerOfTheHang, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly4()
ThePowerOfTheHang.isFixedRotation = true
ThePowerOfTheHang:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm4 = timer.performWithDelay(500, moveRandomly4, -1);
Soundgroup:insert(ThePowerOfTheHang)
GiveMeYourHands = display.newImage("GiveMeYourHands.png",_W/20,_H/2)
GiveMeYourHands.width = 150
GiveMeYourHands.height = 150
GiveMeYourHands.anchorX = 0
GiveMeYourHands.anchorY = 0
GiveMeYourHands:addEventListener("touch",Touch10)
physics.addBody( GiveMeYourHands, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly5()
GiveMeYourHands.isFixedRotation = true
GiveMeYourHands:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm5 = timer.performWithDelay(500, moveRandomly5, -1);
Soundgroup:insert(GiveMeYourHands)

WhisperingWinds = display.newImage("WhisperingWinds.png",_W/3.5,_H/2)
WhisperingWinds.width = 150
WhisperingWinds.height = 150
WhisperingWinds.anchorX = 0
WhisperingWinds.anchorY = 0
WhisperingWinds:addEventListener("touch",Touch9)
physics.addBody( WhisperingWinds, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly6()
WhisperingWinds.isFixedRotation = true
WhisperingWinds:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm6 = timer.performWithDelay(500, moveRandomly6, -1);
Soundgroup:insert(WhisperingWinds)

QuietMeadow = display.newImage("QuietMeadow.png",_W/3.5,_H/1.5)
QuietMeadow.width = 150
QuietMeadow.height = 150
QuietMeadow.anchorX = 0
QuietMeadow.anchorY = 0
QuietMeadow:addEventListener("touch",Touch8)
physics.addBody( QuietMeadow, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly7()
QuietMeadow.isFixedRotation = true
QuietMeadow:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm7 = timer.performWithDelay(500, moveRandomly7, -1);

Soundgroup:insert(QuietMeadow)

PureRelaxation = display.newImage("PureRelaxation.png",_W/3.5,_H/3)
PureRelaxation.width = 150
PureRelaxation.height = 150
PureRelaxation.anchorX = 0
PureRelaxation.anchorY = 0
PureRelaxation:addEventListener("touch",Touch7)
physics.addBody( PureRelaxation, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly8()
PureRelaxation.isFixedRotation = true
PureRelaxation:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm8 = timer.performWithDelay(500, moveRandomly8, -1);

Soundgroup:insert(PureRelaxation)
Meditation = display.newImage("Meditation.png",_W/2,_H/1.5)
Meditation.width = 150
Meditation.height = 150
Meditation.anchorX = 0
Meditation.anchorY = 0
Meditation:addEventListener("touch",Touch6)
physics.addBody( Meditation, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly9()
Meditation.isFixedRotation = true
Meditation:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm9 = timer.performWithDelay(500, moveRandomly9, -1);
Soundgroup:insert(Meditation)

MagicGarden = display.newImage("MagicGarden.png",_W/1.3,_H/3)
MagicGarden.width = 150
MagicGarden.height = 150
MagicGarden.anchorX = 0
MagicGarden.anchorY = 0
MagicGarden:addEventListener("touch",Touch5)
physics.addBody( MagicGarden, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly10()
MagicGarden.isFixedRotation = true
MagicGarden:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm10 = timer.performWithDelay(500, moveRandomly10, -1);
Soundgroup:insert(MagicGarden)

FlightOfTheEagle = display.newImage("FlightOfTheEagle.png",_W/1.3,_H/2)
FlightOfTheEagle.width = 150
FlightOfTheEagle.height = 150
FlightOfTheEagle.anchorX = 0
FlightOfTheEagle.anchorY = 0
FlightOfTheEagle:addEventListener("touch",Touch4)
physics.addBody( FlightOfTheEagle, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly11()
FlightOfTheEagle.isFixedRotation = true
FlightOfTheEagle:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm11 = timer.performWithDelay(500, moveRandomly11, -1);
Soundgroup:insert(FlightOfTheEagle)

CalmingSkies = display.newImage("CalmingSkies.png",_W/1.3,_H/1.5)
CalmingSkies.width = 150
CalmingSkies.height = 150
CalmingSkies.anchorX = 0
CalmingSkies.anchorY = 0
CalmingSkies:addEventListener("touch",Touch3)
physics.addBody( CalmingSkies, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly12()
CalmingSkies.isFixedRotation = true
CalmingSkies:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm12 = timer.performWithDelay(500, moveRandomly12, -1);
Soundgroup:insert(CalmingSkies)

Flight = display.newImage("Flight.png",_W/2,_H/3)
Flight.width = 150
Flight.height = 150
Flight.anchorX = 0
Flight.anchorY = 0
Flight:addEventListener("touch",Touch2)
physics.addBody( Flight, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly13()
Flight.isFixedRotation = true
Flight:setLinearVelocity(math.random(-300,300), math.random(-300,300));
end
tm13 = timer.performWithDelay(500, moveRandomly13, -1);
Soundgroup:insert(Flight)

Daybreak = display.newImage("Daybreak.png",_W/2,_H/2)
Daybreak.width = 150
Daybreak.height = 150
Daybreak.anchorX = 0
Daybreak.anchorY = 0
Daybreak:addEventListener("touch",Touch1)
physics.addBody( Daybreak, "dynamic",{ density=1, friction=1,bounce=0.2})
function moveRandomly14()
Daybreak.isFixedRotation = true
Daybreak:setLinearVelocity(math.random(-300,300), math.random(-300,300))
end
tm14 = timer.performWithDelay(500, moveRandomly14, -1)
Soundgroup:insert(Daybreak)
function Returno()
    timer.cancel(tm1)
    tm1 = nil
    timer.cancel(tm2)
    tm2 = nil
    timer.cancel(tm3)
    tm3 = nil
    timer.cancel(tm4)
    tm4 = nil
    timer.cancel(tm5)
    tm5 = nil
    timer.cancel(tm6)
    tm6 = nil
    timer.cancel(tm7)
    tm7 = nil
    timer.cancel(tm8)
    tm8 = nil
    timer.cancel(tm9)
    tm9 = nil
    timer.cancel(tm10)
    tm10 = nil
    timer.cancel(tm11)
    tm11 = nil
    timer.cancel(tm12)
    tm12 = nil
    timer.cancel(tm13)
    tm13 = nil
    timer.cancel(tm14)
    tm14 = nil

    audio.stop()
    physics.stop()
    storyboard.gotoScene("menu",{effect = "crossFade", time = 300})
    return false
   
end
Return = display.newImage("Return.png")
    Return.anchorX = 0
    Return.anchorY = 0
    Return.x = _W/4
    Return.y = _H/6.2
    Return.width = 70
    Return.height = 70
    physics.addBody(Return,"static",{bounce = 1})
    Soundgroup:insert(Return)
    Return:addEventListener("touch",Returno)
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