vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a" -- Enable mouse support in all modes
vim.o.showmode = false

vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4

vim.g.mapleader = " "

-- Indentation
vim.o.autoindent = true
vim.o.breakindent = true -- Wrapped lines maintain indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true -- Case-sensitive search when uppercase letters are present

-- Files and backup
vim.o.undofile = true -- Persistent undo history across sessions
vim.o.swapfile = true -- Create swap files for crash recovery
vim.o.backup = false

-- UI and display
vim.o.wrap = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes" -- Always show sign column (prevents text shifting)
vim.o.cursorline = true
vim.o.showmatch = true
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.list = true

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Timing
vim.o.updatetime = 250 -- Faster completion and diagnostics
vim.o.timeoutlen = 300 -- Time to wait for mapped sequence to complete

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Command line
vim.o.inccommand = "split" -- Live preview of substitute commands
