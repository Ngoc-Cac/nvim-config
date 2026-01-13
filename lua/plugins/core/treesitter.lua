local function bind_textobj_keymaps(select_module)
    local keyset = vim.keymap.set
    local select = select_module.select_textobject

    keyset({"x", "o"}, "av", function() select("@container.outer", "textobjects") end)
    keyset({"x", "o"}, "iv", function() select("@container.inner", "textobjects") end)

    keyset({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end)
    keyset({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end)

    keyset({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end)
    keyset({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end)

    keyset({ "x", "o" }, "as", function() select("@local.scope", "locals") end)
end

local textobj_config = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'v', -- linewise
    },
}

return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile", "VeryLazy" },
        build = ':TSUpdate',
        config = function()
            -- enable syntax highlighting with treesitter
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "python",
                    "markdown",
                    "json", "yaml", "toml",
                },
                callback = function() vim.treesitter.start() end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        config = function()
            -- configuration
            require("nvim-treesitter-textobjects").setup {
                select = textobj_config,
                move = { enable = true }
            }
            bind_textobj_keymaps(require("nvim-treesitter-textobjects.select"))
        end
    }
}

