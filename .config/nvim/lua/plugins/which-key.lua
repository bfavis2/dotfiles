return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      winblend = 25
    },
    layout = {
      height = { min = 4, max = 15 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
