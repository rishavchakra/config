return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = true,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                severity_sort = true,
            },
            capabilities = {},
            autoformat = true,
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            servers = {
                jsonls = {},
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            },
            setup = {
                tsserver = function(_, opts)
                    require('typescript').setup({ server = opts })
                    return true
                end
            },
        },
        config = function(_, opts)
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local lsp_installer = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            local have_mason, mlsp = pcall(require, 'mason-lspconfig')
            if (not have_mason) then
                print('Mason not found!')
            end

            local on_attach = function()
                require('keymap').lsp_keymaps(opts.keymap_opts)
            end

            local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

            print(lsp_installer.get_installed_servers())

            for _, server in ipairs(lsp_installer.get_installed_servers()) do
                lspconfig[server].setup({
                    opts = opts.keymap_opts,
                    on_attach = on_attach,
                    settings = opts.settings,
                    -- handlers = opts.handlers,
                    capabilities = capabilities,
                    cmd = opts.cmds[server]
                })
            end
        end,
    },
}
local M = {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'jose-elias-alvarez/typescript.nvim',
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            },
            -- Format on save
            autoformat = true,
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            servers = {
                -- For example
                -- jsonls = {},
            },
            setup = {
            },
            keymap_opts = {
                noremap = true,
                silent = true,
            },
            cmds = {
                elixirls = { "/opt/homebrew/bin/elixir-ls" },
            },
            handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            },
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            },
        },
        config = function(_, opts)
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local lsp_installer = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            local have_mason, mlsp = pcall(require, 'mason-lspconfig')
            if (not have_mason) then
                print('Mason not found!')
            end

            local on_attach = function()
                require('keymap').lsp_keymaps(opts.keymap_opts)
            end

            local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

            print(lsp_installer.get_installed_servers())

            for _, server in ipairs(lsp_installer.get_installed_servers()) do
                lspconfig[server].setup({
                    opts = opts.keymap_opts,
                    on_attach = on_attach,
                    settings = opts.settings,
                    -- handlers = opts.handlers,
                    capabilities = capabilities,
                    cmd = opts.cmds[server]
                })
            end

            --[[
            local function setup(server)
                local server_opts = vim.tbl_deep_extend('force', {
                    capabilities = vim.deepcopy(capabilities),
                }, opts.servers[server] or {})

                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup['*'] then
                    if opts.setup['*'](server, server_opts) then
                        return
                    end
                end
                require('lspconfig')[server].setup(server_opts)
            end

            local have_mason, mlsp = pcall(require, 'mason-lspconfig')
            local all_mlsp_servers = {}
            if have_mason then
                all_mlsp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
            end

            local ensure_installed = {}
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            if have_mason then
                mlsp.setup({ ensure_installed = ensure_installed })
                mlsp.setup_handlers({ setup })
            end
            ]]
        end,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
    },
}
