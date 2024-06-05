local status_ok, lualine = pcall(require, "lualine")

if (not status_ok) then return end

local function file_icon()
	local filename = vim.fn.expand('%:t')
	local extension = vim.fn.expand('%:e')
	local icon = require'nvim-web-devicons'.get_icon(filename, extension, {default = true})
	return icon
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { },
		lualine_c = { file_icon, { 'filename', path = 1 } },
		lualine_x = { 'branch', 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { 'branch ' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})
