-- vim.pack.add (requires Neovim 0.12+)
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/uhs-robert/oasis.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/MrcJkb/haskell-tools.nvim" },
})

vim.o.background = "dark"
vim.cmd.colorscheme("oasis-abyss")

require("mason").setup()
require("haskell")

local mason_ensure = require("mason-ensure")
mason_ensure.ensure_installed()

vim.api.nvim_create_user_command("MasonCheckStatus", function()
	require("mason-ensure").check_status()
end, {})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"rust_analyzer",
		"basedpyright",
		"bashls",
		"gopls",
		"svelte",
		"ts_ls",
		"tailwindcss",
		"zls",
		"ocamllsp",
		"tinymist",
		-- "ansible-language-server",
	},
	automatic_installation = true,
})

require("lsp")
require("options")
require("mappings")
require("autocmds")

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"rust",
		"python",
		"go",
		"lua",
		"vim",
		"haskell",
		"vimdoc",
		"query",
		"svelte",
		"javascript",
		"typescript",
		"html",
		"css",
		"zig",
		"typst",
		"ocaml",
		"ocaml_interface",
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
		enable = true,
	},
})

local autopairs = require("nvim-autopairs")
autopairs.setup({})
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { "%.o", "%.so", "%.a" },
	},
})
require("typst-preview").setup({})
--formatting
require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		rust = { "rustfmt" },
		python = { "isort", "black" },
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		svelte = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		zig = { "zigfmt" },
		ocaml = { "ocamlformat" },
		haskell = { "ormolu" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style={IndentWidth: 4, BreakBeforeBraces: Allman}" },
		},
	}, -- Format on save
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
