"""""""""""""""""""""""""""""""""""""""""
"
" Sections
"   -> General
"   -> Colors and Fonts
"   -> Spellcheck
"   -> Load Plugins
"   -> Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"
"   -> General
"   
""""""""""""""""""""""""""""""""""""""""

filetype on		" Set filetype detection highlighting
filetype plugin on	" Enable filetype-specific plugins
filetype indent on	" Enable filetype-specific indenting
set autoindent		" Auto indent to previous line
set copyindent		" Copy previous indention
set number		" Enable line numbers
set expandtab		" Use spaces as tabs
set softtabstop=4	" Set tab to 4 spaces
set shiftwidth=4	" Set indentation to 4 spaces
set tw=79
set updatetime=250

" Remap leader
let mapleader= ","

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
 nnoremap <space> za

" HTML 
autocmd Filetype html setlocal ts=2 sts=2 sw=2

" Autocommand to process emails composed with Mutt
augroup autocom
    autocmd!
    " executes my command on quit
     autocmd VimLeave /tmp/mutt-* !/home/jason/bin/email-process %
augroup END

" Run YAPF 
"autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>


" Line Numbers
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" turn hybrid line numbers off
":set nonumber norelativenumber
":set nonu nornu

" toggle hybrid line numbers
":set number! relativenumber!
":set nu! rnu!
""""""""""""""""""""""""""""""""""""""""
"   -> Load Plugins
""""""""""""""""""""""""""""""""""""""""

" Installs Vim-Plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Make sure you use single quotes
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
"Plug 'mxw/vim-jsx'
"Plug 'pangloss/vim-javascript'
"Plug 'tweekmonster/django-plus.vim', {'for': 'html'}
"lug 'mattn/emmet-vim'

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ambv/black'
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'majutsushi/tagbar', { 'for': 'python'}
Plug 'mitsuhiko/jinja2', { 'for': 'html'}
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-pencil', { 'for': ['mail', 'text', 'markdown']}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale', {'for': ['python', 'html']}

call plug#end()

"""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""
colorscheme base16-gruvbox-dark-medium
" set background=dark

" Enable syntax highlighting
syntax on	

" Hight Color for Misspelled words
highlight SpellBad guibg=red ctermbg=red

" Set encoding
set encoding=utf8 

"""""""""""""""""""""""""""""""""""
" => Spell Checking          
"""""""""""""""""""""""""""""""""""
map cc :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""
"   -> Plugin Settings
""""""""""""""""""""""""""""""""""""""""

"autocmd BufWritePre *.py execute ':Black'

""""""""""""""""""
" NERDTree
""""""""""""""""""
map <Leader>nt	:NERDTree<CR>
" Set to 1 to close after loading
let NERDTreeQuitOnOpen=0	

"""""""""""""""""
" Tagbar
"""""""""""""""""
nmap <Leader>t :TagbarToggle<CR>

" Vimwiki
let g:vimwiki_list = [{'path': '$HOME/documents/wiki/', 'path_html': '$HOME/public'}]

""""""""""""""""""
" SimplyFold
""""""""""""""""""
let g:SimpylFold_docstring_preview = 1

""""""""""""""""""
" ALE
""""""""""""""""""
let g:ale_python_auto_pipenv = 1
let b:ale_linters = ['pyflakes', 'flake8', 'pylint']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'black',
\]
let b:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"""""""""""""""""
" Ledger
"""""""""""""""""
autocmd BufRead,BufNewFile *.ldg set filetype=ledger
map <F3> :call ledger#transaction_state_toggle(line('.'), '*!')<CR>
let g:ledger_maxwidth = 80
let g:ledger_fillstring = '   -'
let g:ledger_extra_options = '--pedantic --explict --check-payees'
au FileType ledger vnoremap <silent><buffer> <Leader>a :ledgerAlign<CR>

""""""""""""""""""
" Pencil
""""""""""""""""""
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#textwidth = 74
augroup pencil
  autocmd!
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

""""""""""""""""""
" Emmet
""""""""""""""""""
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

