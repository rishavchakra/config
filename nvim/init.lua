vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.g.mapleader = ' '
vim.o.signcolumn = 'yes'
vim.o.winborder = 'rounded'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true

-- vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>s', ':update<CR>')
vim.keymap.set('n', '<leader>q', ':x<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>wv', ':vsplit<CR><C-w>w')
vim.keymap.set('n', '<leader>wh', ':split<CR><C-w>w')
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/rebelot/kanagawa.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },

	{ src = 'https://github.com/echasnovski/mini.ai' },
	{ src = 'https://github.com/echasnovski/mini.align' },
	{ src = 'https://github.com/echasnovski/mini.bracketed' },
	{ src = 'https://github.com/echasnovski/mini.comment' },
	-- { src = 'https://github.com/echasnovski/mini.completion' },
	{ src = 'https://github.com/echasnovski/mini.pairs' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/echasnovski/mini.splitjoin' },

	-- { src = 'https://github.com/Saghen/blink.cmp' },
})

vim.lsp.enable({
	'lua_ls',
	'tinymist',
	'rust-analyzer',
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file(" ", true)
			}
		}
	}
})

require 'mini.ai'.setup()
require 'mini.align'.setup()
require 'mini.bracketed'.setup()
require 'mini.comment'.setup()
-- require 'mini.completion'.setup()
require 'mini.pairs'.setup()
require 'mini.pick'.setup()
require 'mini.splitjoin'.setup()
require 'oil'.setup()
-- require 'blink-cmp'.setup()
require 'kanagawa'.setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = 'none'
				},
			},
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		return {
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end
})
vim.cmd('set completeopt+=noselect')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>g', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.cmd('colorscheme kanagawa')
