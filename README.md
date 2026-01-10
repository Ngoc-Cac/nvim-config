# My Neovim Configuration
This repository is where I keep track of my Neovim configuration,
in case if I make any oopsies, I can restore the previous history. 

It is also to share my configuration in case someone wants to use it.

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
