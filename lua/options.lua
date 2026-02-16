local options = {
  termguicolors = true, -- not set by default for some reason
  errorbells = false,
  updatetime = 500,
  encoding = "utf-8",
  clipboard = "unnamedplus",
  mouse = "a",

  number = true,
  relativenumber = true,
  ignorecase = true, -- ignore the case on tab complete, search, etc.
  smartcase = true, -- if pattern has uppercase char, respect it
  wrap = false,

  cursorline = true,
  cursorlineopt = "number",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions",
  splitbelow = true,
  splitright = true,

  scrolloff = 5, -- num lines above/below cursor
  whichwrap = "<,>,[,]", -- wraps around the previous and next line

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  smartindent = true,
  expandtab = true, -- make tab char becomes space

  backspace = "indent,eol,start",
  -- a preview window when doing s
  inccommand = "split",

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
