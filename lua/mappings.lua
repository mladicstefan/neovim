local map = vim.keymap.set

map("n", "<C-i>", function()
	local enabled = vim.lsp.inlay_hint.is_enabled()
	vim.lsp.inlay_hint.enable(not enabled)
end, { desc = "Toggle inlay hints" })

map("n", "<Space>", "<Nop>")
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
map("n", "<leader>w", ":write<CR>", { desc = "Save current file" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit current window" })

-- Source configuration
map("n", "<leader>s", ":source ~/.config/nvim/init.lua<CR>", { desc = "Reload nvim configuration" })

-- Telescope mappings (file navigation)
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<leader>fz", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live grep search" })
map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Find buffers" })

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

-- debugging
local dap = require("dap")
local dapui = require("dapui")

-- Session control
map("n", "<leader>dc", dap.continue, { desc = "DAP continue/start" })
map("n", "<leader>dq", dap.terminate, { desc = "DAP terminate" })
map("n", "<leader>du", dapui.toggle, { desc = "DAP toggle UI" })

-- Stepping
map("n", "<leader>dn", dap.step_over, { desc = "DAP step over" })
map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
map("n", "<leader>do", dap.step_out, { desc = "DAP step out" })

-- Breakpoints
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP conditional breakpoint" })
map("n", "<leader>dx", dap.clear_breakpoints, { desc = "DAP clear all breakpoints" })

-- Inspection
map({ "n", "v" }, "<leader>de", dapui.eval, { desc = "DAP evaluate expression" })

-- Python specific
map("n", "<leader>dtm", require("dap-python").test_method, { desc = "DAP test method" })
map("n", "<leader>dtc", require("dap-python").test_class, { desc = "DAP test class" })

-- Trouble
map("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: project diagnostics" })
map("n", "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble: buffer diagnostics" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>", { desc = "Trouble: symbols" })

-- Gitsigns
local gs = require("gitsigns")
map("n", "]h", gs.next_hunk, { desc = "Next git hunk" })
map("n", "[h", gs.prev_hunk, { desc = "Prev git hunk" })
map("n", "<leader>gs", gs.stage_hunk, { desc = "Git stage hunk" })
map("n", "<leader>gr", gs.reset_hunk, { desc = "Git reset hunk" })
map("n", "<leader>gb", gs.blame_line, { desc = "Git blame line" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Git preview hunk" })
map("n", "<leader>gf", gs.diffthis, { desc = "Git diff this file" })
