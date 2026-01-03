vim.opt.encoding = "utf-8"
vim.opt.ignorecase = true -- ignore the case on tab complete, search, etc.
vim.opt.smartcase = true -- if pattern has uppercase char, respect it

vim.opt.termguicolors = true -- not set by default for some reason
vim.opt.errorbells = false
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 5 -- num lines above/below cursor
vim.opt.whichwrap = "<,>,[,]" -- wraps around the previous and next line

vim.opt.mouse = "a"

-- softtab allows deleting tab char as a whole
-- shiftwidth is the num space to do autoindent (>> and <<) 
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true -- make tab char becomes space

-- delete over autoindent, eol and start of insert
vim.opt.backspace = "indent,eol,start"

-- allow copy to clipboard (+ reg)
vim.opt.clipboard = "unnamedplus"

-- a preview window when doing %s
vim.opt.inccommand = "split"

vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
    fold = " ",
    foldopen = "˅",
    foldclose = ">",
}

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "2"

-- show lsp diagnostics as virtual line
vim.diagnostic.config({
    virtual_lines = true
})

