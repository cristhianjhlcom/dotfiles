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
		typescript = { { "prettierd", "prettier" } },
		php = { "pint" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
