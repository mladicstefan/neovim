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
  opts = {},
  event = 'VeryLazy',
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
