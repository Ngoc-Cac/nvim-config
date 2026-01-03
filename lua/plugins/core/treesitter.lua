local function bind_textobj_keymaps(select_module)
    vim.keymap.set({"x", "o"}, "av", function()
        select_module.select_textobject("@container.outer", "textobjects")
    end)
    vim.keymap.set({"x", "o"}, "iv", function()
        select_module.select_textobject("@container.inner", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "af", function()
        select_module.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
        select_module.select_textobject("@function.inner", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ac", function()
        select_module.select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ic", function()
        select_module.select_textobject("@class.inner", "textobjects")
    end)

    -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ "x", "o" }, "as", function()
        select_module.select_textobject("@local.scope", "locals")
    end)
end

local textobj_config = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
    },
    -- include_surrounding_whitespace = true,
}

return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            -- enable syntax highlighting with treesitter
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "python", "json" , "markdown"},
                callback = function() vim.treesitter.start() end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
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

