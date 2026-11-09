--[[return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}

return {
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
}


return {
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
}
]]

return {
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
}
