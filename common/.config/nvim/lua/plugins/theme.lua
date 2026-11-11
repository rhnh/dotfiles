return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					flavour = "mocha",
				})

				vim.cmd.colorscheme("catppuccin")
			end,
		},
	},
	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					flavour = "latte",
					transparent_background = false,

					integrations = {
						treesitter = true,
						native_lsp = {
							enabled = true,
						},
						cmp = true,
						gitsigns = true,
						nvimtree = true,
						telescope = {
							enabled = true,
						},
					},
				})

				vim.cmd.colorscheme("catppuccin")
			end,
		},
	},
	{
		{
			"projekt0n/github-nvim-theme",
			name = "github-theme",
			priority = 1000,
			config = function()
				require("github-theme").setup({
					options = {
						transparent = false,
						styles = {
							comments = "italic",
							keywords = "bold",
						},
					},
				})

				vim.cmd.colorscheme("github_light")
			end,
		},
	},
	{
		"marekh19/meowsoot.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("meowsoot-dawn")
		end,
	},
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	},
}
