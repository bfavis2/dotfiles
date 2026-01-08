-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- follow along while moving half a page down/up
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- follow along when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- pastes the default buffer but prevents overwriting the buffer when pasting over something
map("x", "<leader>p", [["_dP"]])

-- yank/paste into system's clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>p", [["+p]])
map("n", "<leader>P", [["+P]])

-- regular delete doesn't override the default buffer
-- map({ "n", "v" }, "<leader>d", "d")
map({ "n", "v" }, "d", [["_d]])
map({ "n", "v" }, "<leader>x", "d") -- original cut functionality
map({ "n", "v" }, "x", [["_x]])
-- map({ "n", "v" }, "<leader>c", "c") -- currently overwrriten
map({ "n", "v" }, "c", [["_c]])

-- start replacing the word at the cursor in the whole document
map(
  { "n", "v" },
  "<leader>cw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Current Word Replace Everywhere" }
)

-- makes the current file executable
map("n", "<leader>z", "<cmd>!chmod +x %<CR>", { silent = true })
