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

      dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = {"nvim-lua/plenary.nvim" } },
    },
    ---@type venv-selector.Config
    opts = {
        branch = "regexp",
        stay_on_this_version = true,
      },
    event = 'VeryLazy',
    keys = {
        { ',v', '<cmd>VenvSelect<cr>' },
      },
  },
  {
    'williamboman/mason.nvim',
    opts = {
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
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require"plugins.configs.treesitter"
      opts.ensure_installed = {
        "typescript",
        "javascript",
        "tsx",
        "python",
        "cpp",
      }
    return opts
    end
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
    end
  },
}
return plugins
