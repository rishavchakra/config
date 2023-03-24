local use = require('plugpacker').use
local M = {}

local colors = {
    black        = '#16161d',
    white        = '#c8c093',
    red          = '#ff5d62',
    green        = '#98bb6c',
    blue         = '#7e9cd8',
    yellow       = '#ffa066',
    purple       = '#957fb8',
    gray         = '#a89984',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
}
local kanagawa = {
    normal = {
        a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray }
    },
    insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.lightgray, fg = colors.white }
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.inactivegray, fg = colors.black }
    },
    replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white }
    },
    command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.inactivegray, fg = colors.black }
    },
    inactive = {
        a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray }
    }
}

function M.setup()
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    theme = kanagawa,
                    section_separators = { left = '', right = '' },
                    -- section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
                },
                sections = {
                    lualine_c = { 'filename' },
                    lualine_x = { 'fileformat', 'filetype' },
                    lualine_y = { 'progress', 'location' },
                    lualine_z = { 'os.date("%a %h %d")', '%{strftime("%-H:%M")}' }
                }
            })
        end
    }
end

function M.after()

end

return M
