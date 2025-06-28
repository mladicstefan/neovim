local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn
---@diagnostic disable-next-line:unused-local
local bufcheck = vim.api.nvim_create_augroup('bufcheck', { clear = true })

autocmd('TextYankPost', {
  desc = 'Highlights yank',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit position when opening files
autocmd('BufReadPost',  {
  group    = 'bufcheck',
  pattern  = '*',
  callback = function()
    if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
    fn.setpos('.', fn.getpos("'\""))
    vim.cmd('silent! foldopen')
  end
  end
})
