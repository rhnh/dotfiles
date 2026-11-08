return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "typescript", "tsx", "javascript", "json", "html", "css", "lua", "markdown",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact",
                  "json", "html", "css", "lua", "markdown" },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
