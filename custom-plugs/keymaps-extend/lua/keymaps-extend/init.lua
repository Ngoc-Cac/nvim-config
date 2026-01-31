local set = vim.keymap.set

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
  opts = opts or {}

  ws_del_setup()

  -- ctrl-backspace in insert mode
  set(
    "i", "<c-h>",
    require("keymaps-extend.ctrl-backspace").backspace_del,
    { expr = true, desc = "Delete word backwards in insert mode" }
  )

end

return { setup = setup }
