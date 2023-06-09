local prefix = 'Telescope: '
return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        version = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    ozerride_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },
            pickers = {
                lsp_references = { theme = 'dropdown' },
                lsp_document_symbols = { theme = 'dropdown' },
                lsp_workspace_symbols = { theme = 'dropdown' },
                lsp_definitions = { theme = 'dropdown' },
                lsp_type_definitions = { theme = 'dropdown' },
                lsp_implementations = { theme = 'dropdown' },
                lsp_diagnostics = { theme = 'dropdown' },
            },
        },
        keys = {
            { '<leader><space>', '<cmd>Telescope find_files<cr>', desc = prefix .. 'find files' },
            { '<leader>ff', '<cmd>Telescope git_files<cr>', desc = prefix .. 'find git files' },
            { '<leader>fs', '<cmd>Telescope live_grep<cr>', desc = prefix .. 'find live grep' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = prefix .. 'buffers' },

            { '<leader>lr', '<cmd>Telescope lsp_references<cr>', desc = prefix .. 'LSP references' },
            { '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', desc = prefix .. 'LSP doc symbols' },
            { '<leader>lS', '<cmd>Telescope lsp_workspace_symbols<cr>', desc = prefix .. 'LSP all symbols' },
            { '<leader>ld', '<cmd>Telescope lsp_definitions<cr>', desc = prefix .. 'LSP definitions' },
            { '<leader>lD', '<cmd>Telescope lsp_type_definitions<cr>', desc = prefix .. 'LSP type definitions' },
            { '<leader>li', '<cmd>Telescope lsp_implementations<cr>', desc = prefix .. 'LSP impls' },
            { '<leader>lt', '<cmd>Telescope lsp_diagnostics<cr>', desc = prefix .. 'LSP diagnostics' },
        },
    },
}
