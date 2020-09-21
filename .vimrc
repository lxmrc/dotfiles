" Set leader
let mapleader = "<Space>"

" Use system clipboard
set clipboard=unnamedplus

" Fix colour issue
set background=dark

" Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set tabstop=2

" Enter inserts newline
nmap <ENTER> o<esc>

" Ctrl+P FZF
nmap <C-p> :Files<ENTER>

" Plugins
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Vim Tmux Runner
Plug 'christoomey/vim-tmux-runner'
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>pry :VtrOpenRunner { "orientation": "h", "percentage": 30 }<cr>
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
noremap <C-f> :VtrSendLinesToRunner<cr>
