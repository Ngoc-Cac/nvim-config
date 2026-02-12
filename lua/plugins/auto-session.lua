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
    auto_restore_last_session = true,
    bypass_save_filetypes = { "terminal", "netrw" },
    session_lens = {
      picker = "telescope",
      picker_opts = { previewer = true },
      previewer = "summary"
    }
	},
}
