return {
	{
		'rebelot/kanagawa.nvim',
		priority = 1001,
		lazy = false,
		event = 'VimEnter',
		init = function()
			vim.cmd('colorscheme kanagawa')
		end
	},
	{
		'folke/snacks.nvim',
		dependencies = {
			'rebelot/kanagawa.nvim'
		},
		event = 'VimEnter',
		lazy = false,
		priority = 1000,
		opts = function()
			local colors = require('kanagawa.colors').setup()
			local palette_colors = colors.palette
			return {
				indent = {
					hl = {
						palette_colors.sumiInk1,
						palette_colors.sumiInk0,
					},
					animate = {
						enabled = false
					}
				},
				picker = {},
				lazygit = {
					theme_path = svim.fs.normalize(os.getenv('XDG_CONFIG_HOME') .. '/lazygit/config.yml')
				},
				dashboard = {
					preset = {
						--@format: disable
						header = [[
----------.,ldddl;.--------------------------
--------.:OXX0MxNOo;.------------------------
-------.lXNO,,,,,;kc.------------------------
---...cokX0;,,,,,;Oo,------------------------
----.;dkk0KOo;,,;kKKd'------------...--------
-----.';ckXWN0kk0XNX0xo:.....',;oOOko.-------
-------.':dOXXXXNWMMWNNNKKKXXXNNNWKl.--------
--------.;xKXKXMMMMMMMMMWNNXXNNKdcl;.--------
--------.dXWNNWMMMMMMMMMMNKKXNN0,------------
--------'kXNWWMMMMMMMMMMMMWNNX0o.------------
-------.c0WMMMWWWWWWNWWMMMWXXX0xol;..--------
-----.:kNMMMMWNKXNNNXXNNNXXNWWMMMWNKOdc.-----
----.dNWWMWKddOXNK0XWNXKXWMMWNNWWWWWWNXOc;::'
-.;d0NWNXk:.-.:0XK00K00XMMMMMNKkocokXXXWNXXKk
'kXNNWNXKl.----.';oxdddOXWMMMMWNO:..';lONNX0c
-,dk0Ko,;,---------...-.'cxKXNWWWKdc,.-.;oo,
---..'.--------------------.:d0NNXKXXx.------
------------------------------'dXNXNN0;------
-------------------------------.;ok0Kx'------
----------------------------------....-------]]
						--@format: enable
					},
					sections = {
						{ section = "header" },
						{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
						{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
						{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
						{ section = "startup" },
					},
				}
			}
		end,
		keys = {
			-- Top Pickers & Explorer
			{ "<leader><space>", function() Snacks.picker.files() end,                                   desc = "Find Files" },
			{ "<leader>ff",      function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
			{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
			-- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
			-- find
			{ "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
			{ "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
			{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
			-- git
			{ "<leader>gg",      function() Snacks.lazygit.open() end,                                   desc = "Git Branches" },
			{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
			{ "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
			{ "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
			{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
			{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
			{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
			{ "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
			-- Grep
			{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
			{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
			{ "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
			-- search
			{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
			{ '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
			{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
			{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
			{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
			{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
			{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
			{ "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
			{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
			{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
			{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
			{ "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
			{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
			{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
			{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
			{ "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
			{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
			{ "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
			{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
			{ "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
			-- LSP
			{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
			{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
			{ "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
			{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
			{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
			{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
			{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- which key integration
			"folke/which-key.nvim",
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		keys = {
			{ "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                 desc = "Redirect Cmdline" },
			{ "<leader>snl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
			{ "<leader>snh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
			{ "<leader>sna", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
			{ "<leader>snd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
			{ "<leader>un",  function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
			{ "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
			{ "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
		},
	},
	{
		"mikavilpas/yazi.nvim",
		event = 'VeryLazy',
		dependencies = {
			"folke/snacks.nvim"
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
			vim.g.loaded_netrw = 1
		end,
		keys = {
			{
				"<leader>fe",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
				noremap = true,
				silent = true,
				nowait = true,
			},
			{
				"<leader>E",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
				noremap = true,
				silent = true,
				nowait = true,
			},
			{
				"<leader>fE",
				"<cmd>Yazi cwd<cr>",
				desc = "Open yazi at the project root",
				noremap = true,
				silent = true,
				nowait = true,
			},
		},
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {
			signs = {
				add          = { text = '│' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
		}
	},
	{
		"rebelot/heirline.nvim",
		dependencies = {
			"rebelot/kanagawa.nvim",
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
			'lewis6991/gitsigns.nvim',
		},
		event = "VeryLazy",
		opts = function()
			local conditions = require("heirline.conditions")
			local utils = require("heirline.utils")
			local colors = require('kanagawa.colors').setup()
			local theme_colors = colors.theme
			local palette_colors = colors.palette

			local Align = { provider = "%=" }
			local Space = { provider = " " }

			-- local theme_colors = {
			-- 	bright_bg = utils.get_highlight("Folded").bg,
			-- 	bright_fg = utils.get_highlight("Folded").fg,
			-- 	red = utils.get_highlight("DiagnosticError").fg,
			-- 	dark_red = utils.get_highlight("DiffDelete").bg,
			-- 	green = utils.get_highlight("String").fg,
			-- 	blue = utils.get_highlight("Function").fg,
			-- 	gray = utils.get_highlight("NonText").fg,
			-- 	orange = utils.get_highlight("Constant").fg,
			-- 	purple = utils.get_highlight("Statement").fg,
			-- 	cyan = utils.get_highlight("Special").fg,
			-- 	diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			-- 	diag_error = utils.get_highlight("DiagnosticError").fg,
			-- 	diag_hint = utils.get_highlight("DiagnosticHint").fg,
			-- 	diag_info = utils.get_highlight("DiagnosticInfo").fg,
			-- 	git_del = utils.get_highlight("diffDeleted").fg,
			-- 	git_add = utils.get_highlight("diffAdded").fg,
			-- 	git_change = utils.get_highlight("diffChanged").fg,
			-- }
			-- local function setup_colors()
			-- 	return theme_colors
			-- end

			-- require("heirline").load_colors(setup_colors)
			-- or pass it to config.opts.colors

			-- vim.api.nvim_create_augroup("Heirline", { clear = true })
			-- vim.api.nvim_create_autocmd("ColorScheme", {
			-- 	callback = function()
			-- 		utils.on_colorscheme(setup_colors)
			-- 	end,
			-- 	group = "Heirline",
			-- })
			local mode_names = {
				n = "N",
				no = "N?",
				nov = "N?",
				noV = "N?",
				["no\22"] = "N?",
				niI = "Ni",
				niR = "Nr",
				niV = "Nv",
				nt = "Nt",
				v = "V",
				vs = "Vs",
				V = "V_",
				Vs = "Vs",
				["\22"] = "^V",
				["\22s"] = "^V",
				s = "S",
				S = "S_",
				["\19"] = "^S",
				i = "I",
				ic = "Ic",
				ix = "Ix",
				R = "R",
				Rc = "Rc",
				Rx = "Rx",
				Rv = "Rv",
				Rvc = "Rv",
				Rvx = "Rv",
				c = "C",
				cv = "Ex",
				r = "...",
				rm = "M",
				["r?"] = "?",
				["!"] = "!",
				t = "T",
			}
			local mode_colors = {
				n = palette_colors.autumnRed,
				i = palette_colors.crystalBlue,
				v = palette_colors.oniViolet,
				V = palette_colors.oniViolet,
				["\22"] = palette_colors.oniViolet,
				c = palette_colors.sumiOrange,
				s = palette_colors.springGreen,
				S = palette_colors.springGreen,
				["\19"] = palette_colors.springGreen,
				R = palette_colors.waveAqua1,
				r = palette_colors.waveAqua1,
				["!"] = palette_colors.samuraiRed,
				t = palette_colors.peachRed,
			}

			local ViMode = {
				init = function(self)
					self.vim_mode = vim.fn.mode(1) -- :h mode()
				end,
				provider = function(self)
					return "   %2( " .. mode_names[self.vim_mode] .. " %) "
				end,
				hl = function(self)
					local mode = self.vim_mode:sub(1, 1) -- get only the first mode character
					return {
						fg = palette_colors.sumiInk0,
						bg = mode_colors[mode],
						bold = true,
					}
				end,
				update = {
					"ModeChanged",
					pattern = "*:*",
					callback = vim.schedule_wrap(function()
						vim.cmd("redrawstatus")
					end),
				},
			}

			local FileNameBlock = {
				init = function(self)
					self.filename = vim.api.nvim_buf_get_name(0)
				end,
			}

			local FileIcon = {
				init = function(self)
					local filename = self.filename
					local extension = vim.fn.fnamemodify(filename, ":e")
					self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
						{ default = true })
				end,
				provider = function(self)
					return self.icon and (self.icon .. " ")
				end,
				hl = function(self)
					return { fg = self.icon_color }
				end
			}

			local FileName = {
				provider = function(self)
					-- first, trim the pattern relative to the current directory. For other
					-- options, see :h filename-modifers
					local filename = vim.fn.fnamemodify(self.filename, ":.")
					if filename == "" then return "[No Name]" end
					-- now, if the filename would occupy more than 1/4th of the available
					-- space, we trim the file path to its initials
					-- See Flexible Components section below for dynamic truncation
					if not conditions.width_percent_below(#filename, 0.25) then
						filename = vim.fn.pathshorten(filename)
					end
					return filename
				end,
				hl = { fg = utils.get_highlight("Directory").fg },
			}

			local FileFlags = {
				{
					condition = function()
						return vim.bo.modified
					end,
					provider = "[+]",
					hl = { fg = palette_colors.autumnGreen },
				},
				{
					condition = function()
						return not vim.bo.modifiable or vim.bo.readonly
					end,
					provider = "",
					hl = { fg = palette_colors.roninYellow },
				},
			}

			-- Now, let's say that we want the filename color to change if the buffer is
			-- modified. Of course, we could do that directly using the FileName.hl field,
			-- but we'll see how easy it is to alter existing components using a "modifier"
			-- component

			local FileNameModifer = {
				hl = function()
					if vim.bo.modified then
						-- use `force` because we need to override the child's hl foreground
						return { fg = colors.cyan, bold = true, force = true }
					end
				end,
			}

			-- let's add the children to our FileNameBlock component
			FileNameBlock = utils.insert(FileNameBlock,
				FileIcon,
				utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
				FileFlags,
				{ provider = '%<' }          -- this means that the statusline is cut here when there's not enough space
			)

			-- Awesome plugin

			-- The easy way.
			local Navic = {
				condition = function() return require("nvim-navic").is_available() end,
				provider = function()
					return require("nvim-navic").get_location({ highlight = true })
				end,
				update = 'CursorMoved'
			}

			-- Full nerd (with icon colors and clickable elements)!
			-- works in multi window, but does not support flexible components (yet ...)
			local Navic = {
				condition = function() return require("nvim-navic").is_available() end,
				static = {
					-- create a type highlight map
					type_hl = {
						File = "Directory",
						Module = "@include",
						Namespace = "@namespace",
						Package = "@include",
						Class = "@structure",
						Method = "@method",
						Property = "@property",
						Field = "@field",
						Constructor = "@constructor",
						Enum = "@field",
						Interface = "@type",
						Function = "@function",
						Variable = "@variable",
						Constant = "@constant",
						String = "@string",
						Number = "@number",
						Boolean = "@boolean",
						Array = "@field",
						Object = "@type",
						Key = "@keyword",
						Null = "@comment",
						EnumMember = "@field",
						Struct = "@structure",
						Event = "@keyword",
						Operator = "@operator",
						TypeParameter = "@type",
					},
					-- bit operation dark magic, see below...
					enc = function(line, col, winnr)
						return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
					end,
					-- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
					dec = function(c)
						local line = bit.rshift(c, 16)
						local col = bit.band(bit.rshift(c, 6), 1023)
						local winnr = bit.band(c, 63)
						return line, col, winnr
					end
				},
				init = function(self)
					local data = require("nvim-navic").get_data() or {}
					local children = {}
					-- create a child for each level
					for i, d in ipairs(data) do
						-- encode line and column numbers into a single integer
						local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
						local child = {
							{
								provider = d.icon,
								hl = self.type_hl[d.type],
							},
							{
								-- escape `%`s (elixir) and buggy default separators
								provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ''),
								-- highlight icon only or location name as well
								-- hl = self.type_hl[d.type],

								on_click = {
									-- pass the encoded position through minwid
									minwid = pos,
									callback = function(_, minwid)
										-- decode
										local line, col, winnr = self.dec(minwid)
										vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
									end,
									name = "heirline_navic",
								},
							},
						}
						-- add a separator only if needed
						if #data > 1 and i < #data then
							table.insert(child, {
								provider = " > ",
								hl = { fg = colors.gray },
							})
						end
						table.insert(children, child)
					end
					-- instantiate the new child, overwriting the previous one
					self.child = self:new(children, 1)
				end,
				-- evaluate the children containing navic components
				provider = function(self)
					return self.child:eval()
				end,
				hl = { fg = colors.gray },
				update = 'CursorMoved'
			}

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = '',
						[vim.diagnostic.severity.WARN] = '',
						[vim.diagnostic.severity.INFO] = '󰋇',
						[vim.diagnostic.severity.HINT] = '󰌵',
					},
				},
			})

			local error_icon = ''
			local warn_icon = ''
			local info_icon = '󰋇'
			local hint_icon = '󰌵'

			local Diagnostics = {
				condition = conditions.has_diagnostics,
				-- Example of defining custom LSP diagnostic icons, you can copypaste in your config:
				-- Fetching custom diagnostic icons

				-- If you defined custom LSP diagnostics with vim.fn.sign_define(), use this instead
				-- Note defining custom LSP diagnostic this way its deprecated, though
				--static = {
				--    error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
				--    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
				--    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
				--    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
				--},

				init = function(self)
					self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
					self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
					self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
					self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
				end,

				update = { "DiagnosticChanged", "BufEnter" },

				{
					provider = "![",
				},
				{
					provider = function(self)
						-- 0 is just another output, we can decide to print it or not!
						return self.errors > 0 and (error_icon .. self.errors .. " ")
					end,
					hl = { fg = palette_colors.autumnRed },
				},
				{
					provider = function(self)
						return self.warnings > 0 and (warn_icon .. self.warnings .. " ")
					end,
					hl = { fg = palette_colors.autumnYellow },
				},
				{
					provider = function(self)
						return self.info > 0 and (info_icon .. self.info .. " ")
					end,
					hl = { fg = palette_colors.waveAqua1 },
				},
				{
					provider = function(self)
						return self.hints > 0 and (hint_icon .. self.hints)
					end,
					hl = { fg = palette_colors.dragonBlue },
				},
				{
					provider = "]",
				},
			}

			local Git = {
				condition = conditions.is_git_repo,

				init = function(self)
					self.status_dict = vim.b.gitsigns_status_dict
					self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or
						self.status_dict.changed ~= 0
				end,

				hl = { fg = palette_colors.oldWhite },


				{ -- git branch name
					provider = function(self)
						return " " .. self.status_dict.head
					end,
					condition = conditions.is_git_repo,
					hl = { bold = true }
				},
				-- You could handle delimiters, icons and counts similar to Diagnostics
				{
					condition = function(self)
						return conditions.is_git_repo and self.has_changes
					end,
					provider = "("
				},
				{
					condition = function(self)
						return conditions.is_git_repo and self.has_changes
					end,
					provider = function(self)
						local count = self.status_dict.added or 0
						return count > 0 and ("+" .. count)
					end,
					hl = { fg = palette_colors.autumnGreen },
				},
				{
					condition = function(self)
						return conditions.is_git_repo and self.has_changes
					end,
					provider = function(self)
						local count = self.status_dict.removed or 0
						return count > 0 and ("-" .. count)
					end,
					hl = { fg = palette_colors.autumnRed },
				},
				{
					condition = function(self)
						return conditions.is_git_repo and self.has_changes
					end,
					provider = function(self)
						local count = self.status_dict.changed or 0
						return count > 0 and ("~" .. count)
					end,
					hl = { fg = palette_colors.autumnYellow },
				},
				{
					condition = function(self)
						return conditions.is_git_repo and self.has_changes
					end,
					provider = ")",
				},
			}

			local SearchCount = {
				condition = function()
					return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
				end,
				init = function(self)
					local ok, search = pcall(vim.fn.searchcount)
					if ok and search.total then
						self.search = search
					end
				end,
				provider = function(self)
					local search = self.search
					return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
				end,
			}

			local MacroRec = {
				condition = function()
					return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
				end,
				provider = " ",
				hl = { fg = "orange", bold = true },
				utils.surround({ "[", "]" }, nil, {
					provider = function()
						return vim.fn.reg_recording()
					end,
					hl = { fg = palette_colors.springGreen, bold = true },
				}),
				update = {
					"RecordingEnter",
					"RecordingLeave",
				}
			}
			-- lualine_z = { 'os.date("%a %h %d")', '%{strftime("%-H:%M")}' },
			local Time = {
				provider = function(_)
					return " " .. os.date("%a %h %d %H:%M") .. " "
				end,
				hl = {
					fg = palette_colors.sumiInk0,
					bg = palette_colors.crystalBlue,
				}
			}

			local TablineFileName = {
				provider = function(self)
					-- self.filename will be defined later, just keep looking at the example!
					local filename = self.filename
					filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
					return filename
				end,
				hl = function(self)
					return { bold = self.is_active or self.is_visible, italic = true }
				end,
			}

			local TablineFileFlags = {
				{
					condition = function(self)
						return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
					end,
					provider = "[+]",
					hl = { fg = palette_colors.springGreen },
				},
				{
					condition = function(self)
						return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
							or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
					end,
					provider = function(self)
						if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
							return "  "
						else
							return ""
						end
					end,
					hl = { fg = palette_colors.roninYellow },
				},
			}

			local TablineFileNameBlock = {
				init = function(self)
					self.filename = vim.api.nvim_buf_get_name(self.bufnr)
				end,
				hl = function(self)
					if self.is_active then
						return "TabLineSel"
					else
						return "TabLine"
					end
				end,
				on_click = {
					callback = function(_, minwid, _, button)
						if (button == "m") then -- close on mouse middle click
							vim.schedule(function()
								vim.api.nvim_buf_delete(minwid, { force = false })
							end)
						else
							vim.api.nvim_win_set_buf(0, minwid)
						end
					end,
					minwid = function(self)
						return self.bufnr
					end,
					name = "heirline_tabline_buffer_callback",
				},
				FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
				TablineFileName,
				TablineFileFlags,
			}

			local TablineCloseButton = {
				condition = function(self)
					return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
				end,
				{ provider = " " },
				{
					provider = "",
					hl = { fg = palette_colors.sumiInk4 },
					on_click = {
						callback = function(_, minwid)
							vim.schedule(function()
								vim.api.nvim_buf_delete(minwid, { force = false })
								vim.cmd.redrawtabline()
							end)
						end,
						minwid = function(self)
							return self.bufnr
						end,
						name = "heirline_tabline_close_buffer_callback",
					},
				},
			}

			local TablineBufferBlock = utils.surround({ "", "" }, function(self)
				if self.is_active then
					return utils.get_highlight("TabLineSel").bg
				else
					return utils.get_highlight("TabLine").bg
				end
			end, { TablineFileNameBlock, TablineCloseButton })

			local get_bufs = function()
				return vim.tbl_filter(function(bufnr)
					return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
				end, vim.api.nvim_list_bufs())
			end

			-- initialize the buflist cache
			local buflist_cache = {}

			-- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
			vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						local buffers = get_bufs()
						for i, v in ipairs(buffers) do
							buflist_cache[i] = v
						end
						for i = #buffers + 1, #buflist_cache do
							buflist_cache[i] = nil
						end

						-- check how many buffers we have and set showtabline accordingly
						if #buflist_cache > 1 then
							vim.o.showtabline = 2 -- always
						elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
							vim.o.showtabline = 1 -- only when #tabpages > 1
						end
					end)
				end,
			})

			local BufferLine = utils.make_buflist(
				TablineBufferBlock,
				{ provider = " ", hl = { fg = "gray" } },
				{ provider = " ", hl = { fg = "gray" } },
				-- out buf_func simply returns the buflist_cache
				function()
					return buflist_cache
				end,
				-- no cache, as we're handling everything ourselves
				false
			)

			local WinBars = {
				fallthrough = false,
				{ -- A winbar for active files
					condition = function()
						return conditions.is_active() and not conditions.buffer_matches({ buftype = { "terminal" } })
					end,
					utils.surround({ "", "" }, palette_colors.springViolet1,
						{ hl = { fg = palette_colors.sumiInk0, force = true }, FileNameBlock }),
				},
				{ -- A winbar for inactive files
					condition = function()
						return not conditions.is_active() and not conditions.buffer_matches({ buftype = { "terminal" } })
					end,
					utils.surround(
						{ "", "" },
						palette_colors.sumiInk1,
						{
							hl = {
								fg = palette_colors.oldWhite,
								bg = palette_colors.sumiInk1,
								force = true
							},
							FileNameBlock
						}
					),
				},
			}

			return {
				statusline = {
					MacroRec,
					Space,
					ViMode,
					Space,
					FileNameBlock,
					Space,
					Navic,
					Align,
					-- Diagnostics,
					SearchCount,
					Space,
					Diagnostics,
					Space,
					Git,
					Space,
					Time
				},
				tabline = {
					BufferLine,
				},
				winbar = {
					WinBars,
				},
				opts = {
					colors = colors,
					disable_winbar_cb = function(args)
						return conditions.buffer_matches({
							buftype = { "nofile", "prompt", "help", "quickfix" },
							filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
						}, args.buf)
					end,
				}
			}
		end,
	},
}
