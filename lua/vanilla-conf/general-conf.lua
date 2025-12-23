vim.o.encoding = "utf-8"
vim.o.ignorecase = true -- ignore the case on tab complete

vim.o.termguicolors = true -- not set by default for some reason
vim.o.errorbells = false 
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.scrolloff = 5 -- num lines above/below cursor
vim.o.whichwrap = "<,>,[,]" -- wraps around the previous and next line

vim.o.mouse = "a"

-- softtab allows deleting tab char as a whole
-- shiftwidth is the num space to do autoindent (>> and <<) 
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true -- make tab char becomes space

-- delete over autoindent, eol and start of insert
vim.o.backspace = "indent,eol,start"

-- allow copy to clipboard (+ reg)
vim.o.clipboard = "unnamedplus"

-- a preview window when doing %s
vim.o.inccommand = "split"

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "2"

