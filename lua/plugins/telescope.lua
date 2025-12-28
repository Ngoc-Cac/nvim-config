local function set_telescope_hl(event)
    if event.event ~= "ColorScheme"
        and event.data ~= "telescope.nvim" then
        return
    end

    local tel_bg = "#231c1c"
    local TelescopePrompt = {
        TelescopePromptBorder = { bg = tel_bg },
        TelescopePreviewBorder = { bg = tel_bg },
        TelescopeResultsBorder = { bg = tel_bg },
        TelescopePromptNormal = { bg = tel_bg },
        TelescopePreviewNormal = { bg = tel_bg },
        TelescopeResultsNormal = { bg = tel_bg },
        TelescopePromptTitle = { bg = tel_bg },
        TelescopePreviewTitle = { bg = tel_bg },
        TelescopeResultsTitle = { bg = tel_bg },
    }
    for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

local default_options = {
    winblend = 5,
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
}

return {
    "nvim-telescope/telescope.nvim", tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
        vim.api.nvim_create_autocmd({ "User", "ColorScheme" }, {
            callback = set_telescope_hl
        })
    end,
    config = function()
        require("telescope").setup({defaults = default_options})

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope list marks" })
        vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Telescope list colorscheme" })
        vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope list notify" })
    end
}
