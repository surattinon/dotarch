return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[C]ode [F]ormat",
			},
		},
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				bash = { "shfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				lua = { "stylua" },
				go = { "goimports", "gofumpt", "goimports-reviser" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				vue = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				less = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				jsonc = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				["markdown.mdx"] = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				handlebars = { { "prettierd", "prettier" } },
				java = { "google-java-format" },
			},
		},
	},
}
