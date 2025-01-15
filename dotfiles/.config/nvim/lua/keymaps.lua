local key = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Clear search highlights when pressing <Esc> --
key("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode --
key("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- SPLIT WINDOW --
key("n", "ss", ":split<CR>", silent)
key("n", "sv", ":vsplit<CR>", silent)

local nvim_tmux_nav = require("nvim-tmux-navigation")
key("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
key("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
key("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
key("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
key("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
key("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- NOTE: RESIZE WINDOW
key("n", "<C-w><C-h>", "10<C-w><")
key("n", "<C-w><C-l>", "10<C-w>>")
key("n", "<C-w><C-j>", "5<C-w>+")
key("n", "<C-w><C-k>", "5<C-w>-")

-- Diagnostic keymaps --
key("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Telescope Keymap --
local builtin = require("telescope.builtin")

key("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
key("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
key("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
key("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
key("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
key("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
key("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
key("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

key("n", "<leader>fc", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind neovim [C]onfig" })

key("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

key("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

key("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
