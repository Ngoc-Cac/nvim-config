local tel_bg = "#231c1c"
local tel_fg = {
    prompt = "#3fb75b",
    preview = "#d68d46",
    results = "#536ee4"
}
local function set_telescope_hl()
    local TelescopePrompt = {
        TelescopePromptBorder  = { bg = tel_bg, fg = tel_fg["prompt"] },
        TelescopePreviewBorder = { bg = tel_bg, fg = tel_fg["preview"] },
        TelescopeResultsBorder = { bg = tel_bg, fg = tel_fg["results"] },

        TelescopePromptNormal  = { bg = tel_bg },
        TelescopePreviewNormal = { bg = tel_bg },
        TelescopeResultsNormal = { bg = tel_bg },

        TelescopePromptTitle  = { bold = true, bg = tel_bg, fg = tel_fg["prompt"] },
        TelescopePreviewTitle = { bold = true, bg = tel_bg, fg = tel_fg["preview"] },
        TelescopeResultsTitle = { bold = true, bg = tel_bg, fg = tel_fg["results"] },
    }
    for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

local function config()
    set_telescope_hl()

    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            initial_mode = "normal",
            results_title = false,
            scroll_strategy = "limit",
            sorting_strategy = "ascending",
            dynamic_preview_title = true,
            layout_config = {
                prompt_position = "top",
                width = .85
            },
            mappings = {
                n = { ["<esc>"] = require("telescope.actions").close }
            }
        },
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({})
            }
        }
    })
    telescope.load_extension("ui-select")
end

return {
    "nvim-telescope/telescope.nvim",
    version = "*",
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
        { "<leader>fh", ":Telescope help_tags<cr>", desc = "Pick help tags" },
        { "<leader>fn", ":Telescope notify<CR>", desc = "Notification" },

        { "grd", ":Telescope lsp_definitions<cr>", desc = "Jump to definition"},
        {
            "grv", function()
                require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
            end, desc = "Jump to definition in vertical split",
        },
    },
    init = function()
        -- wizardry lazy-loading for the nice ui.
        -- This will lazy-load telescope on vim.ui.select
        local original_ui_sel = vim.ui.select
        vim.ui.select = function(...)
            vim.ui.select = original_ui_sel
            require("telescope") -- make telescope load the ui-select extension 
            vim.ui.select(...)
        end
    end,
    config = config
}
