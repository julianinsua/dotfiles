local icons = require("icons")
local colors = require("colors")

local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple_logo = sbar.add("item", {
	padding_right = 8,
	click_script = popup_toggle,
	icon = {
		string = icons.apple,
		font = {
			style = "Black",
			size = 16.0,
		},
		color = colors.green,
	},
	label = {
		drawing = false,
	},
	popup = {
		height = 35,
	},
	background = {
		padding_right = 16,
	},
})

local apple_prefs = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.preferences,
	label = "Preferences",
})

apple_prefs:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'System Preferences'")
	apple_logo:set({ popup = { drawing = false } })
end)

local apple_shutdown = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.power,
	label = "Shutdown",
})

apple_shutdown:subscribe("mouse.clicked", function(_)
	sbar.exec("shutdown -h now")
	apple_logo:set({ popup = { drawing = false } })
end)
