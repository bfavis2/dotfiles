-- [[ Setting options ]]
-- See `:help vim.opt`
vim.g.mapleader = " "
vim.g.autoformat = true

-- root dir detection
vim.g.root_spec = {
	".git",
	".hg",
	".svn",
	".root",
	"Makefile",
	"package.json",
	"pom.xml",
	"build.gradle",
	"settings.gradle",
	"lsp",
	"cwd",
}

vim.opt.formatoptions = "jcroqlnt"

-- Set highlight on search
vim.opt.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- don't use swapfile
vim.opt.swapfile = false

-- autocomplete options
vim.opt.completeopt = "menuone,noinsert,noselect"

-- Sync clipboard between OS and Neovim. neovim
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- highlight matching parenthesis
vim.opt.showmatch = true

-- Enable auto and smart indenting
vim.opt.smartindent = true
vim.opt.breakindent = true

-- split right/below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.foldmethod = "marker"
-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
	vim.opt.foldtext = ""
	vim.opt.fillchars = "fold: "
else
	vim.opt.foldmethod = "indent"
end

-- vim.opt.colorcolumn = "80"

-- Save undo history
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- use spaces instead of tabs
vim.opt.expandtab = true

-- change tabs to 4 spaces instead of 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.shiftround = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- relative line numbers
vim.wo.relativenumber = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
