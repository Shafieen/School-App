local DefaultClass = Class()

function DefaultClass:init(config)
	config = config or {}

	local group = display.newGroup(); group.isVisible = false
	self.group = group

	local disp = config.disp or display.getCurrentStage()
	self.disp = disp; disp:insert(group)

	local scope = config.scope or disp
	self.scope = scope

	require('Classes.phone.Dashboard.ScrollView'):init({disp=group, scope=scope})
	--require('Classes.phone.Dashboard.Scrollview.Page1'):init({disp=group, scope=scope})

	scope:addEventListener('onScopeEvent', self)

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