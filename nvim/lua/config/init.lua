require("config.options")
require("config.custom")
require("config.keys")

if vim.deprecate and vim.fn.has("nvim-0.11") == 0 then
  local orig_deprecate = vim.deprecate
  vim.deprecate = function(msg, ...)
    if type(msg) == "string" and msg:match("nvim%-lspconfig support for Nvim 0.10 or older") then
      return
    end
    return orig_deprecate(msg, ...)
  end
end

require("config.lazy")

-- require("notify").setup()
--
-- vim.notify = require("notify")
