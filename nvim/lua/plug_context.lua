local use = require('plugpacker').use
local M = {}

function M.setup()
    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup({
                max_lines = 2,
                trim_scope = 'outer',
            })
        end
    }
end

function M.after()

end

return M
