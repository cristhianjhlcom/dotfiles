local status_ok, github = pcall(require, 'github-theme')

if not status_ok then
    print('Error loading github plugin.')
end

local palette = require('github-theme.palette').load('github_dark')

local function setup()
    local colorscheme = 'github_dark'

    github.setup({
        options = {
            transparent = true,
            styles = {
                functions = 'bold',
                variables = 'bold',
                comments = 'italic',
                constants = 'bold,italic',
                strings = 'NONE',
                keywords = 'NONE',
                types = 'bold',
            },
        },
        groups = {
            all = {
                LineNrAbove = {
                    fg = 'Gray',
                    bg = nil,
                    italic = false,
                    bold = false,
                },
                LineNrBelow = {
                    fg = 'Gray',
                    bg = nil,
                    italic = false,
                    bold = false,
                },
                LineNr = {
                    fg = palette.blue.base,
                    bg = nil,
                    bold = true,
                },
                Normal = {
                    fg = palette.fg,
                    bg = palette.bg,
                },
                -- Visual = {
                --     bg = palette.yellow.base,
                -- },
                -- Search = {
                --     fg = palette.fg,
                --     bg = palette.yellow.base,
                -- },
                -- IncSearch = {
                --     fg = palette.fg,
                --     bg = palette.yellow.base,
                -- },
                StatusLine = {
                    fg = palette.fg,
                    bg = palette.bg_light,
                },
                StatusLineNC = {
                    fg = palette.fg_dark,
                    bg = palette.bg_light,
                },
            },
        },
    })

    vim.cmd.colorscheme(colorscheme)
end

return {
    setup = setup,
}
