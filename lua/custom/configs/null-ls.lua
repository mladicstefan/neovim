local null_ls = require('null-ls')

local opts = {
  sources = {
    -- Python tools
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    
    -- C/C++ tools  
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({
        group = vim.api.nvim_create_augroup('LspFormatting', {}),
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatting', {}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
        end,
      })
    end
  end,
}

return opts
