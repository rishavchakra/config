local use = require('plugpacker').use
local M = {}

function M.setup()
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-tree').setup {
                sort_by = "name",
                disable_netrw = true,
                -- hijack_netrw = false,
                hijack_cursor = true,
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
                            { key = "u", action = "dir_up" },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true
                },
                renderer = {
                    group_empty = true,
                    highlight_opened_files = 'icon',
                    indent_markers = {
                        enable = true,
                    }
                },
                actions = {
                    open_file = {
                        quit_on_open = true
                    }
                },
            }
        end
    }
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "", texthl = "DiagnosticSignHint" })
        end,
    }
end

function M.after()
    local map = vim.keymap
    local opts = { noremap = true, silent = true }
    map.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', opts)
    vim.cmd('Neotree toggle float')
end

return M
