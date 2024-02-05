local status_ok, nordic = pcall(require, 'nordic')
local palette = require('nordic.colors')

if not status_ok then
    print('Error loading nordic plugin.')
end

local function setup()
    nordic.setup({
        on_palette = function(palette) return palette end,
        bold_keywords = true,
        italic_comments = true,
        transparent_bg = true,
        bright_border = true,
        telescope = {
            style = 'classic',
        },
        override = {
            Visual = {
                fg = palette.black0,
                bg = palette.yellow.base,
                italic = true,
                bold = true,
            },
            StatusLine = {
                fg = palette.black2,
                bg = palette.orange.dim,
                italic = true,
                bold = true,
            },
            StatusLineNC = {
                fg = palette.orange.dim,
                italic = true,
            },
            LineNr = {
                fg = palette.gray5,
                bg = nil,
            },
        }
    })

    vim.cmd.colorscheme('nordic')
end

return {
    setup = setup,
}
