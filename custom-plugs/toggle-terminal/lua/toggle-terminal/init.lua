local terminal_core = require("toggle-terminal.core")

local function cmdline_complete(ArgLead, _, _)
  local directions = { 'float', 'above', 'below', 'left', 'right' }

  if ArgLead == '' then return directions end

  return vim.tbl_filter(function(val)
    return vim.startswith(val, ArgLead)
  end, directions)
end

local function setup(opts)
  opts = opts or {}
  terminal_core.config = vim.tbl_deep_extend("force", terminal_core.config, opts)
end

vim.api.nvim_create_user_command(
  "ToggleTerm", function(opts) terminal_core.toggle_term(opts.args) end,
  { nargs = 1, complete = cmdline_complete }
)
return { setup = setup, toggle_term = terminal_core.toggle_term }
