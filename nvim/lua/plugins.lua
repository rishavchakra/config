--[[ plugins.lua: Download all plugins and import configurations ]]

local packer = require('plugpacker')
local use = packer.use

packer.init()
packer.reset()

use 'wbthomason/packer.nvim'

--------------------------------
-- [[ Aesthetics ]]
--------------------------------
-- Color schemes
require('plug_theme').setup()

-- Tree Explorer view
require('plug_tree').setup()

-- Statusline
require('plug_lualine').setup()

--------------------------------
-- [[ Neovim LSP ]]
--------------------------------
require('plug_lsp').setup()

--Autocompletion
require('plug_completion').setup()

-- Rust tools
use { 'simrat39/rust-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
        'neovim/nvim-lspconfig'
    },
    config = "require('rust-tools')",
    ft = { 'rust', 'toml' }
}

--------------------------------
-- [[ Functionality ]]
--------------------------------
-- Treesitter ASTs
require('plug_treesitter').setup()

-- Telescope fuzzy finder
require('plug_telescope').setup()

-- LSP Installer
require('plug_lspinstaller').setup()

-- Formatter
require('plug_formatter').setup()

-- Context
require('plug_context').setup()

-- Commenting
use { 'numToStr/Comment.nvim', config = function() require('comment').setup() end }

-- Colorize hex values
use { 'lewis6991/nvim-colorizer.lua', config = function() require('colorizer').setup() end }

-- Git gutter signs
use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }

-- Quick navigation
use { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end }

-- Diagnostics view
use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require('trouble').setup() end }

-- Indentation guides
require('plug_indentguides').setup()

use {
    'tpope/vim-surround', -- Surround
    'tpope/vim-repeat', -- Repeating actions
    'jiangmiao/auto-pairs', -- Auto bracket pairs
    'windwp/nvim-ts-autotag', -- Auto tags
    'andymass/vim-matchup', -- Better matching
}

if PACKER_BOOTSTRAP then
    require('packer').sync()
end
