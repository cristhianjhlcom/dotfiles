function ColorMyPencils(color, bg)
  color = color or 'nordic'
  bg = bg and 'dark' or 'light'
  local ok, color_file = pcall(require, 'cristhianjhl.colors.' .. color)

  if not ok then
    print('Not setup file for color ' .. color)
    return
  end

  if type(color_file.setup) ~= 'function' then
    print('method setup non existing')
    return
  end

  color_file.setup(bg)

  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

ColorMyPencils()
