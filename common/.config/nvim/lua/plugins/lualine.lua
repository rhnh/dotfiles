return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			icons_enabled = true,
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "filename" },
			lualine_x = {
				"diagnostics",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
