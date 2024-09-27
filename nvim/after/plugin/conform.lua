local status_ok, conform = pcall(require, "conform")

if not status_ok then
	return
end

require("conform.formatters.stylua").require_cwd = true

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		c = { "clang_format" },
		php = { "pint" },
		-- blade = { "prettierd" },
		["*"] = { "trim_whitespace" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
