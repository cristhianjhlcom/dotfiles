local ls = require "luasnip"
local types = require "luasnip.util.types"
local M = {}

function M.setup()
  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Choice", "Error" } },
        },
      },
    },
  })

  vim.keymap.set({ 'i', 's' }, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jumpable()
    end
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set('i', "<C-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)
end

return M
