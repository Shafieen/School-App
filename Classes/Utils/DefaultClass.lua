local DefaultClass = Class()

function DefaultClass:staticInit(config)
	config = config or {}
	local dir = config.dir or 'Classes.DefaultClass'

	local group = display.newGroup(); group.isVisible = false
	self.group = group

	local disp = config.disp or display.getCurrentStage()
	self.disp = disp; disp:insert(group)

	local scope = config.scope or disp
	self.scope = scope

	group:addEventListener('onScopeEvent', self)
	scope:addEventListener('onGameState', self)
end

function DefaultClass:init(config)
	config = config or {}
	local group = display.newGroup(); group.isVisible = false
	self.group = group

	local disp = config.disp or self.disp
	disp:insert(group); self.disp = disp

	scene:addEventListener('onGameState', self)
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

function DefaultClass:onScopeEvent(e)
	local phase = e.phase
	if (phase == 'init') then self:show() end
end

return DefaultClass