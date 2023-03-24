local use = require('plugpacker').use
local M = {}
local colorscheme = 'kanagawa'

function M.setup()
    use { 'ellisonleao/gruvbox.nvim',
        'sainnhe/everforest',
        {
            'rebelot/kanagawa.nvim',
            config = function()
                require('kanagawa').setup({
                    keywordStyle = { italic = true },
                    colors = {
                        theme = {
                            wave = {
                                ui = { bg_gutter = '#1F1F28' }
                            }
                        }
                    },
                    overrides = function(colors)
                        local theme = colors.theme
                        return {
                            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                            PmenuSbar = { bg = theme.ui.bg_m1 },
                            PmenuThumb = { bg = theme.ui.bg_p2 },
                        }
                    end,
                })
            end
        }
    }
end

function M.after()
    local status, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
    if not status then
        print('Colorscheme load error')
        return
    end
end

return M
