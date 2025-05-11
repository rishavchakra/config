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
				lua_ls = {},
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
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		vim.lsp.config('*', {
	-- 			capabilities = {
	-- 				textDocument = {
	-- 					semanticTokens = {
	-- 						multilineTokenSupport = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		vim.lsp.enable('asm-lsp')
	-- 		vim.lsp.enable('ast-grep')
	-- 		vim.lsp.enable('autoflake')
	-- 		vim.lsp.enable('autopep8')
	-- 		vim.lsp.enable('bibtex-tidy')
	-- 		vim.lsp.enable('clang-format')
	-- 		vim.lsp.enable('clangd')
	-- 		vim.lsp.enable('cmake-language-server')
	-- 		vim.lsp.enable('cpplint')
	-- 		vim.lsp.enable('docformatter')
	-- 		vim.lsp.enable('dotenv-linter')
	-- 		vim.lsp.enable('lua-language-server')
	-- 		vim.lsp.enable('flake8')
	-- 		vim.lsp.enable('gopls')
	-- 		vim.lsp.enable('json-lsp')
	-- 		vim.lsp.enable('just-lsp')
	-- 		vim.lsp.enable('ocaml-lsp')
	-- 		vim.lsp.enable('ruff')
	-- 		vim.lsp.enable('rust-analyzer')
	-- 		vim.lsp.enable('svls')
	-- 		vim.lsp.enable('systemd-language-server')
	-- 		vim.lsp.enable('taplo')
	-- 		vim.lsp.enable('texlab')
	-- 		vim.lsp.enable('typescript-language-server')
	-- 		vim.lsp.enable('wgsl_analyzer')
	--
	-- 	end
	-- },
	{
		'nvimtools/none-ls.nvim',
	},
	-- {
	-- 	'ray-x/lsp_signature.nvim',
	-- 	event = 'InsertEnter',
	-- },
}
