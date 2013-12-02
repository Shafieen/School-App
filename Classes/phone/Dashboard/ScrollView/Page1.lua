local DefaultClass = Class()

function DefaultClass:init(config)
	config = config or {}

	local group = display.newGroup(); group.isVisible = false
	self.group = group

	local bottom = display.newGroup(); bottom.isVisible = true
	bottom.x, bottom.y = 0,0

	print('Adding pg1 to disp:',config.disp)
	local disp = config.disp or display.getCurrentStage()
	self.disp = disp; disp:insert(group)

	local scope = config.scope or disp
	self.scope = scope

	local bkgr = display.newRect(0,0,dW,dH*0.51)
	group:insert(bkgr)
	bkgr:setReferencePoint(display.TopLeftReferencePoint)
	bkgr:setFillColor(0,66,47)
	bkgr.x, bkgr.y = 0,0

	local techHelp = display.newRoundedRect(0,0,80,80,10)
	techHelp.strokeWidth = 2
	techHelp:setStrokeColor(0)
	techHelp:setReferencePoint(display.TopLeftReferencePoint)
	techHelp.x, techHelp.y = 20,20
	techHelp:setFillColor(255,255,255)
	group:insert(techHelp)

	local techHelpTitle = display.newText({
		text="Tech Help",
		font=native.systemFont,
		fontSize=15
		})
	techHelpTitle:setReferencePoint(display.CenterReferencePoint)
	techHelpTitle:setTextColor(255,255,255)
	techHelpTitle.x, techHelpTitle.y = 63,111
	group:insert(techHelpTitle)

	local techHelpBody = display.newText({
		text="Tech Help",
		font=native.systemFont,
		fontSize=13
		})
	techHelpBody:setReferencePoint(display.CenterReferencePoint)
	techHelpBody:setTextColor(0,0,0)
	techHelpBody.x, techHelpBody.y = 63,30
	group:insert(techHelpBody)

	local courseware = display.newRoundedRect(0,0,80,80,10)
	courseware.strokeWidth = 2
	courseware:setStrokeColor(0)
	courseware:setReferencePoint(display.TopLeftReferencePoint)
	courseware.x, courseware.y = 120,20
	courseware:setFillColor(255,255,255)
	group:insert(courseware)

	local coursewareTitle = display.newText({
		text="Courseware",
		font=native.systemFont,
		fontSize=15
		})
	coursewareTitle:setReferencePoint(display.CenterReferencePoint)
	coursewareTitle:setTextColor(255,255,255)
	coursewareTitle.x, coursewareTitle.y = 163, 111
	group:insert(coursewareTitle) 

	local coursewareBody1 = display.newText({
		text="Athena2",
		font=native.systemFont,
		fontSize=10
		})
	coursewareBody1:setReferencePoint(display.CenterReferencePoint)
	coursewareBody1:setTextColor(255,157,0)
	coursewareBody1.x, coursewareBody1.y = 158, 30
	group:insert(coursewareBody1)

	local coursewareBody2 = display.newText({
		text="Google Apps for Education (GAFE) - aka students.harker.org",
		font=native.systemFont,
		fontSize=7,
		width=80
		})
	coursewareBody2:setReferencePoint(display.CenterReferencePoint)
	coursewareBody2:setTextColor(0,0,0)
	coursewareBody2.x, coursewareBody2.y = 163, 50
	group:insert(coursewareBody2)

	local coursewareBody3 = display.newText({
		text="Student Email",
		font=native.systemFont,
		fontSize=10
		})
	coursewareBody3:setReferencePoint(display.CenterReferencePoint)
	coursewareBody3:setTextColor(255,157,0)
	coursewareBody3.x, coursewareBody3.y = 160, 70
	group:insert(coursewareBody3)

	local coursewareBody4 = display.newText({
		text="Student Drive",
		font=native.systemFont,
		fontSize=10
		})
	coursewareBody4:setReferencePoint(display.CenterReferencePoint)
	coursewareBody4:setTextColor(255,157,0)
	coursewareBody4.x, coursewareBody4.y = 160, 87
	group:insert(coursewareBody4)

	local announcements = display.newRoundedRect(0,0,80,80,10)
	announcements.strokeWidth = 2
	announcements:setStrokeColor(0)
	announcements:setReferencePoint(display.TopLeftReferencePoint)
	announcements.x, announcements.y = 220,20
	announcements:setFillColor(255,255,255)
	group:insert(announcements)

	local announcementsTitle = display.newText({
		text="Announcements",
		font=native.systemFont,
		fontSize=13
		})
	announcementsTitle:setReferencePoint(display.CenterReferencePoint)
	announcementsTitle:setTextColor(255,255,255)
	announcementsTitle.x, announcementsTitle.y = 265, 111
	group:insert(announcementsTitle)

	local announcementsBody = display.newText({
		text="2013-14 Vacations, Holidays, and Key Dates",
		font=native.systemFont,
		fontSize=8,
		width=80
		})
	announcementsBody:setReferencePoint(display.CenterReferencePoint)
	announcementsBody:setTextColor(255,157,0)
	announcementsBody.x, announcementsBody.y = 265, 45
	group:insert(announcementsBody)

	local studentResources = display.newRoundedRect(0,0,80,80,10)
	studentResources.strokeWidth = 2
	studentResources:setStrokeColor(0)
	studentResources:setReferencePoint(display.TopLeftReferencePoint)
	studentResources.x, studentResources.y = 75,125
	studentResources:setFillColor(255,255,255)
	group:insert(studentResources)

	local studentTitle = display.newText({
		text="Student Produced Resources",
		font=native.systemFont,
		fontSize=10,
		width=90
		})
	studentTitle:setReferencePoint(display.CenterReferencePoint)
	studentTitle:setTextColor(255,255,255)
	studentTitle.x, studentTitle.y = 120, 220
	group:insert(studentTitle)

	local studentBody = display.newText({
		text="Student Clubs",
		font=native.systemFont,
		fontSize=10
		})
	studentBody:setReferencePoint(display.CenterReferencePoint)
	studentBody:setTextColor(255,157,0)
	studentBody.x, studentBody.y = 118, 135
	group:insert(studentBody)

	local studentBody2 = display.newText({
		text="Winged Posts & Talon",
		font=native.systemFont,
		fontSize=10,
		width = 80
		})
	studentBody2:setReferencePoint(display.CenterReferencePoint)
	studentBody2:setTextColor(255,157,0)
	studentBody2.x, studentBody2.y = 120, 155
	group:insert(studentBody2)

	local studentBody3 = display.newText({
		text="Honor Code",
		font=native.systemFont,
		fontSize=10
		})
	studentBody3:setReferencePoint(display.CenterReferencePoint)
	studentBody3:setTextColor(255,157,0)
	studentBody3.x, studentBody3.y = 110, 175
	group:insert(studentBody3)

	local studentBody4 = display.newText({
		text="Email Honor Council",
		font=native.systemFont,
		fontSize=10,
		width=90
		})
	studentBody4:setReferencePoint(display.CenterReferencePoint)
	studentBody4:setTextColor(255,157,0)
	studentBody4.x, studentBody4.y = 125, 193
	group:insert(studentBody4)
	--opens up mail app

	local fundrasiers = display.newRoundedRect(0,0,80,80,10)
	fundrasiers.strokeWidth = 2
	fundrasiers:setStrokeColor(0)
	fundrasiers:setReferencePoint(display.TopLeftReferencePoint)
	fundrasiers.x, fundrasiers.y = 190,125
	fundrasiers:setFillColor(255,255,255)
	group:insert(fundrasiers)

	local fundraiserTitle = display.newText({
		text="Student Fundraisers",
		font=native.systemFont,
		fontSize=10
		})
	fundraiserTitle:setReferencePoint(display.CenterReferencePoint)
	fundraiserTitle:setTextColor(255,255,255)
	fundraiserTitle.x, fundraiserTitle.y = 235, 215
	group:insert(fundraiserTitle)

	local fundraiserBody = display.newText({
		text="There are no posts",
		font=native.systemFont,
		fontSize=13,
		width=70
		})
	fundraiserBody:setReferencePoint(display.CenterReferencePoint)
	fundraiserBody:setTextColor(0,0,0)
	fundraiserBody.x, fundraiserBody.y = 235, 145
	group:insert(fundraiserBody)

	local touchArea1 = display.newRect(0,0,50,15)
	group:insert(touchArea1)
	touchArea1:setFillColor(0,0,0,0) --set last value to 0 for invisible, but touchable
	touchArea1:addEventListener('touch', touchArea1)
	self.link1 = touchArea1
	touchArea1.x, touchArea1.y = 160,30
	touchArea1:addEventListener('touch', self)

	local touchArea2 = display.newRect(0,0,60,10)
	group:insert(touchArea2)
	touchArea2:setFillColor(0,0,0,0)
	touchArea2:addEventListener('touch', touchArea2)
	self.link2 = touchArea2
	touchArea2.x, touchArea2.y = 160,70
	touchArea2:addEventListener('touch', self)

	local touchArea3 = display.newRect(0,0,60,10)
	group:insert(touchArea3)
	touchArea3:setFillColor(0,0,0,0)
	touchArea3:addEventListener('touch', touchArea3)
	self.link3 = touchArea3
	touchArea3.x, touchArea3.y = 160, 87
	touchArea3:addEventListener('touch', self)

	local touchArea4 = display.newRect(0,0,75,30)
	group:insert(touchArea4)
	touchArea4:setFillColor(0,0,0,0)
	touchArea4:addEventListener('touch', touchArea4)
	self.link4 = touchArea4
	touchArea4.x, touchArea4.y = 262, 42
	touchArea4:addEventListener('touch', self)

	local touchArea5 = display.newRect(0,0,70,10)
	group:insert(touchArea5)
	touchArea5:setFillColor(0,0,0,0)
	touchArea5:addEventListener('touch', touchArea5)
	self.link5 = touchArea5
	touchArea5.x, touchArea5.y = 117, 135
	touchArea5:addEventListener('touch', self)

	local touchArea6 = display.newRect(0,0,70,20)
	group:insert(touchArea6)
	touchArea6:setFillColor(0,0,0,0)
	touchArea6:addEventListener('touch', touchArea6)
	self.link6 = touchArea6
	touchArea6.x, touchArea6.y = 115, 155
	touchArea6:addEventListener('touch', self)

	local touchArea7 = display.newRect(0,0,60,10)
	group:insert(touchArea7)
	touchArea7:setFillColor(0,0,0,0)
	touchArea7:addEventListener('touch', touchArea7)
	self.link7 = touchArea7
	touchArea7.x, touchArea7.y = 110, 175
	touchArea7:addEventListener('touch', self)

	local touchArea8 = display.newRect(0,0,60,20)
	group:insert(touchArea8)
	touchArea8:setFillColor(0,0,0,0)
	touchArea8:addEventListener('touch', touchArea8)
	self.link8 = touchArea8
	touchArea8.x, touchArea8.y = 1150, 193
	touchArea8:addEventListener('touch', self)
	--opens up mail app

<<<<<<< HEAD
	--group:addEventListener('touch', self)
=======
	-- group:addEventListener('touch', self)
>>>>>>> c0884117390684d137f729e7418bef4a2b1c6d2a
	scope:addEventListener('onScopeEvent', self)
end

function DefaultClass:touch(e)
	local phase = e.phase
	print('Page1 touch',phase,self.disp)
	if (e.phase == 'began') then
		local target = e.target
		if (target == self.link1) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("http://athena2.harker.org/")
			local function webListener()
			webView:addEventListener("urlRequest", webListener)
			end
			print('link1',target)
		elseif (target == self.link2) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("https://www.google.com/a/students.harker.org/ServiceLogin?service=mail&passive=true&rm=false&continue=http://mail.google.com/a/students.harker.org/&ltmpl=default&ltmplcache=2&emr=1")
			--link doesn't work
		elseif (target == self.link3) then 
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("https://accounts.google.com/ServiceLogin?service=CPanel&passive=1209600&cpbps=1&continue=https%3A%2F%2Fadmin.google.com%2Fstudents.harker.org%2FDashboard&followup=https%3A%2F%2Fadmin.google.com%2Fstudents.harker.org%2FDashboard&skipvpage=true")
			--link doesn't work
		elseif (target == self.link4) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("http://www.harker.org/uploaded/assets/documents/pdfs/ACA_Calendar_KeyDates_Vaca_Holidays_FINAL_1314.pdf")
		elseif (target == self.link5) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("http://web.harker.org/")
		elseif (target == self.link6) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("http://harkeraquila.com/")
		elseif (target == self.link7) then
			local webView = native.newWebView(0, 0, 320, 530, webListener)
			webView:request("http://www.harker.org/uploaded/main/pdfs/Handbooks_and_Other_Academic_Resources/Honor_Code_US.pdf")
		elseif (target == self.link8) then
			--local webView = native.newWebView(0, 0, 320, 530, webListener)
			--webView:request("")
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