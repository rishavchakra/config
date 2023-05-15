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
    },
    {
        'numToStr/Comment.nvim',
    },
}
