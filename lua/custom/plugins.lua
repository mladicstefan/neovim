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
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        }
      },
      ensure_installed = {

        --- c++
        'clangd',
        'clang-format',

        --- ts stack
        'typescript-language-server',
        'tailwindcss-language-server',
        'eslint-lsp',
        'prettierd',

        --- python
        'pyright',
        'black',
        'ruff',
        'mypy',
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function()
      opts = require'plugins.configs.treesitter'
      opts.ensure_installed = {
        'typescript',
        'javascript',
        'tsx',
        'python',
        'cpp',
        'html',
        'css',
        'lua',
      }
    return opts
    end
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
    config = function ()
    end
  },
}
return plugins
