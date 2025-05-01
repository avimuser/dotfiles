return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = { icons_enabled = false, globalstatus = true },
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "diagnostics" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
