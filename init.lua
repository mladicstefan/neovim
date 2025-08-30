require('options')
require('autocmds')
require('mappings')
-- Package management
vim.pack.add({
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/Saghen/blink.cmp',
})

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'rust_analyzer',
        'lua_ls', -- Fixed: was 'luaau_lsp'
    },
    automatic_installation = true
})

-- TreeSitter setup
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'rust', 'lua', 'vim', 'vimdoc' },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
})

require('blink.cmp').setup({
  keymap = { 
    preset = 'none',  -- Disable presets, use custom keymaps
    ['<C-Tab>'] = { 'accept', 'fallback' },  -- Leader+Tab to accept completion
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },  -- Force show menu or toggle docs
    ['<C-e>'] = { 'hide' },  -- Hide completion menu
    ['<C-n>'] = { 'select_next', 'fallback' },  -- Next completion item
    ['<C-p>'] = { 'select_prev', 'fallback' },  -- Previous completion item
    ['<C-k>'] = { 'show_documentation', 'hide_documentation' },  -- Toggle signature help
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },
  fuzzy = {
    implementation = "prefer_rust",
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    trigger = {
      signature_help = { enabled = true },
    },
  },
})


