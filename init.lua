-- vim.pack.add (requires Neovim 0.12+)
vim.pack.add({
 { src = 'https://github.com/nvim-lua/plenary.nvim' },
 { src = 'https://github.com/nvim-telescope/telescope.nvim' },
 { src = 'https://github.com/neovim/nvim-lspconfig' },
 { src = 'https://github.com/hrsh7th/nvim-cmp' },
 { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
 { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
 { src = 'https://github.com/windwp/nvim-autopairs' },
})

vim.cmd.colorscheme('habamax')
require('options')
require('mappings')
require('autocmds')

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

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
 ensure_installed = { "c", "cpp","rust", "lua", "vim", "vimdoc", "query" },
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

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()  -- Insert normal tab character
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_previous_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
})

-- Integrate autopairs with cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

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
