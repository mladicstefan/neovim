---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "mountain",

}
vim.opt.shell = "/usr/bin/zsh"
M.nvdash = { load_on_startup = true }
M.ui = {
      tabufline = {
         lazyload = false
     }
}

return M
