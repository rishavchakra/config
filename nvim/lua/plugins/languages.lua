return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
		enabled = false,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = "rust",
		event = "VeryLazy",
	},
	-- {
	--     'ziglang/zig.vim',
	--     ft = 'zig',
	--     event = 'VeryLazy',
	-- }
	{
		"jpfender/pipenv.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		ft = "python",
		init = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					require("pipenv").set_pipenv()
				end,
			})
		end,
	},
}
