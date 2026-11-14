local map = vim.keymap.set
local M = {}

---------------------------------------------------------------------
-- GENERAL
---------------------------------------------------------------------
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })
map("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- keep selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

--open key binds
map("n", "<leader>ek", "<cmd>edit ~/.config/nvim/lua/config/keymaps.lua<CR>", {
	desc = "Edit keybindings",
})

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
map("n", "<M-k>", "<cmd>resize +2<CR>", { desc = "Increase split height" })
map("n", "<M-j>", "<cmd>resize -2<CR>", { desc = "Decrease split height" })
map("n", "<M-h>", "<cmd>vertical resize -2<CR>", { desc = "Decrease split width" })
map("n", "<M-l>", "<cmd>vertical resize +2<CR>", { desc = "Increase split width" })

-- tree
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
	desc = "Toggle file explorer",
})
---------------------------------------------------------------------
-- PLUGINS (each call lazy-loads the plugin on first use)
---------------------------------------------------------------------
-- Telescope
local function tb(fn, opts)
	return function()
		require("telescope.builtin")[fn](opts)
	end
end
map("n", "<leader>ff", tb("find_files"), { desc = "Find files" })
map("n", "<leader>fg", tb("live_grep"), { desc = "Grep" })
map("n", "<leader>fb", tb("buffers"), { desc = "Buffers" })
map("n", "<leader>fh", tb("help_tags"), { desc = "Help" })
map("n", "<leader>fr", tb("oldfiles"), { desc = "Recent files" })
map("n", "<leader>fd", tb("diagnostics"), { desc = "Diagnostics" })
map("n", "<leader>fs", tb("lsp_document_symbols"), { desc = "Symbols" })
map("n", "<leader>fa", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("~"),
		find_command = {
			"fdfind",
			"--type",
			"f",
			"--hidden",
			"--exclude",
			".git",
			"--exclude",
			"node_modules",
			"--exclude",
			".cache",
			"--exclude",
			".local/share",
		},
	})
end, { desc = "Find files in home directory" })
-- copy and paste
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Formatting (conform)
map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format" })

---------------------------------------------------------------------
-- LSP (buffer-local, set when a server attaches)
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeys", { clear = true }),
	callback = function(ev)
		local function lmap(keys, fn, desc, mode)
			map(mode or "n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
		end
		local b = vim.lsp.buf

		lmap("gd", b.definition, "Go to definition")
		lmap("gD", b.declaration, "Go to declaration")
		lmap("gi", b.implementation, "Go to implementation")
		lmap("gy", b.type_definition, "Go to type definition")
		lmap("gr", b.references, "References")
		lmap("K", b.hover, "Hover docs")
		lmap("<C-s>", b.signature_help, "Signature help", "i")
		lmap("<leader>rn", b.rename, "Rename symbol")
		lmap("<leader>ca", b.code_action, "Code action", { "n", "v" })
		lmap("<leader>co", function()
			b.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
		end, "Organize imports")
		lmap("<leader>cR", function()
			b.code_action({ context = { only = { "source.removeUnused.ts" } }, apply = true })
		end, "Remove unused imports")
		lmap("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
		lmap("[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Prev diagnostic")
		lmap("]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Next diagnostic")
		-- Import missing functions
		lmap("<leader>ci", function()
			b.code_action({
				context = {
					only = { "quickfix" },
				},
			})
		end, "Import missing symbols")
	end,
})

-- Git
map("n", "<leader>gg", "<cmd>Git<CR>", {
	desc = "Git status",
})

map("n", "<leader>gc", "<cmd>Git commit<CR>", {
	desc = "Git commit",
})

map("n", "<leader>gp", "<cmd>Git push<CR>", {
	desc = "Git push",
})

map("n", "<leader>gb", "<cmd>Git blame<CR>", {
	desc = "Git blame",
})
---------------------------------------------------------------------
-- COMPLETION (consumed by plugins/completion.lua)
---------------------------------------------------------------------
M.blink = {
	preset = "none",
	["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
	["<C-e>"] = { "hide" },
	["<CR>"] = { "accept", "fallback" },
	["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
	["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	["<C-n>"] = { "select_next", "fallback" },
	["<C-p>"] = { "select_prev", "fallback" },
	["<C-b>"] = { "scroll_documentation_up", "fallback" },
	["<C-f>"] = { "scroll_documentation_down", "fallback" },
}

return M
