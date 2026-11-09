return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeClose",
	},
	opts = {
		view = {
			side = "right",
			width = 35,
		},
	},
}
