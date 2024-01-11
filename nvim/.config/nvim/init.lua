-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- opts
vim.o.clipboard = "unnamed"
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.list = true
vim.o.listchars = "tab:┊ "

-- lazy
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

require("lazy").setup("plugins", {
	change_detection = { notify = false },
})

-- keymaps
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exist insert mode with jk" })
