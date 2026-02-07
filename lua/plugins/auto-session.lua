return {
	"rmagatti/auto-session",
	lazy = false,
  keys = {
    { "<localleader>ss", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<localleader>sd", "<cmd>AutoSession deletePicker<CR>", desc = "Session delete" },
    { "<localleader>sc", "<cmd>AutoSession save ", desc = "Session save" },
  },
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
    auto_create = false,
    auto_save = true,
    auto_restore_last_session = true,
    bypass_save_filetypes = { "terminal", "netrw" },
    session_lens = {
      picker = "telescope",
      picker_opts = { previewer = true },
      previewer = "summary"
    }
	},
}
