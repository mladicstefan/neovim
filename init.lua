-- vim.pack.add (requires Neovim 0.12+)
vim.pack.add({
 { src = 'https://github.com/nvim-lua/plenary.nvim' },
 { src = 'https://github.com/nvim-telescope/telescope.nvim' },
 { src = 'https://github.com/neovim/nvim-lspconfig' },
 { src = 'https://github.com/saghen/blink.cmp' },
 { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
 { src = 'https://github.com/windwp/nvim-autopairs' },
})

vim.cmd.colorscheme('habamax')

require('options')
require('mappings')
require('autocmds')

local lspconfig = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()

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

lspconfig.rust_analyzer.setup({
    capabilities=capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = true,
        }
    },
})

lspconfig.basedpyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = ".venv/bin/python",
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

require('nvim-treesitter.configs').setup({
 ensure_installed = { "c", "cpp","rust","python","lua", "vim", "vimdoc", "query" },
 modules = {},
 ignore_install = {},
 sync_install = false,
 auto_install = true,
 highlight = {
   enable = true,
   additional_vim_regex_highlighting = false,
 },
 indent = {
   enable = true
 },
})

local autopairs = require('nvim-autopairs')
autopairs.setup({})
require('blink.cmp').setup({
  keymap = { 
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

local telescope = require('telescope')
telescope.setup({
 defaults = {
   file_ignore_patterns = { "%.o", "%.so", "%.a" },
 }
})

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
