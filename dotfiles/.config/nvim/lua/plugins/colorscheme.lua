return {
	-- NOTE: SONOKAI
	{
		"sainnhe/sonokai",
		event = "VimEnter",
		priority = 1000,
		config = function()
			if vim.g.neovide then
				vim.g.sonokai_transparent_background = 0
			else
				vim.g.sonokai_transparent_background = 2
			end
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_style = "andromeda"

			vim.cmd([[colorscheme sonokai]])

			vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
			vim.cmd("highlight FloatTitle ctermbg=NONE guibg=NONE")
			vim.cmd("highlight FloatBorder ctermbg=NONE guibg=NONE")

			vim.cmd("highlight DiagnosticFloatingHint  ctermbg=NONE guibg=NONE guifg=#42E66C")
			vim.cmd("highlight DiagnosticFloatingInfo ctermbg=NONE guibg=NONE guifg=#0876c5")
			vim.cmd("highlight DiagnosticFloatingWarn ctermbg=NONE guibg=NONE guifg=#E8AB53")
			vim.cmd("highlight DiagnosticFloatingError ctermbg=NONE guibg=NONE guifg=#ff5189")
		end,
	},
}
