require("obsidian").setup({
  dir = "~/Dropbox/obsidian-vault",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
	daily_notes = {
    folder = "Daily",
  },
	templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M"
  }
})
