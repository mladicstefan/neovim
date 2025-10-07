local lspconfig = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- C/C++
lspconfig.clangd.setup({
 capabilities = capabilities,
 cmd = {
   'clangd',
   '--background-index',
   '--clang-tidy=false',
   '--completion-style=bundled',
   '--header-insertion=never',
 },
 filetypes = { 'c', 'cpp' },
})

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = true,
        }
    },
})

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Python
lspconfig.basedpyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
        pythonPath = vim.fn.exepath('python'),
    },
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      }
    },
  },
})

-- Bash
lspconfig.bashls.setup({
  capabilities = capabilities,
  filetypes = { 'sh', 'bash' },
})

-- Golang
lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
})

-- Svelte
lspconfig.svelte.setup({
  capabilities = capabilities,
  filetypes = { 'svelte' },
})

-- Typescript
lspconfig.ts_ls.setup({
  capabilities = capabilities,
})lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

-- Tailwind CSS
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'svelte', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
})

--Zig
lspconfig.zls.setup({
  capabilities = capabilities,
})

-- LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
 group = vim.api.nvim_create_augroup('UserLspConfig', {}),
 callback = function(ev)
   local opts = { buffer = ev.buf }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
   vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
   vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
 end,
})
