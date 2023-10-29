local status_ok, monokai = pcall(require, 'monokai')
local palette = {
  base2 = '#202026',
  base3 = '#2E323C',
  white = '#ffffff',
  grey = '#7C7C7C',
  black = '#272822',
  green = '#8DD006',
  yellow = '#E0D561',
  orange = '#fd971f',
  purple = '#9D65FF',
  orange = '#FA8419',
  red = '#F3044B',
  pink = '#F4005F',
  aqua = '#66d9ef',
}

if not status_ok then
    print('Error loading monokai plugin.')
end

local function setup()
    monokai.setup({
      palette = palette,
      italics = false,
      TSInclude = {
          fg = palette.aqua,
      },
      GitSignsAdd = {
          fg = palette.green,
          bg = palette.base2
      },
      GitSignsDelete = {
          fg = palette.pink,
          bg = palette.base2
      },
      GitSignsChange = {
          fg = palette.orange,
          bg = palette.base2
      },
    })
    vim.cmd.colorscheme('monakai')
end

return {
    setup = setup,
}
