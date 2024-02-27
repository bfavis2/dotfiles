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
  config = function()
    local actions = require("telescope.actions")

    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true
        }
      },
      defaults = {
         mappings = {
	  i = {
	    ["<C-n>"] = actions.cycle_history_next,
	    ["<C-p>"] = actions.cycle_history_prev,

	    ["<C-j>"] = actions.move_selection_next,
	    ["<C-k>"] = actions.move_selection_previous,

	    ["<C-c>"] = actions.close,

	    ["<Down>"] = actions.move_selection_next,
	    ["<Up>"] = actions.move_selection_previous,

	    ["<CR>"] = actions.select_default,
	    ["<C-x>"] = actions.select_horizontal,
	    ["<C-v>"] = actions.select_vertical,
	    ["<C-t>"] = actions.select_tab,

	    ["<C-u>"] = actions.preview_scrolling_up,
	    ["<C-d>"] = actions.preview_scrolling_down,

	    ["<PageUp>"] = actions.results_scrolling_up,
	    ["<PageDown>"] = actions.results_scrolling_down,

	    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
	    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
	    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
	    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
	    ["<C-l>"] = actions.complete_tag,
	    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
	  },

	  n = {
	    ["<esc>"] = actions.close,
	    ["<CR>"] = actions.select_default,
	    ["<C-x>"] = actions.select_horizontal,
	    ["<C-v>"] = actions.select_vertical,
	    ["<C-t>"] = actions.select_tab,

	    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
	    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
	    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
	    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

	    ["j"] = actions.move_selection_next,
	    ["k"] = actions.move_selection_previous,
	    ["H"] = actions.move_to_top,
	    ["M"] = actions.move_to_middle,
	    ["L"] = actions.move_to_bottom,

	    ["<Down>"] = actions.move_selection_next,
	    ["<Up>"] = actions.move_selection_previous,
	    ["gg"] = actions.move_to_top,
	    ["G"] = actions.move_to_bottom,

	    ["<C-u>"] = actions.preview_scrolling_up,
	    ["<C-d>"] = actions.preview_scrolling_down,

	    ["<PageUp>"] = actions.results_scrolling_up,
	    ["<PageDown>"] = actions.results_scrolling_down,

	    ["?"] = actions.which_key,
	  },
        },
	file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".git",
						".sl",
						"_build",
						".next",
					}
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
	["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
      },
  })
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
		    require('telescope').load_extension('ui-select')
		  end
}
