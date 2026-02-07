local opt = vim.opt

opt.encoding = "utf-8"
opt.ignorecase = true -- ignore the case on tab complete, search, etc.
opt.smartcase = true -- if pattern has uppercase char, respect it
opt.updatetime = 500

opt.termguicolors = true -- not set by default for some reason
opt.errorbells = false
opt.wrap = false

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 5 -- num lines above/below cursor
opt.whichwrap = "<,>,[,]" -- wraps around the previous and next line

opt.mouse = "a"

-- softtab allows deleting tab char as a whole
-- shiftwidth is the num space to do autoindent (>> and <<) 
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.expandtab = true -- make tab char becomes space

-- delete over autoindent, eol and start of insert
opt.backspace = "indent,eol,start"

-- allow copy to clipboard (+ reg)
opt.clipboard = "unnamedplus"

-- a preview window when doing %s
opt.inccommand = "split"

opt.fillchars = {
    horiz = "━", horizup = "┻", horizdown = "┳",
    vert = "┃", vertleft = "┫", vertright = "┣", verthoriz = "╋",
    fold = " ", foldopen = "˅", foldclose = ">",
}

opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "2"
