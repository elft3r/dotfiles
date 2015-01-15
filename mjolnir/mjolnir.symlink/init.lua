-- Load Extensions
local alert = require "mjolnir.alert"
local hotkey = require "mjolnir.hotkey"
local screen = require "mjolnir.screen"
local window = require "mjolnir.window"

-- User packages
local grid = require "mjolnir.bg.grid"
local spotify = require "mjolnir.lb.spotify"

-- set grid size and related variables
grid.GRIDWIDTH = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0

local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

local gridset = function(x, y, w, h)
	return function()
		cur_window = window.focusedwindow()
		grid.set(
			cur_window,
			{x=x, y=y, w=w, h=h},
			cur_window:screen()
		)
	end
end

local mash = {"ctrl", "shift"}
hotkey.bind(mash, 'a', gridset(0, 0, gw/2, gh)) -- left half
hotkey.bind(mash, 's', grid.maximize_window)
hotkey.bind(mash, 'd', gridset(gw/2, 0, gh/2, gh)) -- right half
hotkey.bind(mash, 't', gridset(gw/2, 0, gw/2, gh/2)) -- top right
hotkey.bind(mash, 'b', gridset(gw/2, gh/2, gw/2, gh/2)) -- top right
hotkey.bind(mash, 'space', spotify.play)
hotkey.bind(mash, 'n', spotify.next)
hotkey.bind(mash, 'p', spotify.previous)
