require('base')
require('keymap')
require('language')
-- Bootstrap lazy.nvim
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

-- Setup plugins
require("lazy").setup("plugins", {
	defaults = { lazy = true },
	checker = { enabled = true },
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- vim.o.background = ''
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd [[highlight IndentLineKanagawa guibg=#16161d gui=nocombine]]
-- vim.cmd [[highlight IndentLineCatppuccin guibg=#181825 gui=nocombine]]
-- local highlight = {
-- 	"Whitespace",
-- 	"IndentLineKanagawa",
-- 	-- "#16161d",
-- 	-- "Gutter",
-- 	-- "WinSeparator",
-- 	-- "CursorColumn",
-- }
