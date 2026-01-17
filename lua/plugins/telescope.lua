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

local function config()
    local telescope = require("telescope")
    telescope.setup({
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        }
    })
    telescope.load_extension("ui-select")
end

return {
    "nvim-telescope/telescope.nvim", tag = "v0.2.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim"
    },
    cmd = "Telescope",
    keys = {
        { "<leader>fb", ":Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>ff", ":Telescope find_files<cr>", desc = "Files" },
        { "<leader>fr", ":Telescope registers<cr>", desc = "Registers" },
        { "<leader>fm", ":Telescope marks<cr>", desc = "Marks" },
        { "<leader>fd", ":Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>fg", ":Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fn", ":Telescope notify<CR>", desc = "Notification" },

        { "grd", ":Telescope lsp_definitions<cr>", desc = "Jump to definition"},
        {
            "grv", function()
                require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
            end, desc = "Jump to definition in vertical split",
        },
    },
    init = function()
        vim.api.nvim_create_autocmd({ "User", "ColorScheme" }, {
            callback = set_telescope_hl
        })
    end,
    config = config
}
