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
	"https://github.com/stevearc/aerial.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/xero/miasma.nvim",
	"https://github.com/EdenEast/nightfox.nvim",
})

vim.o.background = "dark"
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("hi! link MiniPickMatchCurrent Visual")
	end,
})
vim.cmd.colorscheme("carbonfox")

-- file browser
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<CMD>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<CMD>AerialNext<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>a", "<CMD>AerialToggle!<CR>")

-- mini.nvim
local mini_modules = {
	"diff",
	"icons",
	"indentscope",
	"git",
	"pairs",
	"pick",
	"statusline",
	"tabline",
}
for _, mini in ipairs(mini_modules) do
	require("mini." .. mini).setup()
end

-- fuzzy finder
local pick = function(mapping, picker)
	vim.keymap.set("n", "<leader>" .. mapping, require("mini.pick").builtin[picker])
end
pick("b", "buffers")
pick("f", "files")
pick("/", "grep_live")

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.lsp.completion.enable(true, args.data.client_id, args.buf)
	end,
})

vim.lsp.enable({
	"lua_ls",
	"ty",
	"ts_ls",
})
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- formatters
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format" },
		javascript = { "prettier" },
		typescript = { "prettier" },
	},
	format_on_save = {},
})
