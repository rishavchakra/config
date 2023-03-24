local use = require('plugpacker').use
local M = {}

function M.setup()
    use { 'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function() require('nvim-treesitter.configs').setup({
                ensure_install = { 'rust', 'typescript', 'vue', 'cpp', 'cmake' },
                auto_install = true,
                highlight = { enable = true },
                autotag = { enable = true },
                indent = { enable = true },

                -- Treesitter Textobjects plugin
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    }
                }
            })
        end
    }
end

function M.after()
    print('Treesitter after configuration')
end

return M
