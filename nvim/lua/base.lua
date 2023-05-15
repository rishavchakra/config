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

