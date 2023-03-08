local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
  size = 8,
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.o.shell,
  highlights = {
    Normal = {
      guibg = '',
    },
    NormalFloat = {
      link = ''
    },
    FloatBorder = {
      guifg = "",
      guibg = "",
    },
  },
  float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
          border = "NONE",
          background = "Normal",
      },
  },
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--         vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
vim.keymap.set("n", "<Leader>t", ":ToggleTerm size=10 direction=horizontal<CR>", { buffer = 0 })
