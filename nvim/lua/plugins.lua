return {
    { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end, lazy = false },
    { 'folke/trouble.nvim', dependencies = 'nvim-tree/nvim-web-devicons', event = "VeryLazy" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
}
