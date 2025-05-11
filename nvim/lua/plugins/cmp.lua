return {
	{
		'Saghen/blink.cmp',
		event = { "InsertEnter", "BufWritePre" },
		version = '1.*',
		dependencies = {
			'L3MON4D3/LuaSnip',
		},
		opts = {
			keymap = {
				preset = 'super-tab'
			},
			fuzzy = { implementation = "prefer_rust" },
			signature = {
				enabled = true,
			},
			snippets = { preset = 'luasnip' },
			completion = {
				list = {
					selection = {
						preselect = function(ctx)
							return not require('blink.cmp').snippet_active({ direction = 1 })
						end
					},
				},
				trigger = {
					show_in_snippet = false,
					show_on_insert_on_trigger_character = true,
					show_on_blocked_trigger_characters = { ' ', '\n', '\t' }
				},
				menu = {
					draw = {
						padding = { 0, 1 }, -- padding only on right side
						components = {
							kind_icon = {
								text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
							}
						}
					}
				}
			},
		},
	},
}
