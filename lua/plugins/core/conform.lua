return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<localleader>f",
			function()
				require("conform").format()
			end,
      desc = "Format the current buffer"
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			yaml = { "yamlfix" },
			json = { "jsonfix" },
			toml = { "tombi" },
		},
	},
}
