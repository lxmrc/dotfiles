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

" Added this to get csv.vim to work
" filetype plugin on

" Plugins
call plug#begin()
Plug 'alvan/vim-closetag'
Plug 'andrewradev/splitjoin.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'eslint/eslint'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'rorymckinley/vim-symbols-strings'
Plug 'shime/vim-livedown'
Plug 'tbabej/taskwiki'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/restore_view.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
call plug#end()

" Vim Tmux Runner
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
let g:ale_linters = {'ruby': ['solargraph'], 'javascript': ['prettier'], 'erb': ['erblint']}
let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['prettier'], 'erb': ['erbint']}

" Set the executable for ALE to call to get Solargraph
" up and running in a given session
let g:ale_ruby_solargraph_executable = 'solargraph'
let g:ale_ruby_solargraph_options = {}

let g:ale_completion_enabled = 1

" Fixes the bug identified in this issue:
" https://github.com/w0rp/ale/issues/1700
set completeopt=menu,menuone,preview,noselect,noinsert

" Folds
set foldmethod=indent

" RSpec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Copy relative path to clipboard
:nnoremap <Leader>cc :let @+=expand('%:')<CR>

" Like gJ, but always remove spaces
fun! s:join_spaceless()
    execute 'normal! gJ'

    " Remove character under the cursor if it's whitespace.
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        execute 'normal! dw'
    endif
endfun

" Map it to a key
nnoremap <Leader>J :call <SID>join_spaceless()<CR>

" Vimwiki
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_ext = '.md'
