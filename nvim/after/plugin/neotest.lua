local ok, neotest = pcall(require, "neotest")

if (not ok) then
	print("Feiled to load neotest -> ", neotest)
	return
end

neotest.setup({
	adapters = {
		require('neotest-pest')({
			ignore_dirs = { "vendor", "node_modules" },
			root_ignore_files = { "phpunit-only.tests" },
			test_file_suffixes = { "Test.php", "_test.php", "PestTest.php" },
			-- sail_enabled = function() return false end,
			-- sail_executable = "vendor/bin/sail",
			-- sail_project_path = "/var/www/html",
			-- pest_cmd = "vendor/bin/pest",
			-- parallel = 16,
			-- compact = false,
			-- -- Default: function that checks for sail presence.
			-- -- If no sail: Numbered file in randomized /tmp/ directory (using async.fn.tempname())
			-- -- If sail: "storage/app/" .. os.date("junit-%Y%m%d-%H%M%S")
			-- results_path = function() "/some/accessible/path" end,
		}),
	}
})

vim.keymap.set('n', '<Leader>tn', function() neotest.run.run() end, { desc = "[T]est [N]earest" })
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, { desc = "[T]est [F]ile" })
