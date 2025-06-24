local map = vim.api.nvim_set_keymap
-- Disable arrow keys in normal mode
map('n', '<Up>',    '<Nop>', { noremap = true, silent = true })
map('n', '<Down>',  '<Nop>', { noremap = true, silent = true })
map('n', '<Left>',  '<Nop>', { noremap = true, silent = true })
map('n', '<Right>', '<Nop>', { noremap = true, silent = true })

