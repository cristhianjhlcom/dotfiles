local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    print('Error in Telescope require pcall')
end

local pickers = require('telescope.pickers')
local builtin = require('telescope.builtin')
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        color_devicons = true,
        border = true,
        winblend = 0,
        layout_strategy = 'horizontal',
        path_display = { "smart" },
        prompt_prefix = ' ',
        selection_caret = ' ',
        multi_icon = ' ',
        layout_config = {
            preview_cutoff = 1,
            -- width = 0.65,
            -- height = 0.65,
            prompt_position = 'top',
        },
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-Down>'] = actions.cycle_history_next,
                ['<C-Up>'] = actions.cycle_history_prev,
            },
        },
        file_ignore_pattern = { '.git/', 'node_modules/' },
    },
    pickers = {
        find_files = {
            hidden = true,
            previewer = false,
            layout_config = {
                preview_cutoff = 1,
                width = 0.65,
                height = 0.65,
                prompt_position = 'top',
            },
        },
        buffers = {
            previewer = false,
            layout_config = {
                preview_cutoff = 1,
                width = 0.55,
                height = 0.65,
                prompt_position = 'top',
            },
        },
        oldfiles = {
            prompt_title = 'History',
        },
        lsp_references = {
            previewer = false,
        },
    },
    extensions = {},
})

vim.keymap.set('n', '<Leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' });
vim.keymap.set('n', '<Leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' });
vim.keymap.set('n', '<Leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' });
vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [Word]' })
vim.keymap.set('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<Leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<Leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<Leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<Leader>s.', require('telescope.builtin').oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})

vim.keymap.set('n', '<Leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<Leader>s/', function()
    require('telescope.builtin').live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<Leader>sn', function()
    require('telescope.builtin').find_files({
        cwd = vim.fn.stdpath('config')
    })
end, { desc = '[S]earch [N]eovim files' })
