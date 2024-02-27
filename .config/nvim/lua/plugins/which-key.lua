return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 15 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
    }
  }
}
