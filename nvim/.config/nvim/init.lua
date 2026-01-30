vim.g.mapleader = " "

vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
})

vim.o.background = "dark"
vim.cmd.colorscheme("oxocarbon")

require("mini.icons").setup()
require("mini.statusline").setup()

require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

local pick = function(mapping, picker)
	require("mini.pick").setup()
	vim.keymap.set("n", "<leader>" .. mapping, require("mini.pick").builtin[picker])
end
pick("b", "buffers")
pick("f", "files")
pick("/", "grep_live")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
vim.lsp.config("ts_ls", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
})
vim.lsp.enable({
	"lua_ls",
	"ty",
	"ts_ls",
})
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format" },
		javascript = { "prettier" },
		typescript = { "prettier" },
	},
	format_on_save = {},
})
