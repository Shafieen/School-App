local DefaultClass = Class()

function DefaultClass:init(config)
	config = config or {}

	local group = display.newGroup(); group.isVisible = false
	self.group = group

	local bottom = display.newGroup(); bottom.isVisible = true
	bottom.x, bottom.y = 0,0

	local disp = config.disp or display.getCurrentStage()
	self.disp = disp; disp:insert(group)

	local scope = config.scope or disp
	self.scope = scope

	local bkgr = display.newRect(0,0,dW,dH*0.51)
	group:insert(bkgr)
	bkgr:setReferencePoint(display.TopLeftReferencePoint)
	bkgr:setFillColor(0,66,47)
	bkgr.x, bkgr.y = 0,0
	
	local box1 = display.newGroup(); bottom:insert(box1)

		local infoBoxRect = display.newRoundedRect(dW*0.22,dH*0.025,316,275,12)
		infoBoxRect.strokeWidth = 3
		infoBoxRect:setFillColor(255,255,255)
		infoBoxRect:setStrokeColor(80,80,80)
		self.infoBoxRect = infoBoxRect
		box1:insert(infoBoxRect)

			local infoBoxPeople = display.newImage("Images/InfoBoxPeople.png", 90, 73)
			infoBoxPeople.x, infoBoxPeople.y = 60, 290
			bottom:insert(infoBoxPeople)

			local infoBoxTitle = display.newText({
				text="Student Personal Information System",
				font=native.systemFont,
				fontSize=15,
				width=200
				})
			infoBoxTitle:setReferencePoint(display.CenterLeftReferencePoint)
			infoBoxTitle.x = 110
			infoBoxTitle.y = 290
			infoBoxTitle:setTextColor(1,0,0)

		local button = display.newGroup()
			local info = display.newImageRect("Images/ViewInfoButton.png", 135, 100)
			info.x, info.y = 0,0
			self.link9 = button
			button:insert(info)
		box1:insert(button)
		button:setReferencePoint(display.TopCenterReferencePoint)
		button:addEventListener("touch", self)
		button.x, button.y = infoBoxRect.width*0.75,185

	local infoBodyTitle = display.newText({
		text="What's inside?",
		font=native.systemFont,
		fontSize=12
		})
	infoBodyTitle.x, infoBodyTitle.y = 125, 110
	infoBodyTitle:setTextColor(0,1,0)
	self.infoBodyTitle = infoBodyTitle
	box1:insert(infoBodyTitle)

	local infoBodyText = display.newText({
		text="Student assignments (grades 4-12), announcements & activities calendar (grades 6-12), household details, Harker family directory, household contact information.",
		font=native.systemFont,
		fontSize=11,
		width=infoBoxRect.width-infoBoxPeople.width+70
		})
	infoBodyText.x, infoBodyText.y = 225, 160
	infoBodyText:setTextColor(0,0,0)
	self.infoBodyText = infoBodyText
	box1:insert(infoBodyText)

	box1:setReferencePoint(display.TopCenterReferencePoint)
	box1.x, box1.y = dW*0.5, dH*0.51

	info:toFront()

	group:addEventListener('touch', self)
	scope:addEventListener('onScopeEvent', self)
	print('scrollview group:',self.group)
	return group
end

function DefaultClass:touch(e)
	local phase = e.phase
	print('Scrollview touch',phase,self.group)
	if (phase == 'began') then
		local group = self.group
		if (self.moveTrans) then transition.cancel(self.moveTrans); self.moveTrans = nil end
		self.xInit, self.yInit = group.x, group.y
		self.isMoving = false
		print('target:',e.target)
	elseif (phase == 'moved') then
		local xStart, yStart = e.xStart, e.yStart
		local x,y = e.x, e.y
		local dx, dy = x-xStart, y-yStart
		local dxAbs = math.abs(dx)

		--if(dx > 0) then

		if (dxAbs > 7) then
			local group = self.group
			group.x = self.xInit + dx
			self.isMoving = true
		print(dx,e.target)
		end
	--end
	elseif (phase == 'ended') then
		local target = e.target
		if (self.isMoving) then
			self.xInit, self.yInit = nil, nil
			if (self.moveTrans) then transition.cancel(self.moveTrans); self.moveTrans = nil end
			self.moveTrans = transition.to(self.group, {time=500, x=0,y=0, onComplete=function()
				self.moveTrans = nil
			end})
			self.page = 1 --or 2 depending on where you transition
		elseif (target == self.link9) then
			local function webListener()
			end
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("https://webappsca.pcrsoft.com/Clue/Default.aspx?pid=7533")
		end
	end
	return true
end

function DefaultClass:show(config)
	config = config or {}
	local group = self.group
	group.isVisible = true

	group.x, group.y = config.x or 0, config.y or 0
	local scl = config.scl or 1
	group.xScale, group.yScale = scl,scl
	group.alpha = config.alpha or 1
end

function DefaultClass:hide()
	local group = self.group
	group.isVisible = false

end

function DefaultClass:animIn(config)
	config = config or {}
	local group = self.group
	self:show(config)
	local time = config.time or 500
	transition.to(group, {time=time})
end

function DefaultClass:animOut(config)
	config = config or {}
	local group = self.group
	local time = config.time or 500
	transition.to(group, {time=time, onComplete=function()
		self:hide()
	end})
end

function DefaultClass:onScopeEvent(e) --use to communicate scene events with other classes
	local phase = e.phase
	if (phase == 'show') then self:show()
	elseif (phase == 'exit') then self:hide() end
end

return DefaultClass