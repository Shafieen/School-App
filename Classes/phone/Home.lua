--CLASS TEMPLATE FOR PROJECTS
--COPY/ PASTE THIS CODE WHEN CREATING
--A NEW CLASS, AND THEN MODIFY IT.

--example class for every other button

local Home = {}
local widget = require("widget")

function Home:staticInit(config) --for static classes
	local group = widget.newScrollView({
			width=dW,
			height=2*dH,
			horizontalScrollDisabled = true,
			friction=0.85,
			-- hideScrollBar=true,
			hideBackground=true
	})--display.newGroup(); 
	group.isVisible = false --visual element, do not show by default
	self.group = group

	local disp = config.disp or display.getCurrentStage() --parent display group
	disp:insert(group); self.disp = disp

	local scope = config.scope or disp; self.scope = scope --scope to listen/ dispatch events on
	
	local bg = display.newRect(0,0,dW,dH)
		group:insert(bg)
		self.bg = bg

	

	local box2 = display.newGroup()	

	local grayBox = display.newRect(dW*0.09, dH*0.68,0.5*infoBoxRect.width,30,12)
	grayBox.strokeWidth = 3
	grayBox:setFillColor(50,50,50)
	grayBox:setStrokeColor(50,50,50)
	self.grayBox = grayBox
	box2:insert(grayBox)
	grayBox:setReferencePoint(display.TopLeftReferencePoint)

	local whiteBox = display.newRect(dW*0.086, dH*0.72,0.5*infoBoxRect.width+2,80,12)
	whiteBox.strokeWidth = 2
	whiteBox:setFillColor(255,255,255)
	whiteBox:setStrokeColor(0,0,0)
	self.whiteBox = whiteBox
	box2:insert(whiteBox)
	whiteBox:setReferencePoint(display.BottomLeftReferencePoint)

	local whiteTitle = display.newText({
		text="Tech Help",
		font=native.systemFont,
		fontSize=13
		})
	whiteTitle.x, whiteTitle.y = 65, 335
	whiteTitle:setTextColor(255,255,255)
	self.whiteTitle = whiteTitle
	box2:insert(whiteTitle)

	local blackText = display.newText({
		text="Tech Help",
		font=native.systemFont,
		fontSize=12
		})
	blackText.x, blackText.y = 62, 355
	blackText:setTextColor(0,0,0)
	self.blackText = blackText
	box2:insert(blackText)

	local touchArea = display.newRect(0,0,100,25)
	box2:insert(touchArea)
	touchArea:setFillColor(0,0,0,0) --set last value to 0 for invisible, but touchable
	touchArea.x, touchArea.y = 76,355
	touchArea:addEventListener('touch', touchArea)
	self.techHelpTouch = touchArea

	-- box2.x, box2.y = 60, 355

	--becomes scene view
	scope:addEventListener('onScopeEvent', self) --use to communicate scene events with other classes
end

function Home:touch(e)
	print('touch',e.phase)
	local phase = e.phase
	local target = e.target
	if (target == self.info) then
		if (phase == 'began') then
			local webView = native.newWebView(0, 0, 320, 480, webListener)
			webView:request("https://webappsca.pcrsoft.com/Clue/Default.aspx?pid=7533")
	
			local function webListener()
			end
			webView:addEventListener( "urlRequest", webListener )
			-- self:hide()
			-- self.scope:dispatchEvent({name="onScopeEvent", phase="showInfo"})
		end
	elseif (target == self.techHelpTouch) then
		if (phase == 'began') then

		end
	end
	return true
end

function Home:show(config) --show the display group associated with this class/ instance
	config = config or {}
	local group = self.group
	group.isVisible = true

end

function Home:hide() --hide the display group associated with this class/ instance
	local group = self.group
	group.isVisible = false

end

function Home:animIn(config) --show the display group associated with this class/ instance
	config = config or {}
	local group = self.group
	self:show(config)
	local time = config.time or 500
	transition.to(group, {time=time}) --add transition options for how you want it to animate
end

function Home:animOut(config)
	config = config or {}
	local group = self.group
	local time = config.time or 500
	transition.to(group, {time=time, onComplete=function() --add transition options for how you want it to animate
		self:hide()
	end})
end

function Home:onScopeEvent(e) --use to communicate scene events with other classes
	local phase = e.phase
	if (phase == 'show') then self:show()
	elseif (phase == 'exit') then self:hide() end
end

return Home