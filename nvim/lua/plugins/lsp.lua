-- LSP Configuration
-- Enables all the required LSPs I want and need
-- A full list of servers and where to download them can be found here:
-- https://mason-registry.dev/registry/list

return {
	{
		'junnplus/lsp-setup.nvim',
		event = 'VeryLazy',
		dependencies = {
			'neovim/nvim-lspconfig',
			'SmiteshP/nvim-navic',
		},
		opts = {
			servers = {
				ast_grep = {},
				clangd = {},
				csharp_ls = {},
				lua_ls = {},
				ruff = {},
				rust_analyzer = {
					settings = {
						['rust-analyzer'] = {
							inlayHints = {
								bindingModeHints = {
									enable = false,
								},
								chainingHints = {
									enable = true,
								},
								closingBraceHints = {
									enable = true,
									minLines = 25,
								},
								closureReturnTypeHints = {
									enable = 'never',
								},
								lifetimeElisionHints = {
									enable = 'never',
									useParameterNames = false,
								},
								maxLength = 25,
								parameterHints = {
									enable = true,
								},
								reborrowHints = {
									enable = 'never',
								},
								renderColons = true,
								typeHints = {
									enable = true,
									hideClosureInitialization = false,
									hideNamedConstructor = false,
								}
							}
						}
					}
				},
				taplo = {},
				texlab = {},
				ts_ls = {},
				tsserver = {},
				zls = {
					settings = {
						zls = {
							enable_inlay_hints = true,
							inlay_hints_show_builtin = true,
							inlay_hints_exclude_single_argument = true,
							inlay_hints_hide_redundant_param_names = false,
							inlay_hints_hide_redundant_param_names_last_token = false,
						}
					}
				},
			},
			inlay_hints = {
				enabled = true,
			},
			on_attach = function(client, bufnr)
				require('lsp-setup.utils').format_on_save(client)
				if client.server_capabilities.documentSymbolProvider then
					require('nvim-navic').attach(client, bufnr)
				end
			end
		},
	},
	{
		'SmiteshP/nvim-navic',
		dependencies = {
			'neovim/nvim-lspconfig',
		},
	},
	{
		'nvimtools/none-ls.nvim',
	},
	{
		'lervag/vimtex',
		lazy = false,
		ft = "tex",
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_view_skim_activate = 1
		end,
	},
}
