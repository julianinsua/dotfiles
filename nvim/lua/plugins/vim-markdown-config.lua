-- Configuration for vim markdown syntax highlighting, folding, etc.
vim.g.vim_markdown_folding_disabled = 1 --> Disables all folding, this avoids the flickering due to my navigate lines keymaps
vim.g.vim_markdown_no_default_key_mappings = 1 --> No default mappings
vim.g.vim_markdown_fenced_languages = { 'python=py', "bash=sh" } --> use python instead of "py" and bash instead of "sh"
vim.g.vim_markdown_follow_anchor = 1 --> Follow links anchor using "ge"
vim.g.vim_markdown_math = 1 --> Allow LaTex math expressions with $ and $$
vim.g.vim_markdown_frontmatter = 1 --> Format yaml frontmatter
vim.g.vim_markdown_strikethrough = 1 --> Enable strikethrough with ~~
vim.g.vim_markdown_new_list_item_indent = 2 --> Indent 2 spaces when nesting list
vim.g.vim_markdown_no_extensions_in_markdown = 1 --> Don't require the .md on links followed

