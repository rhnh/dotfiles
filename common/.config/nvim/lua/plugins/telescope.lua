return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local t = require("telescope")
    t.setup({ defaults = { file_ignore_patterns = { "node_modules", "%.git/" } } })
    pcall(t.load_extension, "fzf")
  end,
}