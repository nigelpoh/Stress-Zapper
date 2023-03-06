display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

api = require('api')
sqlite = require('sqlite3')

function scene:createScene (event)

totalTime = 0
wave = 0
currentWave = 0
tc = {}
filename = nil
pattern = 1
Swidth = 1
font1 = "Belligerent Madness"
_W = display.viewableContentWidth
_H = display.viewableContentHeight
_T = display.screenOriginY -- Top
_L = display.screenOriginX -- Left
_R = display.viewableContentWidth - _L -- Right
_B = display.viewableContentHeight - _T-- Bottom4
_CX = math.floor(_W / 2)
_CY = math.floor(_H / 2)

    group = self.view   
    PhysicalArray = {"Physical-Canon in D Major","Physical-Commando","Physical-Little Moritz"}
    EmotionalArray = {"Emotional-Alone on the shore","Emotional-Dance of happiness","Emotional-The Heart Asks Pleasure First"}
    IntellectualArray = {"Intellectual-Comptine D'un Autre Ete","Intellectual-Margaret's Waltz","Intellectual-Minuette"}
    background1 = display.newRect(0,0,_W,_H)
    background1.anchorX = 0
    background1.anchorY = 0
    background1:setFillColor(0,0,0)
    group:insert(background1)
    background2 = display.newRect(0,0,_W,_H)
    background2.anchorX = 0
    background2.anchorY = 0
    background2:setFillColor(0,0,0)
    background2.isVisible = false
    background2.isHitTestable = false
    group:insert(background2)
    path = system.pathForFile("StressZapper.sqlite",system.DocumentsDirectory)
    db = sqlite.open(path)
    
    rR = {}
    gG = {}
    bB = {}
    Percentages = {}
    Check = {}

    endingmsgopt = {
        text = "Thank you for watching & listening...",
        x = _W * 0.5,
        y = _H * 0.5,
        font = font1,
        fontSize = 30,

    } 
        endingmsg = display.newText (endingmsgopt)
        endingmsg.anchorX = 0.5
        endingmsg.anchorY = 0.5
        endingmsg.x = _W * 0.5
        endingmsg.y = _H * 0.4
        endingmsg.alpha = 0
        group:insert(endingmsg)
         
        

for j in db:nrows([[SELECT Physical AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
 rR[1] = 1
 gG[1] = 0.11372549
 bB[1] = 0
 Percentages[1] = j.Count
 Check[1] = j.Count
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
 rR[1] = 1
 gG[1] = 0.99607843
 bB[1] = 0.00784314
 Percentages[1] = j.Count 
 Check[1] = j.Count 
elseif(math.ceil(j.Count) <= -35)  then
 rR[1] = 0.01960784
 gG[1] = 176/255
 bB[1] = 80/255
 Percentages[1] = j.Count 
 Check[1] = j.Count
end
end 
for j in db:nrows([[SELECT Emotional AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
 rR[2] =192/255
 gG[2] =192/255
 bB[2] =192/255
 Percentages[2] = j.Count
 Check[2] = j.Count
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
 rR[2] =0
 gG[2] =102/255
 bB[2] =1
 Percentages[2] = j.Count 
 Check[2] = j.Count 
elseif(math.ceil(j.Count) <= -35)  then
 rR[2] =184/255
 gG[2] =115/255
 bB[2] =51/255
 Percentages[2] = j.Count 
 Check[2] = j.Count
end
end
for j in db:nrows([[SELECT Intellectual AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
rR[3] =64/255
gG[3] = 224/255
bB[3] = 208/255
Percentages[3] = j.Count
Check[3] = j.Count
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
rR[3] = 1
gG[3] = 165/255
bB[3] = 1/255
Percentages[3] = j.Count
Check[3] = j.Count
elseif(math.ceil(j.Count) <= -35)  then
rR[3] = 165/255
gG[3] = 42/255
bB[3] = 42/255
Percentages[3] = j.Count
Check[3] = j.Count
end
end
local function compare( a, b )
    return a < b
end
table.sort(Percentages,compare)


math.randomseed(os.time())
RanNo = math.random(1,3)
if(Percentages[1] == Check[1]) then
   
    filename = PhysicalArray[RanNo]
    api:loadAudio(filename)
elseif(Percentages[1] == Check[2]) then
   
    filename = EmotionalArray[RanNo]
    api:loadAudio(filename)
elseif(Percentages[1] == Check[3]) then
   
    filename = IntellectualArray[RanNo]
    api:loadAudio(filename)
end
for j in db:nrows([[SELECT Spiritual AS Count FROM BioRhythm WHERE id ="1"]] ) do

if(math.ceil(j.Count) >= 35) then
rR[4] = 1
gG[4] = 1
bB[4] = 1 
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
rR[4] = 128/255
gG[4] = 14/255
bB[4] = 128/255
elseif(math.ceil(j.Count) <= -35)  then
rR[4] = 254/255
gG[4] = 52/255
bB[4] = 1
end
end
for j in db:nrows([[SELECT Self_Awareness AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
rR[5] = 1
gG[5] = 192/255
bB[5] = 203/255
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
rR[5] = 1
gG[5] = 215/255
bB[5] = 2/255
elseif(math.ceil(j.Count) <= -35)  then
rR[5] = 128/255
gG[5] = 129/255
bB[5] = 130/255
end
end
for j in db:nrows([[SELECT Compassion AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
rR[6] = 0
gG[6] = 0
bB[6] = 0
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
rR[6] = 1
gG[6] = 254/255
bB[6] = 2/255
elseif(math.ceil(j.Count) <= -35)  then
rR[6] = 64/255
gG[6] = 224/255
bB[6] = 208/255
end
end
for j in db:nrows([[SELECT Aesthetics AS Count FROM BioRhythm WHERE id ="1"]] ) do
if(math.ceil(j.Count) >= 35) then
rR[7] = 5/255
gG[7] = 176/255
bB[7] = 80/255
elseif(math.ceil(j.Count) > -35 and math.ceil(j.Count) < 35) then
rR[7] = 192/255
gG[7] = 192/255
bB[7] = 192/255
elseif(math.ceil(j.Count) <= -35) then
rR[7] = 128/255
gG[7] = 14/255
bB[7] = 128/255
end
end
    math.randomseed(os.time())
    wave = system.getTimer()
    
    self.viewGroup = display.newGroup()
    self.drawGroup = display.newGroup()
    self.activeSnapshot = display.newSnapshot(_W, _H)
    self.viewGroup:translate(_CX, _CY)
    self.backgroundSnapshot = display.newSnapshot(_W, _H)
    
    self.blackRect = display.newRect(0, 0, _W, _H)
    self.blackRect:setFillColor(0)
    math.randomseed(os.time())
    alphaValue = math.random(0,5)/100
    self.blackRect.alpha = alphaValue
    
    group:insert(self.viewGroup)
    self.t = timer.performWithDelay(1, function() self:drawAudioWave() end, math.floor(totalTime/50))
    self.start_t = system.getTimer()
    self.audioWaveMode = false
    
    -- Part 2 of act
    tc[1] = timer.performWithDelay(totalTime * 0.3, function() self:addStuff(-1) end)
    tc[2] = timer.performWithDelay(totalTime * 0.4, function() self:removeStuff() end)
    tc[3] = timer.performWithDelay(totalTime * 0.41, function() self:addStuff() end)
    tc[4] = timer.performWithDelay(totalTime * 0.51, function() self:removeStuff() end)
    tc[5] = timer.performWithDelay(totalTime * 0.52, function() self:addStuff(-1) end)
    tc[6] = timer.performWithDelay(totalTime * 0.62, function() self:removeStuff() end)
    --Part 3 of Act
    tc[7] = timer.performWithDelay(totalTime * 0.62, function() self:addStuff(-1) end)
    tc[8] = timer.performWithDelay(totalTime * 0.7, function() self:removeStuff() end)
    tc[9] = timer.performWithDelay(totalTime * 0.71, function() self:addStuff() end)
    tc[10] = timer.performWithDelay(totalTime * 0.83, function() self:removeStuff() end)
    tc[11] = timer.performWithDelay(totalTime * 0.84, function() self:addStuff(-1) end)
    tc[12] = timer.performWithDelay(totalTime * 0.99, function() self:removeStuff() end)
    tc[13] = timer.performWithDelay(totalTime*0.98, function()
        endingmsg.alpha = 1
        endingmsg:toFront()
    end)    
    tc[14] = timer.performWithDelay(totalTime, function()
        endingmsg.text = ""
        display.remove(edingmsg)
        --[[timer.cancel(self.t)
        self.t = nil
        for l = 1, 16 do
            timer.cancel (tc[l])
            tc[l] = nil
        end]]--
        audio.stop(c)
        storyboard.gotoScene("menu",{effect="crossFade", time = 300}) 
        end)
--end

function HSVtoRGB(h, s, v)
    local r,g,b
    local i
    local f,p,q,t
    if s == 0 then
        r = v
        g = v
        b = v
        return r, g, b
    end
    h =   h / 60;
    i  = math.floor(h);
    f = h - i;
    p = v *  (1 - s);
    q = v * (1 - s * f);
    t = v * (1 - s * (1 - f));
    if i == 0 then        
        r = v
        g = t
        b = p
    elseif i == 1 then 
        r = q
        g = v
        b = p
    elseif i == 2 then 
        r = p
        g = v
        b = t
    elseif i == 3 then 
        r = p
        g = q
        b = v
    elseif i == 4 then 
        r = t
        g = p
        b = v
    elseif i == 5 then 
        r = v
        g = p
        b = q
    end
    return r, g, b
end
function handleBgTouch2(event) 

    if event.phase == "began" then
        beginX = event.x
        beginY = event.y
        
    elseif event.phase == "ended"  then
        endX = event.x
        endY = event.y   
     xDistance =  math.abs(endX - beginX) -- math.abs will return the absolute, or non-negative value, of a given value. 
     yDistance =  math.abs(endY - beginY)
        
    if xDistance > yDistance then
        if endX > beginX then
        audio.stop(c)
        endingmsg.text = ""
        display.remove(edingmsg)
        --[[timer.cancel(self.t)
        self.t = nil
        for l = 1, 16 do
            timer.cancel (tc[l])
            tc[l] = nil
        end]]--
        storyboard.gotoScene("menu",{effect="crossFade", time = 300})
        else 

           audio.resume()
           timer.resume(self.t)
           background2.isVisible = false
           background2.isHitTestable = false
           background1.isVisible = true
           background1.isHitTestable = true
           background1:addEventListener("touch",handleBgTouch)
        end
    else 
    
    audio.resume()
    timer.resume(self.t)
    background2.isVisible = false
    background2.isHitTestable = false
    background1.isVisible = true
    background1.isHitTestable = true
    background1:addEventListener("touch",handleBgTouch)
   end
end
end
function handleBgTouch(event)
    if event.phase == "began" then
        beginX = event.x
        beginY = event.y
        
    elseif event.phase == "ended"  then
        endX = event.x
        endY = event.y   
     xDistance =  math.abs(endX - beginX)  
     yDistance =  math.abs(endY - beginY)
        
    if xDistance > yDistance then
        if endX > beginX then
        
        audio.stop(c)
        endingmsg.text = ""
        display.remove(edingmsg)
        --[[timer.cancel(self.t)
        self.t = nil
        for l = 1, 16 do
            timer.cancel (tc[l])
            tc[l] = nil
        end]]--
        storyboard.gotoScene("menu",{effect="crossFade", time = 300})
        else 
           audio.pause()
           timer.pause(self.t)
           for k = 1, 16 do
            timer.pause (tc[l])
        
            end
           background1.isVisible = false
           background1.isHitTestable = false
           background2.isVisible = true
           background2.isHitTestable = true
           background2:addEventListener("touch",handleBgTouch2)
        end
    else 
    audio.pause()
    timer.pause(self.t)
    for k = 1, 16 do
        timer.pause (tc[l])
        
    end
    background1.isVisible = false
    background1.isHitTestable = false
    background2.isVisible = true
    background2.isHitTestable = true
    background2:addEventListener("touch",handleBgTouch2)
   end
end
end    
 background1:addEventListener("touch",handleBgTouch)
 foreground = display.newImageRect("InstructionsManual.png",_W,_H)
    foreground.anchorX = 0
    foreground.anchorY = 0
    foreground.x = 0
    foreground.y = 0
    group:insert(foreground)
    foreground:toFront()
    function foregroundDisappear()
        foreground.isVisible = false
    end
    tc[15] = timer.performWithDelay(4000,foregroundDisappear,1) 


end

function scene:addStuff(d)
    d = d or 1
    local function sine(t, tMax, start, delta)
        
        if (pattern == 1) then
            return 0.2*(2+1*math.cos((8)*d*math.pi*2*t/tMax))*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 2) then
            return math.sin((2)*d*math.pi*2*t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 3) then 
            return 0.7*math.random(-1,1)*math.sin((4)*d*math.pi*2*t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 4) then 
            return 0.8* math.sin((5)*d*math.pi*2*t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 5) then 
            return 0.8*math.sin((6)*d*math.pi*2*t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 6) then  
            return 0.8*math.sin((7)*d*math.pi*2*t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 7) then 
            return -0.07*(8-math.sin(d*math.pi*2*t/tMax)+2*math.sin(d*math.pi*2*3*t/tMax)+2*math.sin(d*math.pi*2*5*t/tMax)- math.sin(d*math.pi*2*7*t/tMax)+3*math.cos(d*math.pi*2*2*t/tMax)-2*math.cos(d*math.pi*2*4*t/tMax))*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 8) then
            return 0.3*(2+(((math.abs(math.cos(3*d*math.pi*2*t/tMax)))+(0.25-(math.abs(math.cos(3*d*math.pi*2*t/tMax+math.pi/2))))*2)/(2+math.abs(math.cos(6*d*math.pi*2*t/tMax+math.pi/2))*8)))*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 9) then
            return 0.3*(3-math.abs(math.cos(5*d*math.pi*2*t/tMax+math.pi))*2)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 10) then
            return -0.4*(-0.3+math.pow(math.cos(5*d*math.pi*2*t/tMax),2)+math.sin(3*d*math.pi*2*t/tMax))*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 11) then
            return 0.2*(math.pow(math.abs(math.cos(4*d * math.pi * 2 * t/tMax)),5) + 2)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 12) then
            return 0.2*(math.sqrt(math.abs(math.cos(4*d * math.pi * 2 * t/tMax))) + 2)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 13) then 
            return math.random(-1,1)*0.7*math.pow(math.sin(0.25*d * math.pi * 2 * t/tMax),3)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 14) then 
            return math.random(-1,1)*0.7*math.sin(d * math.pi *2 * t/tMax)*math.sin(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 15) then
            return 0.003*(math.pow(4 * math.sin(d * math.pi *2 * t/tMax),4) + 2 * math.cos(-4/3 * d * math.pi *2 * t/tMax))*math.sin(d * math.pi *2 * t/tMax) * delta
          

        end    
    end
    local function cosine(t, tMax, start, delta)
        
        if (pattern == 1) then
            return 0.2*(2+1*math.cos((8)*d*math.pi*2*t/tMax))*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 2) then
            return math.sin((2)*d*math.pi*2*t/tMax)*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 3) then 
            return 0.7*math.random(-1,1)*math.cos((4)*d*math.pi*2*t/tMax)*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 4) then 
            return 0.8*math.sin((5)*d*math.pi*2*t/tMax)*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 5) then 
            return 0.8*math.sin((6)*d*math.pi*2*t/tMax)*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 6) then 
            return 0.8*math.sin((7)*d*math.pi*2*t/tMax)*math.cos(d * math.pi  *2* t/tMax) * delta
        elseif (pattern == 7) then 
            return -0.07*(8-math.sin(d*math.pi*2*t/tMax)+2*math.sin(d*math.pi*2*3*t/tMax)+2*math.sin(d*math.pi*2*5*t/tMax)- math.sin(d*math.pi*2*7*t/tMax)+3*math.cos(d*math.pi*2*2*t/tMax)-2*math.cos(d*math.pi*2*4*t/tMax))*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 8) then
            return 0.3*(2+(((math.abs(math.cos(3*d*math.pi*2*t/tMax)))+(0.25-(math.abs(math.cos(3*d*math.pi*2*t/tMax+math.pi/2))))*2)/(2+math.abs(math.cos(6*d*math.pi*2*t/tMax+math.pi/2))*8)))*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 9) then
            return 0.3*(3-math.abs(math.cos(5*d*math.pi*2*t/tMax+math.pi))*2)*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 10) then
            return -0.4*(0.3+math.pow(math.cos(5*d*math.pi*2*t/tMax),2)+math.sin(3*d*math.pi*2*t/tMax))*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 11) then
            return 0.2*(math.pow(math.abs(math.cos(4*d * math.pi * 2 * t/tMax)),5) + 2)*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 12) then
            return 0.2*(math.sqrt(math.abs(math.cos(4*d * math.pi * 2 * t/tMax))) + 2)*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 13) then 
            return math.random(-1,1)*0.7*math.pow(math.sin(0.25*d * math.pi * 2 * t/tMax),3)*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 14) then  
            return math.random(-1,1)*0.8*math.sin(d * math.pi *2 * t/tMax*5+math.pi * 0.125)*math.cos(d * math.pi *2 * t/tMax) * delta
        elseif (pattern == 15) then
            return 0.003*(math.pow(4 * math.cos(d * math.pi *2 * t/tMax),4) + 2* math.cos (-4/3 * d * math.pi *2 * t/tMax))*math.cos(d * math.pi *2 * t/tMax) * delta

    
        end    
    end
    Swidth = math.random(4,8) 
    for i = 1,14 do
        self['circle' .. i] = display.newCircle(self.view, _CX, _CY, 1)
        self['circle' .. i].strokeWidth = Swidth
        if(i < 8) then
        self['circle' .. i]:setStrokeColor(rR[i],gG[i],bB[i])
        else
        self['circle' .. i]:setStrokeColor(rR[i-7],gG[i-7],bB[i-7])
    end
         self['circle' .. i].alpha = 0
        pattern = math.random(1,15)
        tc[16] = timer.performWithDelay((i - 1) * 1000 + 1, function()
            transition.to(self['circle' .. i], {time = 4000, y = _CY, delta = true, transition = sine, iterations = -1})
            transition.to(self['circle' .. i], {time = 4000, x = _CX, delta = true, transition = cosine, iterations = -1})
            transition.to(self['circle' .. i], {time = 3000, alpha = 1})
        end)
    end
end

function scene:removeStuff()
    for i = 1, 14 do
        self['circle' .. i].alpha = 0
        display.remove(self['circle' .. i])
        self['circle' .. i] = nil
    end
end

function scene:mode(txt)
    display.remove(self.label)
    self.label = app.newText{g = self.view, text = txt:upper(), size = 20, x = _CX, y = 40}
    self.label:setFillColor(1)
    transition.to(self.label, {time = 5000, alpha = 0})
end

function scene:drawAudioWave()
    
    local data 
    local num, sign
    num = math.random (1,2)
    if (num == 1) then
        sign = 1
    elseif (num == 2) then
        sign = -1
    end
    currentWave = system.getTimer()
    if self.audioWaveMode then
        data = api:getAudioFrame()
    else
        data = api:getSpectrumFrame()
    end
    self.drawGroup:insert(self.blackRect)
    display.remove(self.waveLine)
    local d = _W / (#data - 1)
    self.waveLine = display.newLine(self.drawGroup, -_CX, (5*sign*data[1]-sign*0.5*_H), (d - _CX), (5*sign*data[2]-sign*0.5*_H))
    
    for i = 3, #data do
        self.waveLine:append((d * (i - 1) - _CX), (5*sign*data[i]-sign*0.5*_H))
        
    end
    local r, g, b = HSVtoRGB(system.getTimer()/100 % 360, 1, 1)
    l = math.random(1,7)
    self.waveLine:setStrokeColor(rR[l],gG[l],bB[l])
    self.waveLine.strokeWidth = 6
    if ((currentWave - wave) > totalTime*0.3) and ((currentWave - wave) < (totalTime)*0.7) then 
        self.waveLine.alpha = 0
    end
    if ((currentWave - wave) > totalTime*0.62) then
        self.waveLine.alpha = 1
    end

    if ((currentWave - wave) > totalTime* 0.99) then
        self.waveLine.alpha = 0
    end
    if self.circle1 then
        self.drawGroup:insert(self.circle1)
        self.circle1:setFillColor(HSVtoRGB((system.getTimer() + 1000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle2)
        self.circle2:setFillColor(HSVtoRGB((system.getTimer() + 2000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle3)
        self.circle3:setFillColor(HSVtoRGB((system.getTimer() + 3000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle4)
        self.circle4:setFillColor(HSVtoRGB((system.getTimer() + 4000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle5)
        self.circle5:setFillColor(HSVtoRGB((system.getTimer() + 5000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle6)
        self.circle6:setFillColor(HSVtoRGB((system.getTimer() + 6000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle7)
        self.circle7:setFillColor(HSVtoRGB((system.getTimer() + 7000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle8)
        self.circle8:setFillColor(HSVtoRGB((system.getTimer() + 8000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle9)
        self.circle9:setFillColor(HSVtoRGB((system.getTimer() + 9000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle10)
        self.circle10:setFillColor(HSVtoRGB((system.getTimer() + 10000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle11)
        self.circle11:setFillColor(HSVtoRGB((system.getTimer() + 11000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle12)
        self.circle12:setFillColor(HSVtoRGB((system.getTimer() + 12000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle13)
        self.circle13:setFillColor(HSVtoRGB((system.getTimer() + 13000)/100 % 360, 1, 1))
        self.drawGroup:insert(self.circle14)
        self.circle14:setFillColor(HSVtoRGB((system.getTimer() + 14000)/100 % 360, 1, 1))
        

    end
    
    self.activeSnapshot, self.backgroundSnapshot = self.backgroundSnapshot, self.activeSnapshot
	self.viewGroup:insert(self.activeSnapshot)
    self.activeSnapshot.canvas:insert(self.backgroundSnapshot)
	self.activeSnapshot.canvas:insert(self.drawGroup)
	self.activeSnapshot.alpha = 1
    self.activeSnapshot.fill.effect = nil
	self.backgroundSnapshot.alpha = 0.7
    self:applyEffect(self.backgroundSnapshot)
	self.activeSnapshot:invalidate('canvas')
end

local effects = {
    {nil},
    {nil},
    {'filter.blurHorizontal', {blurSize = 20, sigma = 140}},
    {'filter.swirl', {intensity = function(t) return math.sin(t / 1000) * 0.3 end}},
    {'filter.wobble', {amplitude = 50}},
    {'filter.vignette', {radius = function(t) return (0.5 + math.sin(t / 500) * 0.5) end}},
    {'filter.bulge', {intensity = function(t) return (0.8 + math.cos(t / 1200) * 0.20) end}},
    {'filter.scatter', {intensity = 0.7}},
    {'filter.polkaDots', {numPixels = 20, dotRadius = 1, aspectRatio = 1.5}},
    {'filter.opTile', {numPixels = 8, angle = function(t) return math.sin(t / 15000) * 5 end, scale = 1.2}},
    {'filter.opTile', {numPixels = 8, angle = function(t) return math.sin(t / 15000) * -5 end, scale = 1.2}},
    {'filter.opTile', {numPixels = 8, scale = function(t) return 1 + math.sin(t / 2500) * 1 end}},
    {'filter.frostedGlass', {scale = 180}},
    {'filter.colorChannelOffset', {xTexels = function(t) return math.cos(t / 1000)*8 end, yTexels = function(t) return math.sin(t / 1000)*8 end}},
    {'filter.zoomBlur', {u = 0.5, v = 0.5, intensity = function(t) return (0.5 - math.cos(t / 1000) * 0.5) * 0.5 end}},
    {'filter.pixelate', {numPixels = 10}},
    {'filter.crystallize', {numTiles = function(t) return 32 + (0.5 + math.sin(t / 1000) * 0.5) * 32 end}},
}
function scene:applyEffect(obj)
    local t = system.getTimer()
    local ind = math.floor(t/5000) % #effects + 1
    if self.last_ind ~= ind then
        self.start_t = t
    end
    t = t - self.start_t
    self.last_ind = ind
    obj.fill.effect = effects[ind][1]
    if effects[ind][2] then
        for k, v in pairs(effects[ind][2]) do
            if type(v) == 'function' then
                obj.fill.effect[k] = v(t)
            else
                obj.fill.effect[k] = v
            end
        end
    end   
end


function scene:enterScene()
    storyboard.purgeScene("BioRhythm")   
    storyboard.purgeScene("menu") 
end
function scene:exitScene()
    audio.stop(c)
end
function scene:didExitScene()
    timer.cancel(self.t)
    self.t = nil
    for l = 1, 16 do
        if tc[l] then
            timer.cancel (tc[l])
            tc[l] = nil
        end
    end
    storyboard.removeScene('scenes.Visualizer')
end

scene:addEventListener('createScene', scene)
scene:addEventListener('enterScene', scene)
scene:addEventListener('exitScene',scene)
scene:addEventListener('didExitScene', scene)

return scene

