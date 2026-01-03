local function init_airline()
    local create = vim.fn["airline#section#create"]
    vim.g.airline_section_a = create({'mode', ' ', 'branch'})
    vim.g.airline_section_b = create({'hunks', '| ', 'file'})
    vim.g.airline_section_c = nil
end
vim.api.nvim_create_autocmd("User", {
    pattern = "AirlineAfterInit",
    callback = init_airline
})

return {
    {
        "vim-airline/vim-airline",
        dependencies = { "vim-airline/vim-airline-themes" },
        init = function()
            vim.g.airline_theme = "molokai"
            vim.g.airline_powerline_fonts = 1

            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"

            vim.g["airline#extensions#branch#enabled"] = 1
        end,
    },
}
