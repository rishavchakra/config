return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        opts = {
            show_current_context = true,
            show_current_context_start = false,
            char = '',
            char_highlight_list = {
                'IndentBlanklineIndent1',
                'IndentBlanklineIndent2',
            },
            space_char_highlight_list = {
                'IndentBlanklineIndent1',
                'IndentBlanklineIndent2',
            },
            show_trailing_blankline_indent = false,
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'VeryLazy',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            max_lines = 2,
        },
    },
}
