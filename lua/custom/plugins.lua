local plugins = {
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    opts  = function()
      return require 'custom.configs.null-ls'
    end
  },
  {
    'neovim/nvim-lspconfig',
    config=function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
      auto_refresh = false,
      stay_on_this_version = true,
    },
  event = 'VeryLazy',
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        --- C++
        'clangd',
        'clang-format',
        --- TS STACK
        'typescript-language-server',
        'eslint_d',
        --- PYTHON
        'pyright',
        'black',
        'ruff',
        'mypy',
      }
    }
  }
}
return plugins
