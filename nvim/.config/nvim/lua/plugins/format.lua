return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			javascript = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
		},
	},
}
