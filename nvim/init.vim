""""""""""""""""""""""""""""""""
"""""""" Plugins
""""""""""""""""""""""""""""""""

call plug#begin()

""" Aesthetics
Plug 'chriskempson/base16-vim'			" Base16 theme set
Plug 'morhetz/gruvbox'					" Official gruvbox theme
Plug 'sainnhe/gruvbox-material'			" Alternate gruvbox theme
Plug 'nvim-lualine/lualine.nvim'		" Status line
Plug 'akinsho/bufferline.nvim'			" Display buffers as tabs
Plug 'folke/todo-comments.nvim'			" TODO marking and searching


""" LSP Support
Plug 'neovim/nvim-lspconfig'			" Neovim LSP manager
Plug 'nvim-lua/lsp_extensions.nvim'		" LSP additional functionality (inlay/closing hints, etc)
Plug 'williamboman/nvim-lsp-installer'	" LSP Install tool
Plug 'simrat39/rust-tools.nvim'			" Additional Rust tooling
Plug 'ray-x/lsp_signature.nvim'			" LSP Function signature


""" Autocompletion
Plug 'ms-jpq/coq_nvim'					" COQ Handles all autocompletion (I think)
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}


""" Functionality
Plug 'nvim-lua/plenary.nvim'			" No idea but it makes things work
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'	" Fuzzy word and file finder
Plug 'preservim/nerdtree'				" File explorer
Plug 'CRAG666/code_runner.nvim'			" Run code without leaving vim
Plug 'mfussenegger/nvim-dap'			" Debug Adapter Protocol
Plug 'kdheepak/lazygit.nvim'			" Lazygit integration
Plug 'anuvyklack/pretty-fold.nvim'		" Code folding
Plug 'jiangmiao/auto-pairs'				" Automatic closing parentheses and brackets
Plug 'windwp/nvim-ts-autotag'			" Automatic closing tags
Plug 'machakann/vim-sandwich'			" Surround content with parentheses and brackets
Plug 'SmiteshP/nvim-gps'				" Display current nested scopes
Plug 'numToStr/Comment.nvim'			" Commenting
Plug 'junegunn/vim-easy-align'			" Align similar symbols across lines
Plug 'norcalli/nvim-colorizer.lua'		" Highlights hex codes and such
Plug 'lewis6991/spellsitter.nvim'		" Spellcheck highlighting
Plug 'airblade/vim-rooter'				" Finds and uses project root
Plug 'lukas-reineke/indent-blankline.nvim'


call plug#end()


""""""""""""""""""""""""""""""""
"""""""" General Settings
""""""""""""""""""""""""""""""""


set termguicolors
color gruvbox

filetype plugin indent on
syntax on
set number relativenumber
set tabstop=4 shiftwidth=4
set autoindent smartindent cindent indentexpr noexpandtab
filetype plugin indent on
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler
set list
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set title
set undofile
set mouse=a
set backupdir=/tmp
set backup
set scrolloff=4
set updatetime=300
highlight Comment gui=italic cterm=italic

""" Filetype-specific Configurations

" HTML, XML, Jinja
autocmd FileType html   setlocal tabstop=2 softtabstop=2
autocmd FileType css    setlocal tabstop=2 softtabstop=2
autocmd FileType xml    setlocal tabstop=2 softtabstop=2


" Javascript and React
autocmd FileType javascript         setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascriptreact    setlocal tabstop=2 softtabstop=2 shiftwidth=2


""""""""""""""""""""""""""""""""
"""""""" Plugin Configuration
""""""""""""""""""""""""""""""""
lua << END

local lspconfig = require'lspconfig'
local lsp_installer = require'nvim-lsp-installer'
local coq = require'coq'
local rust_tools = require'rust-tools'
local lsp_signature = require'lsp_signature'
local gps = require'nvim-gps'
local treesitter = require'nvim-treesitter'
local code_run = require'code_runner'
local lualine = require'lualine'
local bufferline = require'bufferline'
local comment = require'Comment'
local todo_comments = require'todo-comments'
local spellsitter = require'spellsitter'
local colorizer = require'colorizer'
local fold = require'pretty-fold'
local fold_preview = fold.preview
local indent_lines = require'indent_blankline'

-- LSP Automatic Server setup

lsp_installer.on_server_ready(function(server)
	local opts = { noremap = true, silent = true }
	server:setup(coq.lsp_ensure_capabilities(opts))
end)

local vim.g.coq_settings = {
	["auto_start"] = true,
	auto_start = true
	}

lsp_signature.setup()

rust_tools.setup()

treesitter.configs.setup {
    highlight = { enable = true },
	autotag = {
		enable = true,
		}
    }

code_run.setup {
	filetype = {
		java = "cd $dir && javac $filename && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cargo run",
		}
	}

lualine.setup {
    options = { theme = 'gruvbox' },
    sections = {
        lualine_c = {
            { gps.get_location, condition = gps.is_available },
            },
        lualine_y = { 'progress', 'location' },
        lualine_z = { 'os.date("%a %h %d")', '%{strftime("%-I:%M %p")}' }
        }
    }

bufferline.setup {
    options = {
        diagnostics = "nvim_lsp"
        }
    }

comment.setup()

todo_comments.setup()

spellsitter.setup()

colorizer.setup()

indent_lines.setup {
	show_current_context = true,
	show_current_context_start = false
	}

-- fold.setup()
-- fold_preview.setup()

END

" NERDTree
let NERDTreeShowHidden = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1


""""""""""""""""""""""""""""""""
"""""""" Key Mappings
""""""""""""""""""""""""""""""""

function! TrimWhiteSpace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

let mapleader=" "
nmap <leader>w :call TrimWhiteSpace()<CR>:w<CR>
nmap <leader>q :q
nmap <leader>wq :x
nmap <leader>y "*y
nmap <leader>p "*p
nmap <leader>ts <C-w>s<C-w>j
nmap <leader>tv <C-w>s<C-w>l
nmap <leader>th <C-w>h
nmap <leader>tj <C-w>j
nmap <leader>tk <C-w>k
nmap <leader>tl <C-w>l
nmap <leader>tq <C-w>q
nmap <C-w> :bdel!
nmap <silent> <leader>nh :noh<CR>

nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <silent> <Tab> :bnext<CR>
nmap <silent> <S-Tab> :bprevious<CR>
nmap <silent> <leader>git :LazyGit<CR>


""" LSP key mappings
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename() <CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>



