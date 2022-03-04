" Disable compatible mode
set nocp

" Set leader
let mapleader = "\<Space>"

" Use system clipboard
set clipboard=unnamedplus

" Case insensitive search
set ignorecase

" Show filename
set laststatus=2

" Fix colour issue
set background=dark

" Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set tabstop=2

" Enter inserts newline
nmap <ENTER> o<esc>

" 0 goes to first char on line
nnoremap 0 ^
nnoremap ^ 0

" Ctrl+P FZF
nmap <C-p> :Files<ENTER>
nmap <C-g> :Rg 

" Fix moving along wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Line numbers
set number

" Relative line numbers
" set relativenumber

" Plugins
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'eslint/eslint'
Plug 'prettier/vim-prettier'
Plug 'vim-scripts/restore_view.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'andrewradev/splitjoin.vim'
" Plug 'wookayin/fzf-ripgrep.vim'
" Plug 'jremmen/vim-ripgrep'
" Plug 'https://github.com/ActivityWatch/aw-watcher-vim.git'
" Plug 'mattn/emmet-vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
call plug#end()

" Vim Tmux Runner
Plug 'christoomey/vim-tmux-runner'
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>pry :VtrOpenRunner { "orientation": "h", "percentage": 30 }<cr>
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
noremap <C-f> :VtrSendLinesToRunner<cr>

" Color scheme
colorscheme default

" Use an undo file
set undofile
set undodir=$HOME/.vimundo/

" Shortcut for binding.pry
" ia pry <CR>binding.pry

" Disable safe write
set backupcopy=yes

" Show file name in tmux
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")   
set title

" NERDTree
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1
map  <Leader>n  :NERDTreeFind<CR>

" ALE
let g:ale_enabled=0
