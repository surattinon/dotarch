-- To show number --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Set to false for using statusline plugin --
vim.opt.showmode = true

-- Clipboard between OS and Neovim --
vim.opt.clipboard = "unnamedplus"

-- Enable break indent --
vim.opt.breakindent = true
vim.opt.smartindent = false

-- Save undo history --
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term --
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default --
vim.opt.signcolumn = "yes"

-- Decrease update time --
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time, Displays which-key popup sooner --
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened --
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview subsituation live --
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor --
vim.opt.scrolloff = 5

-- Highlight when yanking text --
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
