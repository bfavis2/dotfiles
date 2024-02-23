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
		local builtin = require('telescope.builtin') 
		-- See `:help telescope.builtin`
		vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>/', function()
		  -- You can pass additional configuration to telescope to change theme, layout, etc.
		  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		  })
		end, { desc = '[/] Fuzzily search in current buffer' })

		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })


			require('telescope').load_extension('fzf')
		  end
}
