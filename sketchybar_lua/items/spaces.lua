local colors = require("colors")
local icons = require("icons")

function parse_string_to_table(s)
	local result = {}
	for line in s:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

function table_includes_value(tbl, val)
	local result = false
	for _, v in ipairs(tbl) do
		if v == val then
			result = true
		end
	end
	return result
end

-- local file = io.popen("aerospace list-workspaces --monitor all --empty no")
-- local spaces = file:read("*a")
-- file:close()
-- local workspaces = parse_string_to_table(spaces)

local file = io.popen("aerospace list-workspaces --all")
local spaces = file:read("*a")
file:close()
local workspaces = parse_string_to_table(spaces)

local file2 = io.popen("aerospace list-workspaces --monitor all --visible")
local visible = file2:read("*a")
file2:close()
local visibleWorkspaces = parse_string_to_table(visible)

for i, workspace in ipairs(workspaces) do
	local space = sbar.add("item", "space." .. i, {
		icon = {
			string = workspace,
			color = colors.white,
			highlight_color = colors.bg2,
			padding_right = 12,
			padding_left = 12,
		},
		background = {
			color = colors.bg2,
			height = 18,
		},
		label = {
			drawing = false,
			string = icons.spaces[i],
			color = colors.white,
			highlight_color = colors.bg2,
			padding_left = 0,
			padding_right = 8,
			font = { size = 12 },
		},
		click_script = "aerospace workspace " .. workspace,
	})

	local check_space_has_windows = function(space)
		local file = io.popen("aerospace list-windows --workspace " .. space)
		local w = file:read("*a")
		file:close()
		local windows = parse_string_to_table(w)
		return #windows > 0
	end

	local get_spaces_with_no_windows = function()
		local spaces_no_windows = {}
		for _, w in ipairs(workspaces) do
			if not check_space_has_windows(w) then
				table.insert(spaces_no_windows, w)
			end
		end
		return spaces_no_windows
	end

	space:subscribe("aerospace_workspace_change", function(env)
		local selected = env.FOCUSED_WORKSPACE == workspace

		space:set({
			icon = { highlight = selected },
			label = { highlight = selected, drawing = selected },
			background = {
				color = selected and colors.magenta or colors.bg1,
			},
		})
		if selected then
			sbar.animate("tanh", 8, function()
				space:set({
					background = { shadow = { distance = 0 } },
					y_offset = -2,
					padding_left = 8,
					padding_right = 0,
				})
				space:set({
					background = { shadow = { distance = 4 } },
					y_offset = 0,
					padding_left = 4,
					padding_right = 4,
				})
			end)
		end
	end)
end
