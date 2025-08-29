require('options')
require('autocmds')
require('mappings')


vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim', 
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',  -- telescope dependency
  'https://github.com/Saghen/blink.cmp',
})


require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls'},
  automatic_installation = true
})

require('blink.cmp').setup({})
