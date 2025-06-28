local base = require('plugins.configs.lspconfig')
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- C++
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server.capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
-- TypeScript and ESLint
local ts_servers = { "tsserver", "eslint" }
for _, lsp in ipairs(ts_servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if lsp == "tsserver" then
    opts.root_dir = util.root_pattern("package.json", "tsconfig.json", ".git")
  end
  lspconfig[lsp].setup(opts)
end

-- TailwindCSS
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

--PYTHON
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' },
  root_dir = util.root_pattern('.git', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt'),
  before_init = function(_, config)
    config.settings = config.settings or {}
    config.settings.python = config.settings.python or {}
    config.settings.python.pythonPath = '/home/djamla/anaconda3/bin/python'
  end,
})
