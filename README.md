# My Neovim Configuration
This repository is where I keep track of my Neovim configuration,
in case if I make any oopsies, I can restore the previous history. 

It is also to share my configuration in case someone wants to use it.

## Plugins Used
These are listed in the order of dependency and importance. 

[lazy.nvim](https://github.com/folke/lazy.nvim): Plugin manager with lazy-
loading support. **Must installed before any other plugins.**

[coc.nvim](https://github.com/neoclide/coc.nvim): Plugin for auto-completion.
This plugin requires a language server set up to work.

[vim-commentary](https://github.com/tpope/vim-commentary): Code commenting
with `gcc` and `gc<motion>` key mappings. Very nice to use during configuration
when you want to test out some stuff.

[nvim-autopairs](https://github.com/windwp/nvim-autopairs): Auto-pairing
when editing. This pretty much just speeds up the rest of the configuration
for other plugins, so definitely needs to be installed right of the bat.

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors):
This is basically the VISUAL BLOCK mode extended, or the Ctrl-D shortcut
in VS Code.

[neovim-session-manager](Shatur/neovim-session-manager): This plugins builds
upon Neovim's builtin `:mksession` and handles all of the session saving
and loading in an **organised** fashion (it saves to one directory that is).

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):
Plugin for managing tree-sitter parsers. I am mainly using this for syntax
highlighting.

[jellybeans.nvim](https://github.com/WTFox/jellybeans.nvim): A jellybeans
theme with treesitter support.

[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo): This is an enhanced
code folding plugin which allows for LSP support.

[markview.nvim](https://github.com/OXY2DEV/markview.nvim): A Markdown
preview plugin.

[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): A filesystem
tree to for quick navigation. **NerdFonts** for your terminal is needed to load
file icons.

[vim-airline](https://github.com/vim-airline/vim-airline): A nice status bar
to look at.

[rainbow-csv](https://github.com/mechatroner/rainbow_csv): VS Code inspired
RainbowCSV plugin. Plugin provides a nice way to differentiate between columns. 

[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): Basically
a CSS color previewer. This is nice when doing a lot of colour configuration,
e.g. configuring your colorscheme.

[vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent):
This is a plugin that correctly indents code on newlines (pressing `<CR>`).

