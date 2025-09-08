local map = vim.keymap.set

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Command mode shortcut
map("n", ";", ":", { desc = "Enter command mode" })

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

map("n", "<Up>", "<Nop>", { noremap = true, silent = true })
map("n", "<Down>", "<Nop>", { noremap = true, silent = true })
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Arrow key reminders (helpful messages)
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "Reminder to use h" })
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "Reminder to use l" })
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "Reminder to use k" })
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "Reminder to use j" })

-- Window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Delete without copying to clipboard
map({ "n", "v" }, "x", '"_x', { desc = "Delete without copying" })

-- Terminal mappings
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>h", ":split | term<CR>", { desc = "Open horizontal terminal" })
map("n", "<leader>v", ":vsplit | term<CR>", { desc = "Open vertical terminal" })

-- File operations
map('n', '<leader>w', ':write<CR>', { desc = "Save current file" })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit current window" })

-- Source configuration
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>', { desc = "Reload nvim configuration" })

-- Telescope mappings (file navigation)
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Find files" })
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Live grep search" })
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Find buffers" })

map('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
