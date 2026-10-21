vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
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
vim.o.shell = 'zsh'
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
vim.o.foldlevelstart = -1
vim.o.foldlevel = 99
vim.o.foldtext = ""
vim.o.foldnestmax = 3
vim.o.cursorline = true

-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd "filetype plugin indent on"

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',    version = 'master' },
    { src = 'https://github.com/rebelot/kanagawa.nvim' },
    { src = 'https://github.com/ntk148v/komau.vim' },
    { src = 'https://github.com/oskarnurm/koda.nvim' },
    { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/kylechui/nvim-surround' },
    { src = 'https://github.com/tpope/vim-fugitive' },
    { src = 'https://github.com/lervag/vimtex' },
    -- { src = 'https://github.com/kiyoon/jupynium.nvim' },

    -- Completion and Snippets
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-buffer' },
    { src = 'https://github.com/hrsh7th/cmp-path' },
    { src = 'https://github.com/hrsh7th/cmp-cmdline' },
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
    { src = 'https://github.com/micangl/cmp-vimtex' },
    { src = 'https://github.com/onsails/lspkind.nvim' },

    { src = 'https://github.com/echasnovski/mini.ai' },
    { src = 'https://github.com/echasnovski/mini.align' },
    { src = 'https://github.com/echasnovski/mini.bracketed' },
    { src = 'https://github.com/echasnovski/mini.comment' },
    { src = 'https://github.com/echasnovski/mini.pairs' },
    { src = 'https://github.com/echasnovski/mini.pick' },
    { src = 'https://github.com/echasnovski/mini.splitjoin' },
})

require 'mini.ai'.setup()
require 'mini.align'.setup()
require 'mini.bracketed'.setup()
require 'mini.comment'.setup()
require 'mini.pairs'.setup({
    mappings = {
        ['"'] = { action = 'close' },
        ["'"] = { action = 'close' },
    }
})
require 'mini.pick'.setup()
require 'mini.splitjoin'.setup()
require 'oil'.setup()
require 'nvim-surround'.setup()
require 'gruvbox'.setup({
    overrides = {
        SignColumn = { bg = "#1d2021" },
        WinBarNC = { bg = "#1d2021" },
        StatusLineTerm = { bg = "#1d2021" }
    }
})
require 'kanagawa'.setup({
    theme = 'dragon',
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
require 'koda'.setup({
    transparent = true,
    theme = {
        dark = "dark",
        light = "glade",
    },
    auto = true,
    styles = {
        functions = { bold = true },
        -- keywords = { italic = true },
        comments = { italic = true },
    },
})
require 'komau'.setup({
    style = 'dark',
    transparent = true,
    dim_inactive = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        functions = { bold = true },
    },
    integrations = {
        treesitter = true,
        lsp = true,
        telescope = true,
        cmp = true,
        gitsigns = true,
        which_key = false,
        indent_blankline = true,
        mini = true,
        statusline = { lualine = true },
    },
})
require 'lualine'.setup({
    options = {
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})
require 'gitsigns'.setup()
require 'ibl'.setup({
    indent = {
        highlight = { "Whitespace", "SignColumn" },
        char = "",
    },
    whitespace = {
        highlight = { "Whitespace", "SignColumn" },
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
})
require 'luasnip.loaders.from_vscode'.load()
require 'cmp'.setup({
    enabled = function()
        local disabled = vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt'
        disabled = disabled or (vim.fn.reg_recording() ~= '')
        disabled = disabled or (vim.fn.reg_executing() ~= '')
        disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
        return not disabled
    end,
    expand = function(args)
        require 'luasnip'.lsp_expand(args.body)
    end,
    formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
            local kind = require 'lspkind'.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            return kind
        end
    },
    mapping = require 'cmp'.mapping.preset.insert(),
    sources = require 'cmp'.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'vimtex' },
        -- { name = 'jupynium' },
    }),
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
})
require 'cmp'.setup.cmdline({ '/', '?' }, {
    mapping = require 'cmp'.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- require('vim._core.ui2').enable({
--     enable = true,
--     msg = {
--         targets = 'cmd',
--         cmd = { height = 0.5 },
--         -- dialog = { height = 0.5 },
--         msg = { height = 0.5, timeout = 4000 },
--         pager = { height = 0.5 },
--     }
-- })

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1

vim.lsp.enable({
    'clangd',
    'cmake',
    -- 'html-lsp',
    'julia-lsp',
    'lua_ls',
    -- 'mesonlsp',
    'oxfmt',
    'texlab',
    'tinymist',
    'ruff',
    'rust_analyzer',
    'svls',
    'texlab',
    'zls',
})

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
vim.lsp.config('*', {
    root_markers = { '.git', '.hg' },
    capabilities = capabilities,
})
vim.lsp.config('html-lsp', {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
    },
})
vim.lsp.config('julia-lsp', {})
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
vim.lsp.config('oxfmt', {})
vim.lsp.config('svls', {
    cmd = { 'svls' },
    filetypes = { 'verilog', 'systemverilog' },
})

-- LSP Functionality
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- keymap for vim.lsp.buf.implementation
        end
        -- if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
        --     vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        -- end
        if client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            local ran_once = false
            vim.lsp.handlers['experimental/serverStatus'] = function(_, result, ctx, _)
                if result.quiescent and not ran_once then
                    vim.lsp.inlay_hint.enable(false, nil)
                    vim.lsp.inlay_hint.enable(true, nil)
                    vim.lsp.handlers['experimental/serverStatus'] = nil
                    ran_once = true
                end
            end
            vim.keymap.set('n', '<leader>zh', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
            end)
        end
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
                end
            })
        end
    end
})
-- vim.api.nvim_create_autocmd("LspProgress", {
--     callback = function(ev)
--         vim.print(ev.data)
--         local value = ev.data.params.value
--         vim.api.nvim_echo({ { value.message or "done" } }, false, {
--             id = "lsp." .. ev.data.client_id,
--             kind = "progress",
--             source = "vim.lsp",
--             title = value.title,
--             status = value.kind ~= "end" and "running" or "success",
--             percent = value.percentage,
--         })
--     end,
-- })
-- vim.cmd('set completeopt+=noselect')

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
vim.keymap.set({ 'o', 'x' }, 'ih', require('gitsigns').select_hunk)

vim.cmd('colorscheme gruvbox')

-- Inherit Transparency from Ghostty
vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
