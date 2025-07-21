require("nvchad.configs.lspconfig").defaults()

local servers = { "rust", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
