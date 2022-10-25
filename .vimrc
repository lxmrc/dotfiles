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

" Fixes the bug identified in this issue:
" https://github.com/w0rp/ale/issues/1700
set completeopt=menu,menuone,preview,noselect,noinsert

" Folds
set foldmethod=indent

" Set 'hidden'
set hidden

" Edit .vimrc file
nnoremap <leader>vc :e $HOME/.vimrc<cr>

" Source .vimrc and run PlugInstall
nnoremap <leader>sv :source $HOME/.vimrc<cr>

" PlugInstall
nnoremap <leader>pi :PlugInstall<cr>

" Edit .zshrc
nnoremap <leader>zc :e $HOME/.zshrc<cr>

" Edit .tmux.conf
nnoremap <leader>tc :e $HOME/.tmux.conf<cr>

" Source .tmux.conf
nnoremap <space>st :!tmux source $HOME/.tmux.conf<CR>

" Edit global .gitconfig
nnoremap <leader>ggc :e ${HOME}/.gitconfig"<CR>
nnoremap <leader>ggi :e ${HOME}/.gitignore"<CR>

" vim-run-interactive
nnoremap <leader>ri :RunInInteractiveShell<space>

" Color scheme
colorscheme default

" Use an undo file
set undofile
set undodir=$HOME/.vimundo/

" Disable safe write
set backupcopy=yes

" Show file name in tmux
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")   
set title

" Copy relative path to clipboard
nnoremap <Leader>cc :let @+=expand('%:')<CR>

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

" Templates
autocmd BufNewFile *.html 0r $HOME/.vim/templates/html.skel

" Plugins
call plug#begin()
"Plug 'jceb/vim-orgmode'
"Plug 'jiangmiao/auto-pairs'
"Plug 'junegunn/vim-emoji'
"Plug 'majutsushi/tagbar'
"Plug 'shime/vim-livedown'
"Plug 'tpope/vim-dotenv'
"Plug 'vim-denops/denops-helloworld.vim'
"Plug 'vim-denops/denops.vim'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'
Plug 'andrewradev/splitjoin.vim'
Plug 'chrisbra/colorizer'
Plug 'christoomey/vim-run-interactive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'eslint/eslint'
Plug 'jgdavey/tslime.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'
Plug 'mtth/scratch.vim'
Plug 'peterrincker/vim-argumentative'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'rkitover/vimpager'
Plug 'rorymckinley/vim-symbols-strings'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tbabej/taskwiki'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/restore_view.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'idanarye/vim-merginal'
call plug#end()

" ALE
let g:ale_enabled=1
let g:ale_linters = {'ruby': ['rubocop'], 'javascript': ['prettier'], 'eruby': ['erblint']}
let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['prettier'], 'eruby': ['erblint']}

" <space> a to run ALEFix
nnoremap <space>a :ALEFix <CR>

" Set the executable for ALE to call to get Solargraph
" up and running in a given session
" let g:ale_ruby_solargraph_executable = 'solargraph'
" let g:ale_ruby_solargraph_options = {}
" let g:ale_completion_enabled = 1

" Vim Tmux Runner
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>pry :VtrOpenRunner { "orientation": "h", "percentage": 30 }<cr>
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
noremap <C-f> :VtrSendLinesToRunner<cr>

" vim-rspec
let g:rspec_command = 'call Send_to_Tmux("docker-compose exec web bundle exec rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Vimwiki
let g:vimwiki_hl_headers = 1

  " personal
  let personal = {}
  let personal.path = '~/wiki/'
  let personal.syntax = 'markdown'
  let personal.ext = '.md'

  " work
  let work = {}
  let work.path = '~/work/eagle-dev-local/eagle/wiki/'
  let work.ext = '.md'

let g:vimwiki_list = [personal, work]


" Scratch
let g:scratch_filetype = 'ruby'
let g:scratch_height = 100

" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" fugitive git bindings
nnoremap <space>G :Gedit : <CR>
nnoremap <space>gw :Git blame<CR>
nnoremap <space>gmm :Git merge master<CR>
nnoremap <space>gcm :Git checkout master<CR>
nnoremap <space>gb :Merginal<CR>
nnoremap <space>gc :Git checkout<Space>
nnoremap <space>gf :Git fetch-checkout<Space>
nnoremap <space>gdn :Git diff --name-only master \| only<CR>
nnoremap <space>gdm :Git diff master \| only<CR>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
nnoremap <space>gl :G log \| only<CR>
nnoremap <space>gbn :Git checkout -b<Space>

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" vim-tagbar
" nmap <F8> :TagbarToggle<CR>

let g:rooter_manual_only = 0

" Quit whether Goyo is active or not
ca qa :call Quit()<cr>
function! Quit()
    if exists('#goyo')
        Goyo
    endif
    quit
endfunction

" Highlight colours
hi Folded ctermfg=102 guifg=#878787 guibg=NONE ctermbg=NONE
highlight clear SignColumn
highlight ALEError ctermbg=none cterm=underline 
highlight ALEWarning ctermbg=none cterm=underline

" Hide remote branches in vim-merginal
let g:merginal_remoteVisible=0
