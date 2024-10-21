local map = vim.keymap.set

-- return to netrw directory tree
map("n", "<leader>m", vim.cmd.Ex)

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- appends line below to current line without moving cursor to the end
map("n", "J", "mzJ`z")

-- follow along while moving half a page down/up
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- follow along when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- pastes the default buffer but prevents overwriting the buffer when pasting over something
map("x", "<leader>p", [["_dP"]])

-- yank into system's clipboard
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

-- elimantes the slight difference between <C-c> and <Esc>
map("i", "<C-c>", "<Esc>")

-- not sure
map("n", "Q", "<nop>")

-- format document
map("n", "<leader>df", vim.lsp.buf.format, { desc = "[D]ocument [F]ormat" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quick fix shortcuts
-- https://vimdoc.sourceforge.net/htmldoc/quickfix.html
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- start replacing the word at the cursor in the whole document
map(
	{ "n", "v" },
	"<leader>sc",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Current Word Replace Everywhere" }
)

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- makes the current file executable
map("n", "<leader>z", "<cmd>!chmod +x %<CR>", { silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- clear search highlight and escape
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- move buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Keymaps for better default experience
-- See `:help map()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- delete buffer
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "[B]uffer [D]elete" })

-- diagnostics
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to [P]revious [D]iagnostic message" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to [N]ext [D]iagnostic message" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [D]iagnostic [E]rror messages" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })
