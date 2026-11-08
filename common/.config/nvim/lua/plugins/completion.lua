return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = require("config.keymaps").blink,
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}
