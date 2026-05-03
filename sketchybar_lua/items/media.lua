local media = sbar.add("item", {
	icon = { drawing = false },
	label = { drawing = true },
	position = "left",
	updates = true,
})

media:subscribe("media_change", function(env)
	print("trigger")
end)
