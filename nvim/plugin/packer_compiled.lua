-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rishavc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rishavc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rishavc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rishavc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rishavc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcomment\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-npm"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  everforest = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n÷\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\30space_char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\24char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\1\0\5\tchar\5\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17keywordStyle\1\0\0\1\0\1\vitalic\2\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\nä\2\0\0\4\2\17\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0-\3\0\0=\3\4\2-\3\0\0=\3\5\2-\3\0\0=\3\6\2-\3\0\0=\3\a\2-\3\0\0=\3\b\2-\3\0\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2-\3\1\0=\3\f\2-\3\1\0=\3\r\2-\3\1\0=\3\14\2-\3\1\0=\3\15\2-\3\1\0=\3\16\2B\0\2\1K\0\1\0\0¿\1¿\ago\vpython\blua\6c\bcpp\trust\thtml\vsvelte\bvue\20typescriptreact\20javascriptreact\15typescript\15javascript\1\0\0\nsetup\15lsp-format\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nà\3\0\0\5\1\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\1\0\rsections\14lualine_z\1\3\0\0\24os.date(\"%a %h %d\")\26%{strftime(\"%-H:%M\")}\14lualine_y\1\3\0\0\rprogress\rlocation\14lualine_x\1\3\0\0\15fileformat\rfiletype\14lualine_c\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\25component_separators\1\0\2\tleft\bÓÇπ\nright\bÓÇª\23section_separators\1\0\2\tleft\bÓÇ∏\nright\bÓÇ∫\ntheme\1\0\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n‘\1\0\0\5\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\6\0005\4\5\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\aui\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nÁ\2\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\2\ttext\bÔ†¥\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\tÔÅö \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\tÔÅ± \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\tÔÅó \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimƒ\6\1\0\v\0-\0e6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\14\0009\b\t\0009\b\f\b5\n\r\0B\b\2\2=\b\15\a9\b\t\0009\b\f\b5\n\16\0B\b\2\2=\b\17\aB\5\2\2=\5\t\0049\5\18\0009\5\19\0054\a\3\0005\b\20\0>\b\1\a5\b\21\0>\b\2\a4\b\3\0005\t\22\0>\t\1\bB\5\3\2=\5\19\0045\5\27\0009\6\23\0015\b\24\0005\t\25\0=\t\26\bB\6\2\2=\6\28\5=\5\29\0045\5\30\0=\5\31\4B\2\2\0019\2\3\0009\2 \2'\4!\0005\5$\0009\6\18\0009\6\19\0064\b\3\0005\t\"\0>\t\1\b4\t\3\0005\n#\0>\n\1\tB\6\3\2=\6\19\5B\2\3\0019\2\3\0009\2%\2'\4&\0005\5'\0009\6\t\0009\6\n\0069\6%\6B\6\1\2=\6\t\0054\6\3\0005\a(\0>\a\1\6=\6\19\5B\2\3\0019\2\3\0009\2%\2'\4)\0005\5*\0009\6\t\0009\6\n\0069\6%\6B\6\1\2=\6\t\0059\6\18\0009\6\19\0064\b\3\0005\t+\0>\t\1\b4\t\3\0005\n,\0>\n\1\tB\6\3\2=\6\19\5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\3\rnvim_lsp\n[LSP]\vbuffer\n[BUF]\fluasnip\n[SNP]\1\0\1\tmode\16symbol_text\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\14<C-Space>\1\0\1\vselect\2\n<Tab>\1\0\0\1\0\1\vselect\2\fconfirm\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/lewis6991/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nä\3\0\0\a\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\1\17quit_on_open\2\rrenderer\19indent_markers\1\0\1\venable\2\1\0\2\27highlight_opened_files\ticon\16group_empty\2\16diagnostics\1\0\2\venable\2\17show_on_dirs\2\tview\rmappings\tlist\1\0\0\1\0\2\bkey\6u\vaction\vdir_up\1\0\1\18adaptive_size\2\1\0\3\18hijack_cursor\2\18disable_netrw\2\fsort_by\tname\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nì\6\0\0\a\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\17\0005\4\f\0005\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\19\0005\5\20\0005\6\21\0=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[F\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[f\20@function.outer\18goto_next_end\1\0\2\a]F\20@function.outer\a][\17@class.outer\20goto_next_start\a]]\1\0\2\tdesc\21Next class start\nquery\17@class.outer\1\0\1\a]f\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\20selection_modes\1\0\3\21@parameter.outer\6v\20@function.outer\6V\17@class.outer\n<c-v>\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ensure_install\1\0\1\17auto_install\2\1\6\0\0\trust\15typescript\bvue\bcpp\ncmake\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14max_lines\3\2\15trim_scope\nouter\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["rust-tools.nvim"] = {
    config = { "require('rust-tools')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n„\5\0\0\v\0.\1>6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0005\1\5\0005\2\6\0006\3\0\0'\5\1\0B\3\2\0029\3\a\0035\5\17\0005\6\b\0=\1\t\6=\1\n\6=\1\v\6=\2\f\6=\2\r\6=\2\14\6=\2\15\6=\2\16\6=\6\18\0055\6\20\0005\a\19\0=\a\21\0065\a\22\0005\b$\0005\t\24\0009\n\23\0=\n\25\t9\n\26\0=\n\27\t9\n\28\0=\n\29\t9\n\30\0=\n\31\t9\n \0=\n!\t9\n\"\0=\n#\t=\t%\b5\t&\0009\n\26\0=\n'\t9\n\"\0=\n(\t=\t)\b=\b*\a=\a\3\0064\a\3\0006\b\0\0'\n+\0B\b\2\0029\b,\b4\n\0\0B\b\2\0?\b\0\0=\a-\6=\6\2\5B\3\2\1K\0\1\0\14ui-select\17get_dropdown\21telescope.themes\rmappings\6n\6u\6a\1\0\0\6i\1\0\0\n<C-u>\20goto_parent_dir\n<C-m>\tmove\n<C-y>\tcopy\n<C-r>\vrename\n<C-a>\vcreate\n<C-d>\1\0\0\vremove\1\0\1\17hijack_netrw\2\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\1\0\0\25lsp_type_definitions\20lsp_definitions\24lsp_implementations\25lsp_document_symbols\19lsp_references\16diagnostics\fbuffers\14live_grep\1\0\0\nsetup\1\0\1\ntheme\vcursor\1\0\1\ntheme\rdropdown\factions\17file_browser\15extensions\14telescope\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/rishavc/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n÷\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\30space_char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\24char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\1\0\5\tchar\5\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcomment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n„\5\0\0\v\0.\1>6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0005\1\5\0005\2\6\0006\3\0\0'\5\1\0B\3\2\0029\3\a\0035\5\17\0005\6\b\0=\1\t\6=\1\n\6=\1\v\6=\2\f\6=\2\r\6=\2\14\6=\2\15\6=\2\16\6=\6\18\0055\6\20\0005\a\19\0=\a\21\0065\a\22\0005\b$\0005\t\24\0009\n\23\0=\n\25\t9\n\26\0=\n\27\t9\n\28\0=\n\29\t9\n\30\0=\n\31\t9\n \0=\n!\t9\n\"\0=\n#\t=\t%\b5\t&\0009\n\26\0=\n'\t9\n\"\0=\n(\t=\t)\b=\b*\a=\a\3\0064\a\3\0006\b\0\0'\n+\0B\b\2\0029\b,\b4\n\0\0B\b\2\0?\b\0\0=\a-\6=\6\2\5B\3\2\1K\0\1\0\14ui-select\17get_dropdown\21telescope.themes\rmappings\6n\6u\6a\1\0\0\6i\1\0\0\n<C-u>\20goto_parent_dir\n<C-m>\tmove\n<C-y>\tcopy\n<C-r>\vrename\n<C-a>\vcreate\n<C-d>\1\0\0\vremove\1\0\1\17hijack_netrw\2\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\1\0\0\25lsp_type_definitions\20lsp_definitions\24lsp_implementations\25lsp_document_symbols\19lsp_references\16diagnostics\fbuffers\14live_grep\1\0\0\nsetup\1\0\1\ntheme\vcursor\1\0\1\ntheme\rdropdown\factions\17file_browser\15extensions\14telescope\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nà\3\0\0\5\1\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\1\0\rsections\14lualine_z\1\3\0\0\24os.date(\"%a %h %d\")\26%{strftime(\"%-H:%M\")}\14lualine_y\1\3\0\0\rprogress\rlocation\14lualine_x\1\3\0\0\15fileformat\rfiletype\14lualine_c\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\25component_separators\1\0\2\tleft\bÓÇπ\nright\bÓÇª\23section_separators\1\0\2\tleft\bÓÇ∏\nright\bÓÇ∫\ntheme\1\0\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17keywordStyle\1\0\0\1\0\1\vitalic\2\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nä\3\0\0\a\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\1\17quit_on_open\2\rrenderer\19indent_markers\1\0\1\venable\2\1\0\2\27highlight_opened_files\ticon\16group_empty\2\16diagnostics\1\0\2\venable\2\17show_on_dirs\2\tview\rmappings\tlist\1\0\0\1\0\2\bkey\6u\vaction\vdir_up\1\0\1\18adaptive_size\2\1\0\3\18hijack_cursor\2\18disable_netrw\2\fsort_by\tname\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nÁ\2\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\2\ttext\bÔ†¥\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\tÔÅö \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\tÔÅ± \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\tÔÅó \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n‘\1\0\0\5\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\6\0005\4\5\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\aui\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimƒ\6\1\0\v\0-\0e6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\14\0009\b\t\0009\b\f\b5\n\r\0B\b\2\2=\b\15\a9\b\t\0009\b\f\b5\n\16\0B\b\2\2=\b\17\aB\5\2\2=\5\t\0049\5\18\0009\5\19\0054\a\3\0005\b\20\0>\b\1\a5\b\21\0>\b\2\a4\b\3\0005\t\22\0>\t\1\bB\5\3\2=\5\19\0045\5\27\0009\6\23\0015\b\24\0005\t\25\0=\t\26\bB\6\2\2=\6\28\5=\5\29\0045\5\30\0=\5\31\4B\2\2\0019\2\3\0009\2 \2'\4!\0005\5$\0009\6\18\0009\6\19\0064\b\3\0005\t\"\0>\t\1\b4\t\3\0005\n#\0>\n\1\tB\6\3\2=\6\19\5B\2\3\0019\2\3\0009\2%\2'\4&\0005\5'\0009\6\t\0009\6\n\0069\6%\6B\6\1\2=\6\t\0054\6\3\0005\a(\0>\a\1\6=\6\19\5B\2\3\0019\2\3\0009\2%\2'\4)\0005\5*\0009\6\t\0009\6\n\0069\6%\6B\6\1\2=\6\t\0059\6\18\0009\6\19\0064\b\3\0005\t+\0>\t\1\b4\t\3\0005\n,\0>\n\1\tB\6\3\2=\6\19\5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\3\rnvim_lsp\n[LSP]\vbuffer\n[BUF]\fluasnip\n[SNP]\1\0\1\tmode\16symbol_text\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\14<C-Space>\1\0\1\vselect\2\n<Tab>\1\0\0\1\0\1\vselect\2\fconfirm\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14max_lines\3\2\15trim_scope\nouter\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\nä\2\0\0\4\2\17\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0-\3\0\0=\3\4\2-\3\0\0=\3\5\2-\3\0\0=\3\6\2-\3\0\0=\3\a\2-\3\0\0=\3\b\2-\3\0\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2-\3\1\0=\3\f\2-\3\1\0=\3\r\2-\3\1\0=\3\14\2-\3\1\0=\3\15\2-\3\1\0=\3\16\2B\0\2\1K\0\1\0\0¿\1¿\ago\vpython\blua\6c\bcpp\trust\thtml\vsvelte\bvue\20typescriptreact\20javascriptreact\15typescript\15javascript\1\0\0\nsetup\15lsp-format\frequire\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nì\6\0\0\a\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\17\0005\4\f\0005\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\19\0005\5\20\0005\6\21\0=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[F\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[f\20@function.outer\18goto_next_end\1\0\2\a]F\20@function.outer\a][\17@class.outer\20goto_next_start\a]]\1\0\2\tdesc\21Next class start\nquery\17@class.outer\1\0\1\a]f\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\20selection_modes\1\0\3\21@parameter.outer\6v\20@function.outer\6V\17@class.outer\n<c-v>\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ensure_install\1\0\1\17auto_install\2\1\6\0\0\trust\15typescript\bvue\bcpp\ncmake\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "toml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
