return {
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"arturgoms/moonbow.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("moonbow")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		enabled = false,
		config = function()
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},
}
