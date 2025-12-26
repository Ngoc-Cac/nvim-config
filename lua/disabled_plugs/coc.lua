function _G.check_back_space()
    -- return true if there is no word (chars) before the cursor 
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand("<cword>")
    if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
    elseif vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
    end
end

-- tab to confirm, trigger completion or just tab
local function tab_action() 
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    elseif _G.check_back_space() then
        return "<C-g>u<Tab>"
    else
        return vim.fn["coc#refresh"]()
    end
end

-- cancel completion with esc
local function cancel_completion()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#cancel"]()
    else return "<Esc>" end
end

-- Use <c-j> to trigger snippets, needs coc-snippets extension
-- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

-- keyset("i", "<CR>", function()
--     if vim.fn["coc#pum#visible"]() == 1 then
--         return vim.fn["coc#pum#confirm"]()
--     else
--         return require("nvim-autopairs").autopairs_cr()
--     end
-- end, { expr = true })
return {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    keys = {
        {
            "<LocalLeader>d", "<CMD>lua _G.show_docs()<CR>",
            desc = "Show documentation for the current word."
        },
        {
            "<Tab>", tab_action, mode = { "i" }, expr = true,
            desc = "Confirm/Trigger completion with tab."
        },
        {
            "<Esc>", cancel_completion, mode = { "i" }, expr = true,
            desc = "Hide the completion panel."
        },
    }
}
