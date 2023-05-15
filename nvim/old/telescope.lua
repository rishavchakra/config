local M = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
        },
        opts = {
            pickers = { -- Configure the theme for individual telescope pickers
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                file_browser = {
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            ["<C-d>"] = require('telescope').extensions.file_browser.actions.remove,
                            ["<C-a>"] = require('telescope').extensions.file_browser.actions.create,
                            ["<C-r>"] = require('telescope').extensions.file_browser.actions.rename,
                            ["<C-y>"] = require('telescope').extensions.file_browser.actions.copy,
                            ["<C-m>"] = require('telescope').extensions.file_browser.actions.move,
                            ["<C-u>"] = require('telescope').extensions.file_browser.actions.goto_parent_dir,
                        },
                        ["n"] = {
                            ["a"] = require('telescope').extensions.file_browser.actions.create,
                            ["u"] = require('telescope').extensions.file_browser.actions.goto_parent_dir,
                        },
                    }
                },
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown({})
                }
            },
        },
    },
}

