-- return to netrw directory tree
vim.keymap.set("n", "<leader>m", vim.cmd.Ex)

-- move highlighted lines up and down
-- automatically indents too
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- appends line below to current line without moving cursor to the end
vim.keymap.set("n", "J", "mzJ`z")

-- follow along while moving half a page down/up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- follow along when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pastes the default buffer but prevents overwriting the buffer when pasting over something
vim.keymap.set("x", "<leader>p", [["_dP"]])

-- yank into system's clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- regular delete doesn't override the default buffer
vim.keymap.set({ "n", "v" }, "<leader>d", "d")
vim.keymap.set({ "n", "v" }, "d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>x", "x")
vim.keymap.set({ "n", "v" }, "x", [["_x]])
vim.keymap.set({ "n", "v" }, "<leader>c", "c") -- currently overwrriten
vim.keymap.set({ "n", "v" }, "c", [["_c]])

-- elimantes the slight difference between <C-c> and <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")

-- not sure
vim.keymap.set("n", "Q", "<nop>")

-- format document
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quick fix shortcuts
-- https://vimdoc.sourceforge.net/htmldoc/quickfix.html
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- start replacing the word at the cursor in the whole document
vim.keymap.set(
	"n",
	"<leader>sc",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Current Word Replace Everywhere" }
)

-- makes the current file executable
vim.keymap.set("n", "<leader>z", "<cmd>!chmod +x %<CR>", { silent = true })

-- clear highlights when searching
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("noh")
end)

-- sources the file??
-- vim.keymap.set("n", "<leader><leader>", function()
-- 	vim.cmd("so")
-- end)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
