local capabilities = require("blink.cmp").get_lsp_capabilities()

-- C/C++
vim.lsp.config.clangd = {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy=false",
		"--completion-style=bundled",
		"--header-insertion=never",
	},
	filetypes = { "c", "cpp" },
	root_markers = { ".git", "compile_commands.json" },
}

-- Rust
vim.lsp.config.rust_analyzer = {
	capabilities = capabilities,
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
		},
	},
}

-- Lua
vim.lsp.config.lua_ls = {
	capabilities = capabilities,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git", ".luarc.json" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
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
}

-- Python
vim.lsp.config.basedpyright = {
	capabilities = capabilities,
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		python = {
			pythonPath = vim.fn.exepath("python"),
		},
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

-- Bash
vim.lsp.config.bashls = {
	capabilities = capabilities,
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_markers = { ".git" },
}

-- Golang
vim.lsp.config.gopls = {
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", ".git" },
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = true,
		},
	},
}

-- Svelte
vim.lsp.config.svelte = {
	capabilities = capabilities,
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_markers = { "package.json", ".git" },
}

-- Typescript
vim.lsp.config.ts_ls = {
	capabilities = capabilities,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
}

-- Tailwind CSS
vim.lsp.config.tailwindcss = {
	capabilities = capabilities,
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "html", "css", "svelte", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = { "tailwind.config.js", "tailwind.config.ts", ".git" },
}

-- Zig
vim.lsp.config.zls = {
	capabilities = capabilities,
	cmd = { "zls" },
	filetypes = { "zig", "zir" },
	root_markers = { "build.zig", ".git" },
}

-- OCaml
vim.lsp.config.ocamllsp = {
	capabilities = capabilities,
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_markers = { "dune-project", "dune-workspace", ".git" },
}

-- Typst
vim.lsp.config.tinymist = {
	capabilities = capabilities,
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { ".git" },
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
	},
}

-- Enable all configured LSP servers
vim.lsp.enable({
	"clangd",
	"rust_analyzer",
	"lua_ls",
	"basedpyright",
	"bashls",
	"gopls",
	"svelte",
	"ts_ls",
	"tailwindcss",
	"zls",
	"ocamllsp",
	"tinymist",
})

-- LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		-- Add manual format keymap (optional, since you have format_on_save)
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			require("conform").format({ bufnr = ev.buf, lsp_format = "fallback" })
		end, opts)
	end,
})
