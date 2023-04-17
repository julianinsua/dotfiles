local g = vim.g

-- Don't fold headers
g.vim_markdown_folding_disabled = 1

-- Auto fit table of contents
g.vim_markdown_toc_autofit = 1

-- Disable math conceal
g.tex_conceal = ""
g.vim_markdown_math = 1

-- Disable code blocks conceal
g.vim_markdown_conceal_code_blocks = 0

-- Recognize languages in code blocks
g.vim_markdown_fenced_languages = {  'csharp=cs', 'pytho=py', 'bash=sh' }

-- Follow links
g.vim_markdown_follow_anchor = 1

-- SINTAX EXTENSIONS
-- LaTex math with $inline_math$ and $$math_block$$
g.vim_markdown_math = 1

-- YAML front matter
g.vim_markdown_frontmatter = 1

-- Strikethrough with ~~striked~~
g.vim_markdown_strikethrough = 1

-- Indent nested lists whith 2 spaces
g.vim_markdown_new_list_item_indent = 2

-- Follow links ignoring the .md ending
g.vim_markdown_no_extensions_in_markdown = 1

-- Open followed links in a vertical split
g.vim_markdown_edit_url_in = 'vsplit'
