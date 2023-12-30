local vim = vim
-- Default vim-only keybinds
local map = vim.keymap
local silence = { noremap = true, silent = true }
vim.g.mapleader = " "

map.set("n", "x", '"_x') -- x doesn't yank to register
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

map.set("n", "<leader>s", ":w<CR>")
map.set("n", "<leader>q", ":x")

-- Buffers
-- map.set('n', '<Tab>', ':bn<CR>', silence)
-- map.set('n', '<S-Tab>', ':bp<CR>', silence)
map.set("n", "<leader>x", "<cmd>b#|bd#<cr>", silence)

-- Windows
map.set("n", "<leader>w", "<C-w>")
map.set("n", "<leader>wv", ":vsplit<CR><C-w>w", silence)
map.set("n", "<leader>wh", ":split<CR><C-w>w", silence)

-- Tabs
map.set("n", "<leader>tt", ":tabedit<CR>", silence)
map.set("n", "<leader>tn", ":tabn<CR>", silence)
map.set("n", "<leader>tp", ":tabp<CR>", silence)
map.set("n", "<leader>tq", ":tabclose<CR>", silence)

map.set("n", "[ ", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", silence)
map.set("n", "] ", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", silence)

map.set("t", "<esc>", "<C-\\><C-n>", silence)

-- map.set('n', '<C-d>', '<C-d>zz', silence)
-- map.set('n', '<C-u>', '<C-u>zz', silence)

-- Code folding
map.set("n", "<leader>tf", "za", { desc = "Toggle Fold code" })
map.set("n", "<leader>tF", "za", { desc = "Toggle Fold code recursive" })
map.set("n", "<leader>tR", "zR", { desc = "Unfold all" })
-- map.set('n', '<leader>tr', 'zr', { desc = "Unfold code" })

-- System clipboard copy/paste
map.set("n", "<leader>y", '"*y', { desc = "Copy to system clipboard" })
map.set("n", "<leader>p", '"*p', { desc = "Paste from system clipboard" })
