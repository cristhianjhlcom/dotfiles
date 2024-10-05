local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    print('Error calling telescope package.')
    return
end

local pickers = require('telescope.pickers')
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        file_ignore_patterns = { '.git/', 'node_modules/', 'vendor/', 'dist/', 'build/' },
        color_devicons = true,
        border = true,
        result_title = false,
        winblend = 0,
        layout_strategy = 'horizontal',
        path_display = { "truncate" },
        prompt_prefix = ' ',
        selection_caret = ' ',
        multi_icon = ' ',
        layout_config = {
            preview_cutoff = 0,
            prompt_position = 'top',
            width = 0.95,
            height = 0.95,
            preview_width = 0.65,
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
        file_ignore_pattern = { '.git/', 'node_modules/', 'vendor/' },
    },
    pickers = {
        find_files = {
            hidden = true,
            previewer = true,
        },
        buffers = {
            previewer = true,
        },
        oldfiles = {
            prompt_title = 'History',
        },
        lsp_references = {
            previewer = true,
        },
    },
    extensions = {},
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>pws', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<Leader>pWs', function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<Leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<Leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' });
vim.keymap.set('n', '<Leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' });
vim.keymap.set('n', '<Leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' });
vim.keymap.set('n', '<Leader>sw', builtin.grep_string, { desc = '[S]earch current [Word]' })
vim.keymap.set('n', '<Leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<Leader>sgs', builtin.git_status, { desc = '[S]earch [G]it [S]tatus' })
vim.keymap.set('n', '<Leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<Leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<Leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<Leader>s.', builtin.oldfiles,
    { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<Leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git Files' })

vim.keymap.set('n', '<Leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 0,
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<Leader>s/', function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<Leader>sn', function()
    builtin.find_files({
        cwd = vim.fn.stdpath('config')
    })
end, { desc = '[S]earch [N]eovim files' })
