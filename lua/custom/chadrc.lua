---@class ChadrcConfig
---@field init fun()?  "allow init hook"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
}

M.plugins = 'custom.plugins'

M.init = function ()
  require("custom.autocmds")
end

return M
