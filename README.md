# The complete dotfiles edition
## Nvim
### Nvim dependencies
I am using null-ls for some specific diagnostics, also it's using vim-prettier. This means that you'll need some stuff installed besides what Lazu already installs automatically. Here's a list
- write-good
- cspell
- codespell
- prettier (also yarn for vim-prettier)

## Tmux
This is a bit trickier to link because the default config location is not on the `~/.config` folder. Instead it needs to be on the home directory (`~/`).
