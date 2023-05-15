-- OLD VERSION
return {
    {
        'hrsh7th/cmp-nvim-lsp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            { 'Saecki/crates.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, version = 'v0.3.0' },
            -- Snippet engine
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',

            'onsails/lspkind.nvim',
        },
        opts = {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            mapping = require('cmp').mapping.preset.insert({
                ['<Tab>'] = require('cmp').mapping.confirm({ select = true }),
                ['<C-Space>'] = require('cmp').mapping.confirm({ select = true }),
            }),
            window = {
              -- completion = require('cmp').config.window.bordered(),
              -- documentation = require('cmp').config.window.bordered(),
            },
            sources = require('cmp').config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
                { name = 'buffer' },
                { name = 'crates' },
                { name = 'nvim_lsp_signature_help' },
            }, {
                { name = 'buffer' },
            }),
            formatting = {
                format = require('lspkind').cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '…',
                })
            },
            experimental = {
                ghost_text = true
            },
        },
        config = function(_, opts)
            local cmp = require('cmp')
            cmp.setup(opts)

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'nvim_lsp_document_symbol' },
                    { name = 'buffer' },
                }, {
                    { name = 'buffer' },
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    }
}
