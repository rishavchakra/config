local use = require('plugpacker').use
local M = {}

function M.setup()
    use { 'williamboman/mason-lspconfig.nvim',
    requires = {
        'williamboman/mason.nvim',
        'mfussenegger/nvim-dap'
    },
    config = function ()
        require('mason').setup()
        require('mason-lspconfig').setup({
            automatic_installation = true,
            ui = {
                icons = {
                    server_installed = "✓",
                    server_pending = "➜",
                    server_uninstalled = "✗"
                }
            }
        })
    end
}
end

return M
