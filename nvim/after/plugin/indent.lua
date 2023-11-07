local status_ok, indent = pcall(require, 'ibl')

if not status_ok then
    print('Indent Blankline is not available.')
    return
end

local highlight = nil

indent.setup({
    indent = { highlight = highlight, char = '┊' },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
})
