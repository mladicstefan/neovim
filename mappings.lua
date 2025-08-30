local map = vim.keymap.set


map("n", "<>)

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n" }, "<Up>", "<Nop>", { noremap = true, silent = true })
map({ "n" }, "<Down>", "<Nop>", { noremap = true, silent = true })
map({ "n" }, "<Left>", "<Nop>", { noremap = true, silent = true })
map({ "n" }, "<Right>", "<Nop>", { noremap = true, silent = true })

-- window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map({ "n", "v" }, "x", '"_x', { desc = "Delete without copying" })

--TERMINAL
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>h", ":split | term<CR>", { desc = "Open horizontal terminal" })
map("n", "<leader>v", ":vsplit | term<CR>", { desc = "Open vertical terminal" })

--DISABLE ARROW KEY
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--SAVE AND QUIT
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')

--SOURCE
map('n', '<leader>s', ':source ~/.config/nvim/init.lua')
