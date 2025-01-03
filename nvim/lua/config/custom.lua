-- Función para insertar la hora actual (formato h:m:s)
local function insert_now()
  local now = os.date("%H:%M:%S")
  vim.api.nvim_put({ now }, 'c', true, true)
end

-- Función para insertar la fecha actual (formato d/m/Y)
local function insert_today()
  local today = os.date("%d/%m/%Y")
  vim.api.nvim_put({ today }, 'c', true, true)
end

vim.keymap.set('i', '<C-n>', insert_now, { desc = "Insert current time (h:m:s)" })
vim.keymap.set('i', '<C-d>', insert_today, { desc = "Insert current date (d/m/Y)" })
