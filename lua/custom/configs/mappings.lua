---@type ChadrcConfig['mappings']
local M = {}

local map = vim.keymap.set

-- Disable them by remapping to no-op
map({ "n"}, "<Up>", "<Nop>", { noremap = true, silent = true })
map({ "n"}, "<Down>", "<Nop>", { noremap = true, silent = true })
map({ "n"}, "<Left>", "<Nop>", { noremap = true, silent = true })
map({ "n"}, "<Right>", "<Nop>", { noremap = true, silent = true})


return M
