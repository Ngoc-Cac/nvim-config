local set = vim.keymap.set
local normal_types = { char = true, line = true, block = true }

local function backpsace_del()
    -- if at end of line: space -> normal -> "_cb
    -- else move right once, enter normal mode and replace backwards
    return (vim.fn.col(".") == vim.fn.col("$") and " " or "<right>") .. '<esc>"_cb'
end

function _G.trail_whitesp_del(type)
    local prev_reg = vim.fn.getreg("/")
    -- use '[ and '] in normal mode motions
    local range = normal_types[type] and "'[,']" or "'<,'>"

    -- substitute from start to end and then clear the highlighting
    vim.cmd(range .. [[s/\s\+$//e | nohl]])
    vim.fn.setreg("/", prev_reg)
end

-- ctrl-backspace in insert mode
set("i", "<c-h>", backpsace_del, { expr = true, desc = "Delete word backwards in insert mode" })

-- delete trailing whitespaces on selection
set({ "n", "x", "o" }, "<leader>c", function()
    vim.o.operatorfunc = "v:lua.trail_whitesp_del"
    return "g@"
end, { expr = true, desc = "Delete trailing whitespace" })
set("n", "<leader>cc", function()
    vim.o.operatorfunc = "v:lua.trail_whitesp_del"
    return "g@_"
end, { expr = true, desc = "Delete trailing whitespace for the current line" })

return { setup = function() end }
