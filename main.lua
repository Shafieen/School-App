-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar(display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"

dW,dH = display.contentWidth, display.contentHeight

local function system(e)

end

Runtime:addEventListener('system', system)

require('Classes.Utils.Performance')
require('Classes.Utils.Class')
local storyboard = require "storyboard"

storyboard:gotoScene('view1')