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
        path_display = { truncate = 3 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        layout_config = {
            preview_cutoff = 1,
            width = 0.65,
            height = 0.65,
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

vim.keymap.set('n', '<Leader>sf', require('telescope.builtin').find_files, {});
vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<Leader>sb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags, {})
vim.keymap.set('n', '<Leader>ps', function()
    require("telescope.builtin").grep_string({ search = vim.fn.input('Grep > ') })
end)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
