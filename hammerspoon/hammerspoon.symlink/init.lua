-- the key binding
local bindKeys = {"ctrl", "shift"}

-- arrange windows
hs.grid.setGrid('8x8')
hs.grid.setMargins('0x0')

local gw = hs.grid.GRIDWIDTH
local gh = hs.grid.GRIDHEIGHT

local windowset = function(x, y, w, h)
	return function()
		local win = hs.window.focusedWindow()
		local f = win:frame()

		f.x = x
		f.y = y
		f.w = w
		f.h = h
		win:setFrame(f)
	end
end

local gridset = function(x, y, w, h)
	return function()
		local win = hs.window.focusedWindow()
		local f = win:frame()
		local screen = win:screen()
		local max = screen:frame()

		f.x = x
		f.y = y
		f.w = w
		f.h = h
		hs.grid.set(win, f, screen)
		-- win:setFrame(f)
	end
end

hs.hotkey.bind(bindKeys, 'Left', gridset(0, 0, gw/2, gh)) -- left half
hs.hotkey.bind(bindKeys, 'Right', gridset(gw/2, 0, gh/2, gh)) -- right half
hs.hotkey.bind(bindKeys, 'Up', gridset(gw/2, 0, gw/2, gh/2)) -- top right
hs.hotkey.bind(bindKeys, 'Down', gridset(gw/2, gh/2, gw/2, gh/2)) -- bottom right

hs.hotkey.bind(bindKeys, 'o', windowset(0, 0, 1920, 1080)) -- top lef 1920x1080

hs.hotkey.bind(bindKeys, 's', gridset(0, 0, 4, 6)) -- skype window
hs.hotkey.bind(bindKeys, 'l', gridset(2, 0, 6, gh)) -- chrome window
hs.hotkey.bind(bindKeys, 'h', gridset(0, 0, 6, gh)) -- chrome window
hs.hotkey.bind(bindKeys, 'e', gridset(1, 1, 6, 6)) -- spotify window
hs.hotkey.bind(bindKeys, 't', gridset(0, 0, 3, gh)) -- tweetbot window

-- spotify command
hs.hotkey.bind(bindKeys, 'space', function () hs.spotify.playpause() end)
hs.hotkey.bind(bindKeys, 'n', function () hs.spotify.next() end)
hs.hotkey.bind(bindKeys,'p', function () hs.spotify.previous() end)
hs.hotkey.bind(bindKeys,'i', function () hs.spotify.displayCurrentTrack() end)

-- defeat past blocking
hs.hotkey.bind(bindKeys, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- automatically reload the config
function reloadConfig(files)
	doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
