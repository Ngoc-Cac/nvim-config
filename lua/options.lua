local options = {
  termguicolors = true,
  errorbells = false,
  updatetime = 500,
  encoding = "utf-8",
  clipboard = "unnamedplus",
  mouse = "a",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions",

  number = true,
  relativenumber = true,
  ignorecase = true, -- ignore the case on tab complete, search, etc.
  smartcase = true, -- if pattern has uppercase char, respect it

  cursorline = true,
  cursorlineopt = "number",
  splitbelow = true,
  splitright = true,

  scrolloff = 5, -- num lines above/below cursor
  wrap = false, -- no line wrapping
  whichwrap = "<,>,[,]", -- wraps around the previous and next line

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  smartindent = true,
  expandtab = true, -- make tab char becomes space

  backspace = "indent,eol,start",
  inccommand = "split", -- a preview window when doing s

  fillchars = {
      horiz = "━", horizup = "┻", horizdown = "┳",
      vert = "┃", vertleft = "┫", vertright = "┣", verthoriz = "╋",
      fold = " ", foldopen = "˅", foldclose = ">",
  },
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  foldcolumn = "2",
}

local vim_opts = vim.opt
for opt, val in pairs(options) do
  vim_opts[opt] = val
end
