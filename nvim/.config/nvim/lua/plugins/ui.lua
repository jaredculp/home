return {
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "echasnovski/mini.completion", config = true },
	{ "echasnovski/mini.indentscope", config = true },
	{
		"echasnovski/mini.pick",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
		keys = {
			{ "<leader>f", ":Pick files<cr>" },
			{ "<leader>g", ":Pick grep_live<cr>" },
			{ "<leader>b", ":Pick buffers<cr>" },
		},
	},
	{
		"echasnovski/mini.tabline",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{ "echasnovski/mini.statusline", config = true },
	{
		"echasnovski/mini.starter",
		config = function()
			starter = require("mini.starter")
			starter.setup({
				header = [[
   ██████╗ ██████╗  ██████╗ ██╗    ██╗
  ██╔════╝ ██╔══██╗██╔═══██╗██║    ██║
  ██║  ███╗██████╔╝██║   ██║██║ █╗ ██║
  ██║   ██║██╔══██╗██║   ██║██║███╗██║
  ╚██████╔╝██║  ██║╚██████╔╝╚███╔███╔╝
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ 
        ]],
				items = {
					starter.sections.recent_files(5, true, false),
					starter.sections.recent_files(5, false, true),
				},
				footer = "",
			})
		end,
	},
}
