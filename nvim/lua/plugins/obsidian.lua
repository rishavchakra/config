local prefix = "Obsidian: "
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian Vault/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian Vault/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- detect_cwd = true,
		disable_frontmatter = true,
		completion = {
			new_notes_location = "current_dir",
		},
		workspaces = {
			{
				name = "mail",
				path = "~/Documents/Obsidian Vault/",
			},
		},
	},
	keys = {
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = prefix .. "search files" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = prefix .. "search for text" },
		-- { "<leader>on", "<cmd>ObsidianNew<cr>", desc = prefix .. "new note" },
		{
			"<leader>ol",
			"<cmd>ObsidianLink<cr>",
			desc = prefix .. "link selection to note",
			mode = "v",
		},
		{
			"<leader>o[",
			"<esc>a]]<esc>gv<esc>o<esc>i[[<esc>",
			desc = prefix .. "convert selection to link",
			mode = "v",
		},
		{
			"<leader>og",
			"<cmd>ObsidianFollowLink<cr>",
			desc = prefix .. "follow link to note",
		},
		{
			"<leader>or",
			"<cmd>ObsidianBacklinks<cr>",
			desc = prefix .. "references of note",
		},
		{
			"<leader>oc",
			"<cmd>lua require('obsidian').util.toggle_checkbox()<cr>",
			desc = prefix .. "references of note",
		},
	},
}
