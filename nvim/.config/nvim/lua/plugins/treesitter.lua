return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"folke/ts-comments.nvim",
			event = "VeryLazy",
			config = true,
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			auto_install = true,
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "python" },
			},
		})
	end,
}
