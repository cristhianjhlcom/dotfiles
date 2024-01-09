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
        transparent_bg = false,
        bright_border = false,
        options = {
            theme = 'nordic',
        },
    })

    vim.cmd.colorscheme('nordic')
end

return {
    setup = setup,
}
