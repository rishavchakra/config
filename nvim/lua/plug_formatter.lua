local use = require('plugpacker').use
local M = {}

function M.setup()
    local tab2 = { tab_width = 2 }
    local tab4 = { tab_width = 4 }
    use {
        'lukas-reineke/lsp-format.nvim',
        config = function()
            require('lsp-format').setup({
                javascript = tab2,
                typescript = tab2,
                javascriptreact = tab2,
                typescriptreact = tab2,
                vue = tab2,
                svelte = tab2,
                html = tab2,

                rust = tab4,
                cpp = tab4,
                c = tab4,
                lua = tab4,
                python = tab4,
                go = tab4
            })
        end
    }
end

function M.after()
end

return M
