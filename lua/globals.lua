vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- registering all tex file as tex, so treesitter can parse it
vim.g.tex_flavor = "tex"

if vim.fn.has("win32") == 1 then
  vim.o.shell = "cmd.exe"  -- need this for img-clip to work
  -- define a default clipboard provider so nvim doesn't source clipboard.vim 
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ["+"] = 'win32yank.exe -i --crlf',
      ["*"] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ["+"] = 'win32yank.exe -o --lf',
      ["*"] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
elseif vim.env.SSH_TTY then
  local function get_clipboard() return { vim.fn.getreg('"', 1, true) } end

  -- emit osc52 escape codes over ssh session so we can forward clipboards
  local osc52 = require('vim.ui.clipboard.osc52')
  vim.g.clipboard = {
    name = 'osc52',
    copy = { ['+'] = osc52.copy('+'), ['*'] = osc52.copy('*') },
    paste = { ["+"] = get_clipboard, ["*"] = get_clipboard },
  }
end
