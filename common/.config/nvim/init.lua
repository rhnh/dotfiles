vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.o.guifont = "Dank Mono:h22"

vim.g.do_filetype_lua = 1

vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"

require("lazy").setup("plugins")

local last_colorscheme = "default"
print(vim.inspect(vim.g.colors_name))

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		last_colorscheme = vim.g.colors_name or "default"
	end,
})

vim.api.nvim_create_autocmd("VimResume", {
	callback = function()
		vim.defer_fn(function()
			vim.cmd.colorscheme(last_colorscheme)
			vim.cmd("redraw!")
		end, 100)
	end,
})
