# My Neovim Configuration
This repository is where I keep track of my Neovim configuration,
in case if I make any oopsies; I can restore the previous history. 

## Installation note for future-self
### Terminal Configuration
Firstly, you need to install a Nerd Font. Some plugins use glyphs that
is only provided by Nerd Fonts. See [here](https://www.nerdfonts.com/font-downloads)
for some fonts. 

Secondly, make sure your terminal supports 256-color. It might be fine if your terminal
doesn't support this, won't look nice though.

### Getting Neovim
It's easy, just use a package manager or manually download one of the releases.
See [here](https://neovim.io/doc/install/) for more information.

Now, running `nvim` before installing any plugins will **definitely throw errors**,
because some plugins in this configuration requires some external configuration first.

### Configuration and Setting Up Plugins
Depends on the machine, clone this repository to the appropriate location. On Linux,
this will be `~/.config/nvim`. On Windows, this will be `~/AppData/Local/nvim`.

<details><summary><b>Installing <code>treesitter-nvim</code></b></summary>
  <p>
    To start, the most cumbersome plugin is <code>treesitter-nvim</code>, so it is
    best to get this out of the way first. The plugin requires <code>treesitter</code>
    (of course) and a C compiler. The installation of
    <a href="https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md">
      <code>treesitter</code></a> is straight-forward, the installation of the
    <a href="https://docs.rs/cc/latest/cc/#compile-time-requirements">C compiler</a>
    <b>can</b> be quite annoying.
  </p>
  <p>
    On Linux, several distributions are available, just download one and add them to your
    <code>PATH</code>. On Windows, this is a bit more complicated because it depends on
    your build environment. To check, run <code>echo $MSYSTEM</code>:
  </p>
  <ul>
    <li>
      If it doesn't print anything, your system needs the <code>msvc</code> compiler.
      This will require Visual Studio :(.
    </li>
    <li>Otherwise, install the <code>mingw</code> compiler.</li>
  </ul>
  <p>Based on this, just follow the installation guide for the correponding environment.</p>
</details>

> [!IMPORTANT]
> If your Windows uses the `msvc` compiler, you **MUST** install parsers within the Visual Studio's
Developer Command Prompt.
>
> This is because Visual Studio does not add the compiler to your `PATH` by default (you probably
shouldn't add it yourself either). This then cause `treesitter-nvim` to throw errors when running
`:TSInstall` (or `:TSUpdate`) because it won't be able to find the C compiler.

After this, installing `mason.nvim` should be prioritized. This plugin needs the following
[requirements](https://github.com/mason-org/mason.nvim?tab=readme-ov-file#requirements). With
`nvim-lspconfig` and `mason-lspconfig` installed as well, your LSP servers can now work.

Furthermore, if you intend to use `pyright` as a Python LSP server, then you also need to install
`node` and `npm`. Plugins like `markdown-preview.nvim` also require `npm` or `yarn`. 

Other than that, the rest should not need any manual set-up. 

## Plugins Used
These are listed in the order of dependency and usability. 

First and necessary plugin is of course:

- [`lazy.nvim`](https://github.com/folke/lazy.nvim): Plugin manager with lazy-loading support.
**Must install before any other plugins.**

And, this is the colorscheme used:

- [jellybeans.nvim](https://github.com/WTFox/jellybeans.nvim): A jellybeans theme with treesitter
  support.

<details><summary>&#10071<b>Must Have</b></summary>
  <ul>
    <li>
      <a href="https://github.com/mason-org/mason.nvim"><code>mason.nvim</code></a>:
      A package manager for LSP servers and more. I mainly use this for LSP support.
    </li>
    <li>
      <a href="https://github.com/neovim/nvim-lspconfig"><code>nvim-lspconfig</code></a>:
      A great helper to set up your LSP servers with no effort. 
    </li>
    <li>
      <a href="https://github.com/mason-org/mason-lspconfig.nvim"><code>mason-lspconfig.nvim</code></a>:
      This extends the <code>nvim-lspconfig</code> plugin with automatic enabling of installed LSP
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
      highlighting and enhanced text-objects.
    </li>
    <li>
      <a href="https://github.com/windwp/nvim-autopairs"><code>nvim-autopairs</code></a>:
      Auto-pairing when editing. This pretty much just speeds up the rest of the configuration
      for other plugins, so definitely needs to be installed right of the bat.
    </li>
  </ul>
</details>

<details><summary>&#127775<b>Highly Recommended</b></summary>
  <ul>
    <li>
      <a
        href="https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
      ><code>nvim-treesitter-textobjects</code></a>: Plugin for amazing syntactical text-objects.
    </li>
    <li>
      <a href="https://github.com/rmagatti/auto-session"><code>auto-session</code></a>:
      Just a super awesome plugins for managing workspaces.
    </li>
    <li>
      <a href="https://github.com/kevinhwang91/nvim-ufo"><code>nvim-ufo</code></a>:
      This is an enhanced code folding plugin which allows for LSP support.
    </li>
    <li>
      <a href="https://github.com/folke/flash.nvim"><code>flash.nvim</code></a>:
      An enhancement of the <code>f</code>, <code>F</code>, <code>t</code>, and
      <code>T</code> motions, allowing for teleportation across the file. 
    </li>
    <li>
      <a href="https://github.com/nvim-mini/mini.surround"><code>mini.surround</code></a>:
      This is a complementary plugin to the <code>nvim-autopairs</code> plugin, which allows for better
      quick wrapping and pair-edits.
    </li>
    <li>
      <a href="https://github.com/Wansmer/treesj"><code>treesj</code></a>:
      A plugin that splits and joins code using tree-sitter. This greatly speeds up editing
      when you need to reformat code.
    </li>
    <li>
      <a href="https://github.com/tpope/vim-fugitive"><code>vim-fugitive</code></a>:
      A plugin that wraps around the git command to allow for editing hunks straight in
      your Neovim session.
    </li>
    <li>
      <a href="https://github.com/lewis6991/gitsigns.nvim"><code>gitsigns.nvim</code></a>:
      A plugin that shows tracked Git changes in your sign columns. A nice visual
      that can help a lot when staging and commiting changes. It also also for diff preview
      and inline staging! 
    </li>
  </ul>
</details> 

<details><summary><b>Nice Utilities</b></summary>
  <ul>
    <li>
      <a href="https://github.com/stevearc/oil.nvim"><code>oil.nvim</code></a>:
      Editable buffer for interacting with your file system. This is a very versatile plugin. 
      <b>NerdFonts</b> for your terminal is needed to load file icons.
    </li>
    <li>
      <a href="https://github.com/nvim-telescope/telescope.nvim"><code>telescope.nvim</code></a>:
      A fuzzy finder which allow for quick search of pretty much everything. 
    </li>
    <li>
      <a href="https://github.com/Vimjas/vim-python-pep8-indent">
        <code>vim-python-pep8-indent</code></a>: This is a plugin that correctly indents
      code on newlines (pressing <code>&lt;CR&gt;</code>).
    </li>
    <li>
      <a href="https://github.com/j-hui/fidget.nvim"><code>fidget.nvim</code></a>:
      This is a nice notification plugins that logs the progress of your LSPs,
      in case something goes wrong. 
    </li>
    <li>
      <a href="https://github.com/numToStr/Comment.nvim"><code>Comment.nvim</code></a>:
      Code commenting with <code>gcc</code> and <code>gc[motion]</code> key mappings.
    </li>
    <li>
      <a href="https://github.com/OXY2DEV/markview.nvim"><code>markview.nvim</code></a>:
      A Markdown preview plugin. Great for quick testing.
    </li>
    <li>
      <a href="https://github.com/iamcco/markdown-preview.nvim">
        <code>markdown-preview.nvim</code></a>: A web-based Markdown preview plugin.
      This can be nice if you are testing some Markdown that is pushed to some remote
      source like GitHub.
    </li>
    <li>
      <a href="https://github.com/jake-stewart/multicursor.nvim"><code>multicursor.nvim</code></a>:
      A plugin for multicursor editing. I rarely use this, but it does come in very handy
      when I neeed it.
    </li>
  </ul>
</details> 

<details><summary><b>UI Plugins</b></summary>
  <ul>
    <li>
      <a href="https://github.com/vim-airline/vim-airline"><code>vim-airline</code></a>:
      A nice status bar to look at.
    </li>
    <li>
      <a href="https://github.com/rcarriga/nvim-notify"><code>nvim-notify</code></a>:
      A plugin for beautiful and animated notification.
    </li>
    <li>
      <a href="https://github.com/karb94/neoscroll.nvim"><code>neoscroll.nvim</code></a>:
      A plugin to animate your scrolling. I have this because it's smoother and less
      dis-orientating when I do a lot of <code>&lt;C-d&gt;</code> and <code>&lt;C-u&gt;</code>
    </li>
  </ul>
</details> 

<details><summary><b>Visual Guides</b></summary>
  <ul>
    <li>
      <a href="https://github.com/hat0uma/csvview.nvim"><code>csvview.nvim</code></a>:
      A plugin that that makes your csv files look like literal tables, with cells.
      This also providees text-objects too! 
    </li>
    <li>
      <a href="https://github.com/folke/which-key.nvim"><code>which-key.nvim</code></a>:
      A plugin that shows you the available key-mappings as you type. A very nice thing to
      have if you don't remember things well.
    </li>
    <li>
      <a href="https://github.com/lukas-reineke/indent-blankline.nvim">
        <code>indent-blankline.nvim</code></a>: Basically what its name said, it's an
      identation guide. 
    </li>
    <li>
      <a href="https://github.com/catgoose/nvim-colorizer.lua"><code>nvim-colorizer.lua</code></a>:
      Basically a CSS color previewer. This is nice when doing a lot of colour configuration,
      e.g., configuring your colorscheme.
    </li>
  </ul>
</details> 
