return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"

    -- # TYPES
    -- 1. info
    -- 2. warn
    -- 3. error
    -- 4. debug

    notify.setup({
      background_colour = "#000000",
      fps = 60,
      timeout = 3000,
      render = "default",
      stages = "fade_in_slide_out",
    })

    vim.notify = notify

    vim.keymap.set('n', '<leader>nh', function()
      notify.history()
    end, { desc = 'Show notification history' })
  end,
}
