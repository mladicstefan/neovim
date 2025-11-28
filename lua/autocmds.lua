-- ~/.config/nvim/lua/autocmds.lua
-- Auto commands and event handlers

-- Highlight yank (visual feedback when yanking text)
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

local color_cache = vim.fn.expand("~/.cache/nvim/kitty_colors.conf")

local function rgb_to_hex(rgb)
	if not rgb then
		return nil
	end
	return string.format("#%06x", rgb)
end

-- Sync colors to kitty and save persistently
local function sync_kitty_colors()
	local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

	local bg = rgb_to_hex(normal_hl.bg)
	local fg = rgb_to_hex(normal_hl.fg)

	if bg and fg then
		local file = io.open(color_cache, "w")
		if file then
			file:write(string.format("background %s\n", bg))
			file:write(string.format("foreground %s\n", fg))
			file:close()

			vim.fn.jobstart(string.format("kitty @ set-colors -a %s", color_cache))
		end
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.defer_fn(sync_kitty_colors, 100)
	end,
})

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		vim.defer_fn(sync_kitty_colors, 100)
	end,
})

vim.defer_fn(sync_kitty_colors, 200)
