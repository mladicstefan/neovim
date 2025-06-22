return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "pyright",
      "typescript-language-server", 
      "clangd",
      "lua-language-server",
      "black",
      "prettier",
      "stylua",
      "clang-format",
      "pylint",
      "mypy",
      "cpplint",
    })
  end,
}
