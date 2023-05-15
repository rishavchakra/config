-- "nvim-web-devicons": { "branch": "master", "commit": "4ec26d67d419c12a4abaea02f1b6c57b40c08d7e" },
return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        event = 'VimEnter',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            view = {
                adaptive_size = true,
                -- mappings = {
                    -- list = {
                        -- { key = 'u', action = 'dir_up' },
                    -- },
                -- },
                side = 'right',
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            renderer = {
                group_empty = true,
                highlight_opened_files = 'icon',
                indent_markers = { enable = true },
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
                expand_all = {
                    exclude = { '.git', 'target', 'build' },
                },
            },
            on_attach = function (bufnr)
                local api = require('nvim-tree.api')

                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Default mappings. Feel free to modify or remove as you wish.
                --
                -- BEGIN_DEFAULT_ON_ATTACH
                require('nvim-tree.api').config.mappings.default_on_attach(bufnr)
                -- END_DEFAULT_ON_ATTACH

                vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
            end
        },
        keys = {
            { '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', desc = 'NvimTree' }
        },
        config = function (_, opts)
            require('nvim-tree').setup(opts)
        end
    },
}
