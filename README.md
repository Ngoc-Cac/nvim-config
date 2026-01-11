# My Neovim Configuration
This repository is where I keep track of my Neovim configuration,
in case if I make any oopsies, I can restore the previous history. 

It is also to share my configuration in case someone wants to use it.

## Installation
### Getting Neovim
It's easy, just use a package manager or download one of the releases.
See [here](https://neovim.io/doc/install/) for more information.

### Terminal Configuration
First, you need to install a Nerd Font. Some plugins use glyphs that
is only provided by Nerd Fonts. See [here](https://www.nerdfonts.com/font-downloads)
for some fonts. 

Secondly, make sure your terminal supports 256 color. It might be fine if your terminal
doesn't support this, won't look nice though.

### Configuration and Setting Up Plugins
Depends on the machine, clone this to the appropriate location. On Linux,
this will be `~/.config/nvim`. On Windows, this will be `~/AppData/Local/nvim`.

Now, running `nvim` before installing any plugins will definitely throw errors,
because some plugins in this configuration requires some external configuration first.

To start, the most cumbersome plugin is `treesitter-nvim`, so it is best to get
this out of the way first. The plugin requires `treesitter` (of course) and a C compiler.
The installation of [`treesitter`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
is straight-forward, the installation of the [C compiler](https://docs.rs/cc/latest/cc/#compile-time-requirements)
*can* be quite annoying.

On Linux, several distributions are available, just download one and add them to your
`PATH`. On Windows, this is a bit more complicated because it depends on your build
environment. To check, run `echo $MSYSTEM`:
- If it doesn't print anything, your system needs the `msvc` compiler. This will require
    Visual Studio :(.
- Otherwise, install the `mingw` compiler.
Based on this, just follow the installation guide for the correponding environment.

If your Windows uses the `msvc` compiler, you MUST install parsers within the Visual Studio's
Developer Command Prompt. This is because Visual Studio does not add the compiler to your
`PATH` by default (you probably shouldn't add it yourself either); this then cause
`treesitter-nvim` to throw errors when running `:TSInstall` (or `:TSUpdate`) because it can't
find the C compiler.

After this, installing `mason.nvim` should be prioritized. This plugin needs the following
[requirements](https://github.com/mason-org/mason.nvim?tab=readme-ov-file#requirements).
Furthermore, if you intend to use `pyright` as a Python LSP server, then you also need to install
`node` and `npm`.

Other than that, the rest should be relatively straight-forward.

## Plugins Used
These are listed in the order of dependency and usability. 

<!--
<details>
    <summary></summary>
    <ul>
        <li>
            <a href=""><code></code></a>:
        </li>
    </ul>
</details> 
-->

<details>
    <summary>Must Have</summary>
    <ul>
        <li>
            <a href="https://github.com/folke/lazy.nvim"><code>lazy.nvim</code></a>:
            Plugin manager with lazy-loading support. **Must install before any other plugins.**
        </li>
        <li>
            <a href="https://github.com/mason-org/mason.nvim"><code>mason.nvim</code></a>:
            A package manager for LSP servers and more. I mainly use this for LSP support.
        </li>
        <li>
            <a href="https://github.com/mason-org/mason-lspconfig.nvim"><code>mason-lspconfig.nvim</code></a>:
            This extends the `mason.nvim` plugin with automatic enabling of installed LSP
            servers, so you don't have to manually enable it in your config anymore.
        </li>
        <li>
            <a href="https://github.com/folke/lazydev.nvim"><code>lazydev.nvim</code></a>:
            This is an enhanced Lua LSP server which can recognizes your Neovim configuration.
            This is very useful during configuration with the code analysis.
        </li>
        <li>
            <a href="https://github.com/saghen/blink.cmp"><code>blink.cmp</code></a>:
            Completion engine that uses multiple sources to give suggestions.
        </li>
        <li>
            <a href="https://github.com/nvim-treesitter/nvim-treesitter"><code>nvim-treesitter</code></a>:
            Plugin for managing tree-sitter parsers. I am mainly using this for syntax
            highlighting and text-objects support.
        </li>
        <li>
            <a href="https://github.com/tpope/vim-commentary"><code>vim-commentary</code></a>:
        </li>
        <li>
            <a href="https://github.com/tpope/vim-commentary"><code>vim-commentary</code></a>:
            Code commenting with `gcc` and `gc<motion>` key mappings. Very nice to use
            during configuration when you want to test out some stuff.
        </li>
        <li>
            <a href="https://github.com/windwp/nvim-autopairs"><code>nvim-autopairs</code></a>:
            Auto-pairing when editing. This pretty much just speeds up the rest of the configuration
            for other plugins, so definitely needs to be installed right of the bat.
        </li>
    </ul>
</details>

<details>
    <summary>Highly Recommended</summary>
    <ul>
        <li>
            <a href="https://github.com/nvim-treesitter/nvim-treesitter-textobjects">
                <code>nvim-treesitter-textobjects</code>
            </a>: Plugin for amazing syntactical text-objects.
        </li>
        <li>
            <a href="https://github.com/Shatur/neovim-session-manager"><code>neovim-session-manager</code></a>:
            This plugins builds upon Neovim's builtin `:mksession` and handles all of the session saving
            and loading in an **organised** fashion (it saves to one directory that is).
        </li>
        <li>
            <a href="https://github.com/kevinhwang91/nvim-ufo"><code>nvim-ufo</code></a>:
            This is an enhanced code folding plugin which allows for LSP support.
        </li>
        <li>
            <a href="https://github.com/folke/flash.nvim"><code>flash.nvim</code></a>:
            An enhancement of the `f`, `F`, `t`, and `T` motions, allowing for teleportation
            across the file. 
        </li>
        <li>
            <a href="https://github.com/nvim-mini/mini.surround"><code>mini.surround</code></a>:
            This is a complementary plugin to the `nvim-autopairs` plugin, which allows for better
            quick wrapping and pair-edits.
        </li>
    </ul>
</details> 

<details>
    <summary>Cool Plugs</summary>
    <ul>
        <li>
            <a href="https://github.com/WTFox/jellybeans.nvim"><code>jellybeans.nvim</code></a>:
            A jellybeans theme with treesitter support.
        </li>
        <li>
            <a href="https://github.com/rcarriga/nvim-notify"><code>nvim-notify</code></a>:
            A plugin for beautiful and animated notification.
        </li>
        <li>
            <a href="fidget.nvim"><code>https://github.com/j-hui/fidget.nvim</code></a>:
            This is a nice notification plugins that logs the progress of your LSPs,
            in case something goes wrong. 
        </li>
    </ul>
</details> 

<details>
    <summary>Nice Utilities</summary>
    <ul>
        <li>
            <a href="https://github.com/tpope/vim-fugitive"><code>vim-fugitive</code></a>:
            A plugin that wraps around Git to allow for editing hunks straight in your Neovim session.
        </li>
        <li>
            <a href="https://github.com/lewis6991/gitsigns.nvim"><code>gitsigns.nvim</code></a>:
            A plugin that shows tracked Git changes in your sign columns. A nice visual
            that can help a lot when staging and commiting changes.
        </li>
        <li>
            <a href="https://github.com/Vimjas/vim-python-pep8-indent">
                <code>vim-python-pep8-indent</code>
            </a>: This is a plugin that correctly indents code on newlines (pressing `<CR>`).
        </li>
        <li>
            <a href="https://github.com/OXY2DEV/markview.nvim"><code>markview.nvim</code></a>:
            A Markdown preview plugin.
        </li>
        <li>
            <a href="https://github.com/vim-airline/vim-airline"><code>vim-airline</code></a>:
            A nice status bar to look at.
        </li>
        <li>
            <a href="https://github.com/nvim-telescope/telescope.nvim"><code>telescope.nvim</code></a>:
            A fuzzy finder which allow for quick search of pretty much everything. 
        </li>
        <li>
            <a href="https://github.com/mechatroner/rainbow_csv"><code>rainbow-csv</code></a>:
            VS Code inspired RainbowCSV plugin. Plugin provides a nice way to differentiate
            between columns. 
        </li>
        <li>
            <a href="https://github.com/norcalli/nvim-colorizer.lua"><code>nvim-colorizer.lua</code></a>:
            Basically a CSS color previewer. This is nice when doing a lot of colour configuration,
            e.g., configuring your colorscheme.
        </li>
        <li>
            <a href="https://github.com/nvim-neo-tree/neo-tree.nvim"><code>neo-tree.nvim</code></a>:
            A filesystem tree to for quick navigation. **NerdFonts** for your terminal is needed to load
            file icons.
        </li>
    </ul>
</details> 
