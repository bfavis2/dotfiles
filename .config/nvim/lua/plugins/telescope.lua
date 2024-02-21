return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = function()
    local actions = require('telescope.actions')
    local theme = require('telescope.theme')
  end,
  config = function(_, opts)
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      pickers = {
        find_files = {
          hidden = true
        }
      },
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false, -- clears the prompt instead of scrolling previewer
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}
