local icons = require("icons")

local cal = sbar.add("item", {
	label = {
		align = "left",
		font = { size = 12 },
	},
	position = "right",
	update_freq = 15,
})

local function update()
	local datetime = os.date("%a %d %b %H:%M")
	cal:set({ label = datetime })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
