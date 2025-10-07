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
require('lsp')

require('nvim-treesitter.configs').setup({
 ensure_installed = {
  "c", "cpp", "rust", "python", "go", "lua", "vim", "vimdoc", "query",
  "svelte", "javascript", "typescript", "html", "css","zig"
 },
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
