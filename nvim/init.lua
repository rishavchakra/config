vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.signcolumn = 'yes'
vim.o.winborder = 'rounded'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.hlsearch = true
vim.o.smartcase = true
vim.o.scrolloff = 2
vim.o.shell = 'fish'
vim.o.guicursor = 'n-v:block,i-c-ci:hor50,o-r:hor50'
vim.o.conceallevel = 2
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.list = true
vim.o.lcs = 'tab:> ,lead:·,trail:·,multispace:·'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 1
vim.o.cursorline = true

-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/rebelot/kanagawa.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/kylechui/nvim-surround' },
    { src = 'https://github.com/tpope/vim-fugitive' },

    { src = 'https://github.com/echasnovski/mini.ai' },
    { src = 'https://github.com/echasnovski/mini.align' },
    { src = 'https://github.com/echasnovski/mini.bracketed' },
    { src = 'https://github.com/echasnovski/mini.comment' },
    { src = 'https://github.com/echasnovski/mini.pairs' },
    { src = 'https://github.com/echasnovski/mini.pick' },
    { src = 'https://github.com/echasnovski/mini.splitjoin' },
})

vim.lsp.enable({
    'clangd',
    'cmake',
    'lua_ls',
    'marksman',
    'mesonlsp',
    'texlab',
    'tinymist',
    'ruff_lsp',
    'rust_analyzer',
    'texlab',
    'zls',
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

require 'mini.ai'.setup()
require 'mini.align'.setup()
require 'mini.bracketed'.setup()
require 'mini.comment'.setup()
require 'mini.pairs'.setup()
require 'mini.pick'.setup()
require 'mini.splitjoin'.setup()
require 'oil'.setup()
require 'nvim-surround'.setup()
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
require 'lualine'.setup({
    options = {
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})
require 'gitsigns'.setup()

-- LSP Autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end
})
vim.cmd('set completeopt+=noselect')

-- Base keymaps
vim.keymap.set('n', '<leader>s', ':update<CR>')
vim.keymap.set('n', '<leader>q', ':x<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', '<leader>wv', ':vsplit<CR><C-w>w')
vim.keymap.set('n', '<leader>wh', ':split<CR><C-w>w')
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Plugin keymaps
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>gs', require('gitsigns').stage_hunk)
vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk)
vim.keymap.set('v', '<leader>hs', function()
    require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)
vim.keymap.set('v', '<leader>hr', function()
    require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)
vim.keymap.set('n', '<leader>gS', require('gitsigns').stage_buffer)
vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer)
vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis)
vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk)
vim.keymap.set('n', '<leader>gP', require('gitsigns').preview_hunk_inline)
vim.keymap.set({'o', 'x'}, 'ih', require('gitsigns').select_hunk)

vim.cmd('colorscheme kanagawa')
