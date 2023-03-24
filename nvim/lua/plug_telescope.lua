local use = require('plugpacker').use
local M = {}

function M.setup()
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            -- Miscellaneous functionality
            'nvim-lua/plenary.nvim',
            -- For live grep
            'BurntSushi/ripgrep',
            -- Native C algorithm implementation for faster performance
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local fb_act = require('telescope').extensions.file_browser.actions
            local dropdown = { theme = "dropdown" }
            local cursor = { theme = "cursor" }
            require('telescope').setup({
                pickers = {
                    -- find_files = dropdown,
                    -- file_browser = dropdown,
                    live_grep = dropdown,
                    buffers = dropdown,
                    diagnostics = dropdown,

                    lsp_references = cursor,
                    lsp_document_symbols = cursor,
                    lsp_implementations = cursor,
                    lsp_definitions = cursor,
                    lsp_type_definitions = cursor,
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
                                ["<C-d>"] = fb_act.remove,
                                ["<C-a>"] = fb_act.create,
                                ["<C-r>"] = fb_act.rename,
                                ["<C-y>"] = fb_act.copy,
                                ["<C-m>"] = fb_act.move,
                                ["<C-u>"] = fb_act.goto_parent_dir,
                            },
                            ["n"] = {
                                ["a"] = fb_act.create,
                                ["u"] = fb_act.goto_parent_dir,
                            },
                        }
                    },
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown({})
                    }
                }
            })
        end
    }
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('ui-select')
end

function M.after()
    local map = vim.keymap
    local opts = { noremap = true }
    local silence = { noremap = true, silent = true }

    map.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', silence)
    map.set('n', '<leader>gg', '<cmd>Telescope live_grep<cr>', silence)
    map.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', silence)
    map.set('n', '<leader>gf', '<cmd>Telescope live_grep<cr>', opts)
    map.set('n', '<leader>gs', '<cmd>Telescope treesitter<cr>', silence)
    map.set('n', '<leader>?', '<cmd>Telescope commands<cr>', silence)
    map.set('n', '<leader>te', '<cmd>Telescope file_browser<cr>', silence)
end

return M
