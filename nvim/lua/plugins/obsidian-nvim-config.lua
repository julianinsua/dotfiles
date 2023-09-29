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
  },
  mappings = {}
})

vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true }
)

-- Open a note
vim.keymap.set("n", "<leader>o", "<cmd>Telescope find_files cwd=~/Dropbox/obsidian-vault<cr>")
