# My Neovim Configuration
This repository is where I keep track of my Neovim configuration,
in case if I make any oopsies, I can restore the previous history. 

It is also to share my configuration in case someone wants to use it.

## Plugins Used
These are listed in the order of dependency and usability. 

:::{dropdown} Must Have
- [`lazy.nvim`](https://github.com/folke/lazy.nvim): Plugin manager with lazy-
    loading support. **Must install before any other plugins.**
- [`mason.nvim`](https://github.com/mason-org/mason.nvim): A package manager for
    LSP servers and more. I mainly use this for LSP support.
- [`mason-lspconfig.nvim`](https://github.com/mason-org/mason-lspconfig.nvim):
    This extends the `mason.nvim` plugin with automatic enabling of installed LSP
    servers, so you don't have to manually enable it in your config anymore.
- [`lazydev.nvim`](https://github.com/folke/lazydev.nvim): This is an enhanced
    Lua LSP server which can recognizes your Neovim configuration. This is very
    useful during configuration with the code analysis.
- [`blink.cmp`](https://github.com/saghen/blink.cmp): Completion engine that
    uses multiple sources to give suggestions.
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter):
    Plugin for managing tree-sitter parsers. I am mainly using this for syntax
    highlighting and text-objects support.
- [`vim-commentary`](https://github.com/tpope/vim-commentary): Code commenting
    with `gcc` and `gc<motion>` key mappings. Very nice to use during configuration
    when you want to test out some stuff.
- [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs): Auto-pairing
    when editing. This pretty much just speeds up the rest of the configuration
    for other plugins, so definitely needs to be installed right of the bat.
:::

**Highly Recommended**:
- [`nvim-treesitter-textobjects`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects):
    Plugin for amazing syntactical text-objects.
- [`neovim-session-manager`](https://github.com/Shatur/neovim-session-manager): This plugins builds
    upon Neovim's builtin `:mksession` and handles all of the session saving
    and loading in an **organised** fashion (it saves to one directory that is).
- [`nvim-ufo`](https://github.com/kevinhwang91/nvim-ufo): This is an enhanced
    code folding plugin which allows for LSP support.
- [`flash.nvim`](https://github.com/folke/flash.nvim): An enhancement of the
    `f`, `F`, `t`, and `T` motions, allowing for teleportation across the file. 
- [`mini.surround`](https://github.com/nvim-mini/mini.surround): This is a
    complementary plugin to the `nvim-autopairs` plugin, which allows for better
    quick wrapping and pair-edits.


**Cool Plug**:
- [`jellybeans.nvim`](https://github.com/WTFox/jellybeans.nvim): A jellybeans
    theme with treesitter support.
- [`nvim-notify`](https://github.com/rcarriga/nvim-notify): A plugin for beautiful
    and animated notification.
- [`fidget.nvim`](https://github.com/j-hui/fidget.nvim): This is a nice notification
    plugins that logs the progress of your LSPs, in case something goes wrong. 

**Nice Utilities**:
- [`vim-fugitive`](https://github.com/tpope/vim-fugitive): A plugin that wraps
    around Git to allow for editing hunks straight in your Neovim session.
- [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim): A plugin that shows
    tracked Git changes in your sign columns. A nice visual that can help a lot when
    staging and commiting changes.
- [`vim-python-pep8-indent`](https://github.com/Vimjas/vim-python-pep8-indent):
    This is a plugin that correctly indents code on newlines (pressing `<CR>`).
- [`markview.nvim`](https://github.com/OXY2DEV/markview.nvim): A Markdown
    preview plugin.
- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim): A filesystem
    tree to for quick navigation. **NerdFonts** for your terminal is needed to load
    file icons.
- [`vim-airline`](https://github.com/vim-airline/vim-airline): A nice status bar
    to look at.
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): A plugin
    for searching stuff.
- [`rainbow-csv`](https://github.com/mechatroner/rainbow_csv): VS Code inspired
    RainbowCSV plugin. Plugin provides a nice way to differentiate between columns. 
- [`nvim-colorizer.lua`](https://github.com/norcalli/nvim-colorizer.lua): Basically
    a CSS color previewer. This is nice when doing a lot of colour configuration,
    e.g. configuring your colorscheme.
