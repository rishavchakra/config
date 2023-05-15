local vim = vim
-- Default vim-only keybinds
local map = vim.keymap
local silence = { noremap = true, silent = true }
vim.g.mapleader = " "

map.set('n', 'x', '"_x') -- x doesn't yank to register
map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')


map.set('n', '<leader>s', ':w<CR>')
map.set('n', '<leader>q', ':x')

-- Buffers
-- map.set('n', '<Tab>', ':bn<CR>', silence)
-- map.set('n', '<S-Tab>', ':bp<CR>', silence)
map.set('n', '<leader>x', '<cmd>b#|bd#<cr>', silence)

-- Windows
map.set('n', '<leader>w', '<C-w>')
map.set('n', '<leader>wv', ':vsplit<CR><C-w>w', silence)
map.set('n', '<leader>wh', ':split<CR><C-w>w', silence)

-- Tabs
map.set('n', '<leader>tt', ':tabedit<CR>', silence)
map.set('n', '<leader>tn', ':tabn<CR>', silence)
map.set('n', '<leader>tp', ':tabp<CR>', silence)
map.set('n', '<leader>tq', ':tabclose<CR>', silence)

map.set('n', '[ ', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', silence)
map.set('n', '] ', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', silence)

map.set('t', '<esc>', '<C-\\><C-n>', silence)

-- map.set('n', '<C-d>', '<C-d>zz', silence)
-- map.set('n', '<C-u>', '<C-u>zz', silence)

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'

M = {}

function M.lsp_keymaps(opts)
    local keymap = vim.api.nvim_set_keymap
    keymap('n', '<leader>ld', '<cmd>TroubleToggle lsp_definitions<CR>', opts)
    keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', '<leader>lr', '<cmd>TroubleToggle lsp_references<CR>', opts)
    keymap('n', '<leader>lt', '<cmd>TroubleToggle lsp_type_definitions<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    keymap('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

return M
