return {
  'williamboman/mason.nvim',
  config = function ()
    local mason = require "mason"

    mason.setup({
      ensure_installed = {
        "clang",
        "clang-format",
        "codelldb"
      }
    })
  end,
}
