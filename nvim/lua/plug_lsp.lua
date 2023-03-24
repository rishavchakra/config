local use = require('plugpacker').use
local M = {}

function M.setup()
    use { 'neovim/nvim-lspconfig',
        requires = {
            'onsails/lspkind.nvim',
            'hrsh7th/nvim-cmp',
            'williamboman/mason-lspconfig.nvim',
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        after = 'nvim-cmp'
    }
end

function M.after()
    require('plug_completion').after()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local lsp_installer = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    local opts = { noremap = true, silent = true }

    local on_attach = function(client, _)
        local map = vim.api.nvim_set_keymap
        -- Key mappings
        map('n', '<leader>ld', '<cmd>TroubleToggle lsp_definitions<CR>', opts)
        map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', '<leader>lr', '<cmd>TroubleToggle lsp_references<CR>', opts)
        map('n', '<leader>lt', '<cmd>TroubleToggle lsp_type_definitions<CR>', opts)
        map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        map('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

        require('lsp-format').on_attach(client)
    end

    local settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }

    local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    local cmds = {
        elixirls = { "/opt/homebrew/bin/elixir-ls" },
    }

    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    for _, server in ipairs(lsp_installer.get_installed_servers()) do
        local cmd = cmds[server]
        lspconfig[server].setup({
            opts = opts,
            on_attach = on_attach,
            settings = settings,
            handlers = handlers,
            capabilities = capabilities,
            cmd = cmd,
        })
    end
end

return M
