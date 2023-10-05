vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- based tpope
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- dadbod
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
	},

	-- ui
	"nvim-tree/nvim-web-devicons",
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "nvim-lualine/lualine.nvim", config = true },
	{ "akinsho/bufferline.nvim", config = true },

	-- colors
	"olivercederborg/poimandres.nvim",
	"edeneast/nightfox.nvim",
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local tele = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", tele.git_files, { desc = "Search git [f]iles" })
			vim.keymap.set("n", "<leader>F", tele.find_files, { desc = "Search all [F]iles" })
			vim.keymap.set("n", "<leader>g", tele.live_grep, { desc = "Search by [g]rep" })
			vim.keymap.set("n", "<leader>b", tele.buffers, { desc = "Search open [b]uffers" })
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"terraform",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = {
						"python",
					},
				},
			})
		end,
	},

	-- format
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black", "ruff" },
					javascript = { "prettierd" },
				},
				format_on_save = {
					-- I recommend these options. See :help conform.format for details.
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tailwindcss",
					"terraformls",
					"tsserver",
				},
			})
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}),
			})
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = function()
							vim.keymap.set("n", "K", vim.lsp.buf.hover)
							vim.keymap.set("n", "gd", vim.lsp.buf.definition)
							vim.keymap.set("n", "gr", vim.lsp.buf.references)
							vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
							vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
							vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
							vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
							vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
							vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
							vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
						end,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			})
		end,
	},
})

vim.o.background = "light"
vim.cmd.colorscheme("zenwritten")

vim.o.clipboard = "unnamed"
vim.o.colorcolumn = 80
vim.o.completeopt = "menuone,noselect"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.termguicolors = true

vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[b", ":bprev<CR>")
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>")
