local M = {}

M.required_tools = {
	"clang-format",
	"rustfmt",
	"isort",
	"black",
	"goimports",
	"stylua",
	"prettier",
	"shfmt",
	"ocamlformat",
}

function M.ensure_installed()
	local mason_registry = require("mason-registry")

	mason_registry.refresh(function()
		for _, tool_name in ipairs(M.required_tools) do
			local ok, package = pcall(mason_registry.get_package, tool_name)

			if ok then
				if not package:is_installed() then
					vim.notify("Installing " .. tool_name, vim.log.levels.INFO)
					package:install():once(
						"closed",
						vim.schedule_wrap(function()
							if package:is_installed() then
								vim.notify(tool_name .. " installed successfully", vim.log.levels.INFO)
							else
								vim.notify("Failed to install " .. tool_name, vim.log.levels.ERROR)
							end
						end)
					)
				end
			else
				vim.notify("Package not found: " .. tool_name, vim.log.levels.WARN)
			end
		end
	end)
end

function M.check_status()
	local mason_registry = require("mason-registry")
	local installed = {}
	local missing = {}

	for _, tool_name in ipairs(M.required_tools) do
		local ok, package = pcall(mason_registry.get_package, tool_name)
		if ok and package:is_installed() then
			table.insert(installed, tool_name)
		else
			table.insert(missing, tool_name)
		end
	end

	print("=== Mason Formatter Status ===")
	print("\nInstalled (" .. #installed .. "):")
	for _, tool in ipairs(installed) do
		print("  ✓ " .. tool)
	end

	if #missing > 0 then
		print("\nMissing (" .. #missing .. "):")
		for _, tool in ipairs(missing) do
			print("  ✗ " .. tool)
		end
	else
		print("\n✓ All formatters installed!")
	end
end

return M
