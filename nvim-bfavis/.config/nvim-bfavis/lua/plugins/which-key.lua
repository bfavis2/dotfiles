-- Note from kickstart-modular
-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VeryLazy'
--
-- which loads which-key after all the UI elements are loaded. Events can be
-- normal autocommands events (:help autocomd-events).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		vim.opt.timeout = true
		vim.opt.updatetime = 250
		vim.opt.timeoutlen = 300
	end,
	opts = {
		window = {
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 15 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
		},
	},
	config = function()
		require("which-key").setup()

		require("which-key").register({
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[D]iagnostics", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
		})
	end,
}
