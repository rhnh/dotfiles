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
