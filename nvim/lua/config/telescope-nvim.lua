local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup {
    extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        },
        file_browser = {
            -- respect_gitignore = false,
            hidden = true,
            initial_mode = 'normal',
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                  -- custom insert mode mappings
                    ["<Tab>"] = actions.move_selection_next,
                    ["<S-Tab>"] = actions.move_selection_previous,
                    ["<Esc>"] = actions.close,
                },
                ["n"] = {
                  -- custom normal mode mappings
                },
              },
        },
    },
    defaults = {
        -- initial_mode = 'normal',
        -- respect_gitignore = false,
        hidden = true,
        file_ignore_patterns = {
           -- ".git",
           "node_modules",
        },
        mappings = {
            ["i"] = {
                -- custom insert mode mappings
                ["<Tab>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_next,
                ["<Esc>"] = actions.close,
            },
            ["n"] = {
                -- custom normal mode mappings
            }
        }
    },
    pickers = {
        buffers = {
          initial_mode = "normal"
        }
    }
}

vim.keymap.set('n', '<leader>ff', ":Telescope file_browser<CR>", { noremap = true }) -- file_browser
vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.load_extension "file_browser"
telescope.load_extension "fzf"
