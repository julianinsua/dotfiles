local colors = require("colors")
local icons = require("icons")

local wifi = sbar.add("alias", "Control Center,WiFi", {
	position = "right",
	background = {
		height = 24,
	},
	alias = { color = colors.white },
})

wifi:subscribe("mouse.clicked", function()
	print("pepito")
end)
