local theme = 'monakai'

function ColorMyPencils(color)
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

local ok, color_file = pcall(require, 'cristhianjhl.colors.'..theme)

if not ok then
  print('Not setup file for color '..theme)
end

if type(color_file.setup) ~= 'function' then
 print('method setup non existing')
end

color_file.setup()

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
