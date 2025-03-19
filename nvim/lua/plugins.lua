return {
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
        event = "VeryLazy"
	},
}
