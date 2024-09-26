return {
	"norcalli/nvim-colorizer.lua",
	event = "BufRead",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
		})
		COLORIZER_SETUP_HOOK()
	end,
}
