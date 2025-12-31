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

local function set_keymap()
    require("telescope").setup({})
    local keyset = vim.keymap.set

    local builtin = require("telescope.builtin")
    keyset("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    keyset("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    keyset("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Telescope buffers" })
    keyset("n", "<leader>fm", builtin.marks, { desc = "Telescope list marks" })
    keyset("n", "<leader>fc", builtin.colorscheme, { desc = "Telescope list colorscheme" })
    keyset("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope list notify" })

    keyset("n", "<leader>gg", builtin.git_status, { desc = "Telescope list Git status" })
    keyset("n", "<leader>gb", builtin.git_branches, { desc = "Telescope list Git branches" })
    keyset("n", "<leader>gc", builtin.git_commits, { desc = "Telescope list Git commits" })
    keyset("n", "<leader>gs", builtin.git_stash, { desc = "Telescope list Git stashes" })

    keyset("n", "<leader>jd", builtin.lsp_definitions, { desc = "Jump to definition" })
    keyset(
        "n", "<leader>jv", function()
            builtin.lsp_definitions({ jump_type = "vsplit" })
        end,
        { desc = "Jump to definition in vertical split" }
    )
end

return {
    "nvim-telescope/telescope.nvim", tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
        vim.api.nvim_create_autocmd({ "User", "ColorScheme" }, {
            callback = set_telescope_hl
        })
    end,
    config = set_keymap
}
