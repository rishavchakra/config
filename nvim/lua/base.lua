local vim = vim
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.o.relativenumber = true

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.scrolloff = 4
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.conceallevel = 2

-- Change back to bash if it's slow
vim.opt.shell = 'fish'

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Colors
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Disable netrw (replaced with nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable zig fmt on save
-- vim.g.zig_fmt_autosave = 0

vim.opt.list = true
vim.opt.listchars:append 'lead:⋅'
vim.opt.listchars:append 'trail:⋅'

-- Code folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- Disable automatic everything-folding
vim.opt.foldlevel = 20
