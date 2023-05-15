return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        lazy = true,
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag'
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'rust',
                'tsx',
                'typescript',
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                    },
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    }
}
