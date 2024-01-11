return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>f", ":Telescope git_files<CR>" },
		{ "<leader>F", ":Telescope find_files<CR>" },
		{ "<leader>g", ":Telescope live_grep<CR>" },
		{ "<leader>b", ":Telescope buffers<CR>" },
	},
}
