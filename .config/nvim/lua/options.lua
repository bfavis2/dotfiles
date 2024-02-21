-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- don't use swapfile
vim.o.swapfile = false

-- autocomplete options
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Sync clipboard between OS and Neovim. neovim
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- highlight matching parenthesis
vim.o.showmatch = true

-- Enable break indent
vim.o.breakindent = true

-- split right/below
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.foldmethod = 'marker'

vim.o.colorcolumn = '80'
-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- use spaces instead of tabs
-- vim.o.expandtab = true

-- change tabs to 4 spaces instead of 8
vim.o.tabstop = 4

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- relative line numbers
vim.wo.relativenumber = true
