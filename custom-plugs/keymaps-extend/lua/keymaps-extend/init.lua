local set = vim.keymap.set
local config = {
  trailing_whitespace_del = true,
  ctrl_backspace_del = true
}

local function ws_del_setup()
  _G.trail_whitesp_del = require("keymaps-extend.trail-whitesp").trail_whitesp_del

  -- delete trailing whitespaces on selection
  set({ "n", "x", "o" }, "<leader>c", function()
    vim.o.operatorfunc = "v:lua.trail_whitesp_del"
    return "g@"
  end, { expr = true, desc = "Delete trailing whitespace" })
  set("n", "<leader>cc", function()
    vim.o.operatorfunc = "v:lua.trail_whitesp_del"
    return "g@_"
  end, { expr = true, desc = "Delete trailing whitespace for the current line" })
end

local function setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})

  if config.trailing_whitespace_del then ws_del_setup() end

  if config.ctrl_backspace_del then
    set(
      "i", "<c-h>",
      require("keymaps-extend.ctrl-backspace").backspace_del,
      { expr = true, desc = "Delete word backwards in insert mode" }
    )
  end
end

return { setup = setup }
