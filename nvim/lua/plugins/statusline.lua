return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'rebelot/kanagawa.nvim',
        },
        lazy = false,
        opts = {
            options = {
                -- No need, does it automatically
                -- theme = require('lualine.themes.kanagawa'),
                section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            },
            sections = {
                lualine_c = { 'filename' },

                lualine_x = { 'fileformat', 'filetype' },
                lualine_y = { 'progress', 'location' },
                lualine_z = { 'os.date("%a %h %d")', '%{strftime("%-H:%M")}' },
            },
        },
    }
}
