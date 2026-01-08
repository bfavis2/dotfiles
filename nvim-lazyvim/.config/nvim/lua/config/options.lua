-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.list = true -- sets how neovim will display certain whitespace in the editor.
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.scrolloff = 10 -- always keep 10 lines above/below cursor unless at start/end of file
opt.showmatch = true
