vim.cmd [[highlight IndentLineKanagawa guibg=#16161d gui=nocombine]]
-- vim.cmd [[highlight IndentLineCatppuccin guibg=#181825 gui=nocombine]]
local highlight = {
    "Whitespace",
    "IndentLineKanagawa",
    -- "#16161d",
    -- "Gutter",
    -- "WinSeparator",
    -- "CursorColumn",
}
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
        main = 'ibl',
        event = 'BufEnter',
        opts = {
            indent = { highlight = highlight, char = "" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            -- scope = { enabled = false },
        }
        -- opts = {
        --     show_current_context = true,
        --     show_current_context_start = false,
        --     char = '',
        --     char_highlight_list = {
        --         'IndentBlanklineIndent1',
        --         'IndentBlanklineIndent2',
        --     },
        --     space_char_highlight_list = {
        --         'IndentBlanklineIndent1',
        --         'IndentBlanklineIndent2',
        --     },
        --     show_trailing_blankline_indent = false,
        -- }
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
