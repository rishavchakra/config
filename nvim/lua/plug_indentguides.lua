local use = require('plugpacker').use
local M = {}

function M.setup()
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        space_char_blankline = ' ',
        show_current_context = true,
        show_current_context_start = false,
        char = "",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
      })
    end
  }
end

function M.after()
  vim.cmd('highlight IndentBlanklineIndent1 guibg=#1F1F28 gui=nocombine')
  vim.cmd('highlight IndentBlanklineIndent2 guibg=#1A1A22 gui=nocombine')
end

return M
