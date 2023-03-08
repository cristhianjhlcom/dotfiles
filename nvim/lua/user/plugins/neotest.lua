local status_ok, neotest = pcall(require, "neotest")

if not status_ok then
	return
end

vim.g['test#custom_strategies'] = {
  toggleterm = function(cmd)
    require('toggleterm').exec(cmd)
  end,
}

vim.g['test#strategy'] = 'toggleterm'

neotest.setup({
  adapters = {
    require('neotest-phpunit')({
      phpunit_cmd = function()
        return 'vendor/bin/phpunit'
      end
    })
  }
})
