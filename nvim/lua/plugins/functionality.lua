local pre_surround = "Surround: "
local pre_spectre = "Spectre: "

return {
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
	},
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		opts = {
			check_ts = true,
			fast_wrap = {
				map = "<A-s>",
				chars = { "{", "[", "(", '"', "'", "<" },
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = function()
			vim.g["surround_no_mappings"] = 1
			require("nvim-surround").setup()
		end,
		keys = {
			{ "ds",  "<plug>Dsurround",  desc = pre_surround .. "delete" },
			{ "cs",  "<plug>Csurround",  desc = pre_surround .. "change" },
			{ "cS",  "<plug>CSurround" },
			{ "ys",  "<plug>Ysurround",  desc = pre_surround .. "add" },
			{ "yS",  "<plug>YSurround" },
			{ "yss", "<plug>Yssurround" },
			{ "ySs", "<plug>YSsurround" },
			{ "ySS", "<plug>YSsurround" },
			{ "gs",  "<plug>VSurround",  mode = "x" },
			{ "gS",  "<plug>VgSurround", mode = "x" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>fr", '<cmd>lua require("spectre").toggle()<cr>', desc = pre_spectre .. "toggle" },
			{
				"<leader>fw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
				desc = pre_spectre .. "find current word",
			},
			{
				"<leader>fc",
				'<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
				desc = pre_spectre .. "find current word in file",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			labels = "arstgmneioqwfpbjluyxcdvzkh",
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
