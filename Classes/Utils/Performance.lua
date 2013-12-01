
Performance = display.newGroup()
local Performance = Performance

local fontSize = 12
local pad = 5
local yPad = 16

function Performance:init()
    -- local curV = Data.server.version

    -- local version = display.newText('v'..curV, 0,0, 'Helvetica', fontSize)
    -- version:setReferencePoint(display.TopLeftReferencePoint)
    -- version.x, version.y = 0,0
    -- version:setTextColor(0,105,0)
    -- self:insert(version); self.version = version

    local holdTxt = display.newText('FPS steady',pad,0, 'Helvetica', fontSize)
    holdTxt:setReferencePoint(display.TopLeftReferencePoint)
    holdTxt.x, holdTxt.y = 0, yPad
    self:insert(holdTxt); self.holdTxt = holdTxt
    holdTxt:setTextColor(0,105,0)

    local memoryTxt = display.newText('00 00.00 000',pad,0, 'Helvetica', fontSize);
    memoryTxt:setReferencePoint(display.TopLeftReferencePoint)
    memoryTxt.x, memoryTxt.y = 0,yPad*2
    self:insert(memoryTxt); self.memoryTxt = memoryTxt
    memoryTxt.Performance = self
    memoryTxt:setTextColor(0,105,0)

    self:setReferencePoint(display.BottomLeftReferencePoint)
    self.x, self.y = pad, dH-pad
    self.alpha = 0.5
end

function Performance:start()
    local prevTime = 0
    local mFloor = math.floor
    local sGetInfo = system.getInfo
    local sGetTimer = system.getTimer
    local memoryTxt = self.memoryTxt
    local holdTxt = self.holdTxt
    local ct = 1
    local arr = {}
    local function update()
        self:toFront()
        local curTime = sGetTimer()
        local fps = mFloor( 1000 / (curTime - prevTime))
        table.insert(arr, fps)
        if (ct >= 10) then
            --collectgarbage('collect')
            ct =1
            local val=0
            local tot = #arr
            for i=1,tot do
                val = val+arr[i]
            end
            arr = {}
            avg = mFloor(val/tot)
            memoryTxt.text = tostring(avg)..' FPS, '.. tostring(mFloor(sGetInfo('textureMemoryUsed') * 0.0001) * 0.01)..' MB'
            memoryTxt:setReferencePoint(display.TopLeftReferencePoint); memoryTxt.x = 0
            if (avg > 45) then holdTxt.text = 'FPS steady'; holdTxt:setTextColor(0,105,0)
            else holdTxt.text = 'FPS poor'; holdTxt:setTextColor(155,50,50) end
        else ct = ct+1 end
        prevTime = curTime
    end

    self.updateFC = update
    Runtime:addEventListener('enterFrame', update)
    memoryTxt:addEventListener('tap', memoryTxt)
end

if (not PROD_MODE) then
    Performance:init()
    Performance:start()
end

return Performance
