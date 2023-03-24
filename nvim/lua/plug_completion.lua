local use = require('plugpacker').use
local M = {}

function M.setup()
    use { 'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'andersevenrud/cmp-tmux',
        'Saecki/crates.nvim',
        'David-Kunz/cmp-npm',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
    config = function()
        local plug_cmp = require('cmp')
        local plug_kind = require('lspkind')
        plug_cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },

            mapping = plug_cmp.mapping.preset.insert({
                ['<Tab>'] = plug_cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = plug_cmp.mapping.confirm({ select = true }),
            }),

            sources = plug_cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
            }, {
                { name = 'buffer' },
            }),

            formatting = {
                format = plug_kind.cmp_format({
                    mode = 'symbol_text',
                    menu = {
                        buffer = '[BUF]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[SNP]',
                    }
                })
            },

            experimental = {
                ghost_text = true,
            }
        })

        plug_cmp.setup.filetype('gitcommit', {
            sources = plug_cmp.config.sources({
                { name = 'cmp_git' },
            }, {
                { name = 'buffer' },
            })
        })

        plug_cmp.setup.cmdline('/', {
            mapping = plug_cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        plug_cmp.setup.cmdline(':', {
            mapping = plug_cmp.mapping.preset.cmdline(),
            sources = plug_cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end
}
end

function M.after()

end

return M
