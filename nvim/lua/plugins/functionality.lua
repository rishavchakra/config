local pre_surround = 'Surround: '

return {
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPre', 'BufNewFile' },
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = { 'BufReadPre', 'BufNewFile' },
        lazy = false,
        opts = {
            check_ts = true,
            fast_wrap = {
                map = '<A-s>',
                chars = { '{', '[', '(', '"', "'", '<' },
            }
        },
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        opts = function()
            vim.g["surround_no_mappings"] = 1
            require('nvim-surround').setup()
        end,
        keys = {
            { 'ds', '<plug>Dsurround', desc = pre_surround .. 'delete' },
            { 'cs', '<plug>Csurround', desc = pre_surround .. 'change' },
            { 'cS', '<plug>CSurround' },
            { 'ys', '<plug>Ysurround', desc = pre_surround .. 'add' },
            { 'yS', '<plug>YSurround' },
            { 'yss', '<plug>Yssurround' },
            { 'ySs', '<plug>YSsurround' },
            { 'ySS', '<plug>YSsurround' },
            { 'gs', '<plug>VSurround', mode = 'x' },
            { 'gS', '<plug>VgSurround', mode = 'x' },
        },
    },
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        opts = {
            ignore = '^$'
        },
    },
}
