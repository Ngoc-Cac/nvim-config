return {
	"HakonHarnes/img-clip.nvim",
	cmd = "PasteImage",
  keys = {
    { "<localleader>p", ":PasteImage<cr>", desc = "Paste image from clipboard"}
  },
	opts = {
		default = {
			show_dir_path_in_prompt = true,
		},
    filetypes = {
      tex = { dir_path = "figures" }
    }
	},
}
