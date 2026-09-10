return {
	"rmagatti/auto-session",
	lazy = false,
  keys = {
    { "<localleader>ss", ":AutoSession search<CR>", desc = "Session search" },
    { "<localleader>sd", ":AutoSession deletePicker<CR>", desc = "Session delete" },
    { "<localleader>sc", ":AutoSession save ", desc = "Session save" },
  },
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/Downloads", "/" },
    auto_create = false,
    auto_save = true,
    auto_restore = false,
    auto_restore_last_session = false,
    bypass_save_filetypes = { "terminal", "netrw", "fugitive", "oil" },
    close_filetypes_on_save = { "checkhealth", "terminal", "netrw", "fugitive", "oil" },
    session_lens = {
      picker = "telescope",
      load_on_setup = false,  -- don't load telescope automatically on startup
      picker_opts = { previewer = true },
      previewer = "summary"
    }
	},
  config = function(opts)
    require("auto-session").setup(opts)
    vim.api.nvim_create_autocmd("VimEnter", {
      group = "UtilAutoCmd",
      nested = true, -- allow nested autocmds
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local is_blank_buf = bufname == "" and #lines == 1 and lines[1] == ""

        if
          vim.fn.argc() ~= 0 or
          not is_blank_buf or
          #vim.api.nvim_list_wins() > 1 or
          vim.uv.guess_handle(0) == "pipe"
          then
            return
        end

        vim.schedule(function() vim.cmd("AutoSession search") end)
      end,
    })
  end
}
