local autocmd = vim.api.nvim_create_autocmd

autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlights yank',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

