local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- Python
require("dap-python").setup(vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"))

-- C / C++ / Rust
local codelldb_path = vim.fn.expand("~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = codelldb_path,
		args = { "--port", "${port}" },
	},
}

dap.adapters.lldb = dap.adapters.codelldb

-- C/C++ config — prompts for binary path
dap.configurations.c = {
	{
		name = "Launch (codelldb)",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.cpp = dap.configurations.c

-- Rust config — auto-detects binary from Cargo.toml, falls back to prompt
dap.configurations.rust = {
	{
		name = "Launch (codelldb)",
		type = "codelldb",
		request = "launch",
		program = function()
			local cargo_toml = vim.fn.getcwd() .. "/Cargo.toml"
			if vim.fn.filereadable(cargo_toml) == 1 then
				for _, line in ipairs(vim.fn.readfile(cargo_toml)) do
					local name = line:match('^name = "(.+)"')
					if name then
						local bin = vim.fn.getcwd() .. "/target/debug/" .. name
						if vim.fn.filereadable(bin) == 1 then
							return bin
						end
					end
				end
			end
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		initCommands = function()
			local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
			local script = rustc_sysroot .. "/lib/rustlib/etc/lldb_lookup.py"
			local commands = {}
			if vim.fn.filereadable(script) == 1 then
				table.insert(commands, 'command script import "' .. script .. '"')
				table.insert(commands, "type synthetic add -l lldb_lookup.synthetic_lookup -x '.*' --category Rust")
				table.insert(commands, "type category enable Rust")
			end
			return commands
		end,
	},
}
--
-- Zig config — prompts for binary path (zig build output goes to zig-out/bin/)
dap.configurations.zig = {
	{
		name = "Launch (codelldb)",
		type = "codelldb",
		request = "launch",
		program = function()
			local zig_out = vim.fn.getcwd() .. "/zig-out/bin/"
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			local bin = zig_out .. project_name
			if vim.fn.filereadable(bin) == 1 then
				return bin
			end
			return vim.fn.input("Path to executable: ", zig_out, "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
