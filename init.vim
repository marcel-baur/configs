" hello front end masters
set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set guicursor=i:block
set tabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set nohlsearch

set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'git@github.com:jiangmiao/auto-paris'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:ycm-core/YouCompleteMe.git'
" Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'jremmen/vim-ripgrep'
Plug 'lyuts/vim-rtags'
" Yes, I am a sneaky snek now
Plug 'ambv/black'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'

" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree
" shi://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh
" | bash
" tter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" HARPOON!!
Plug 'mhinz/vim-rfc'

" prettier
Plug 'sbdchd/neoformat'

" should I try another status bar???
"  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'hoob3rt/lualine.nvim'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:netrw_browse_split=2
let g:netrw_banner = 0

let g:ctrlp_use_caching = 0
let g:netrw_winsize=25

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serveCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers

let g:LanguageClient_autoStart = 1

let mapleader = " "

syntax enable
filetype plugin indent on
" Adding local modules
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" greatest remap ever
xnoremap <leader>p "_dP
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" YCM Remaps
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <silent> <Leader>cp :CtrlP<CR>
nnoremap <silent> <C-s> :Files<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>rz :vertical resize 25<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre *.lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

colorscheme gruvbox
                                                                                                                                                                                                                      1,1            Top
