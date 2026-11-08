return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = { "lua_ls", "jsonls" },
			automatic_enable = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- TypeScript 7 language server
			vim.lsp.config("tsc", {
				settings = {
					["js/ts"] = {
						inlayHints = {
							parameterNames = {
								enabled = "literals",
							},
							variableTypes = {
								enabled = false,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
						},
					},
				},
			})

			-- Lua language server
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Enable language servers
			vim.lsp.enable("tsc")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("jsonls")

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				severity_sort = true,
				float = { border = "rounded" },
			})
		end,
	},
}
