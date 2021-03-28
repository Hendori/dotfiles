" set cursorline
syntax on
set t_Co=256

" Set ruler
set ruler
set showcmd
set relativenumber

" Set tab
set tabstop=4
set shiftwidth=4
set smartcase
set smarttab
set expandtab

" Set fuzzy finder
set path+=**
set wildmenu

" set clipboard
set clipboard=unnamed

" Set highlight search
set hlsearch

" Set commands
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<
" Set autoread
set autoread

" Vundle plugins
"set runtimepath+=~/.vim/bundle/Vundle.vim
"call vundle#begin() "begins the vim plugins
""Plugin 'gmarik/Vundle.vim'
"Plugin 'https://github.com/dylanaraps/wal.vim.git'
"" Generic plugins
"Plugin 'git://github.com/tpope/vim-surround.git' " surround plugin
"Plugin 'https://github.com/Shougo/vimproc.vim'
"" airline
"Plugin 'vim-airline/vim-airline'
"" ALE
"Plugin 'w0rp/ale'
"" gitgutter
"Plugin 'https://github.com/airblade/vim-gitgutter'
""Haskell plugins
"Plugin 'eagletmt/ghcmod-vim'
""javascript plugins
"Plugin 'pangloss/vim-javascript'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'mxw/vim-jsx'
""vue plugin
"Plugin 'posva/vim-vue'
""Latex plugin
"Plugin 'https://github.com/tpope/vim-dispatch'
"call vundle#end() " End the plugins
filetype plugin indent on    " required
"colorscheme wal

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'https://github.com/dylanaraps/wal.vim.git'
" Generic plugins
Plug 'git://github.com/tpope/vim-surround.git' " surround plugin
Plug 'https://github.com/Shougo/vimproc.vim'
" airline
Plug 'vim-airline/vim-airline'
" ALE
Plug 'w0rp/ale'
" gitgutter
Plug 'https://github.com/airblade/vim-gitgutter'
"Haskell plugins
Plug 'eagletmt/ghcmod-vim'
"javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx'
"vue plugin
Plug 'posva/vim-vue'
"Latex plugin
Plug 'https://github.com/tpope/vim-dispatch'
"Plug 'https://github.com/goballooning/vim-live-latex-preview'
call plug#end()

let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '!!' " Less aggressive than the default '>>'
let g:ale_sign_warning = '<>'


" set columcolor at 80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" set mapleader to ;
let mapleader=';'
com! FormatJSON %!python -m json.tool
filetype plugin on

" Automate for whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Set generic quick keys
set pastetoggle=<F2>
" ALE lint keys
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Specific cypress hotkeys
autocmd FileType javascript inoremap <leader>it <Esc>0i<Tab>it('',<Space>function()<Space>{<Return><Return>});<Esc>2k2lci'
autocmd FileType javascript inoremap <leader>get <Esc>0icy.get()<==><Esc>5hci(
autocmd FileType javascript inoremap <leader>de <Esc>0idescribe('',<Space>function()<Space>{<Return><==><Return>});<Esc>2k7lci'
autocmd FileType javascript inoremap <leader>bf <Esc>0i<Tab>before(function()<Space>{<Return><Return>});<Esc>k3li
autocmd FileType javascript inoremap <leader>be <Esc>0ibeforeEach(function()<Space>{<Return><Tab><Tab><Return><Tab>});<Esc>k3li
autocmd FileType javascript inoremap <leader>var <==><Esc>/var<Return>Novar<Space><Space>=<Space>'<==>';<Esc>9hi

" Specific haskell hotkeys
autocmd FileType haskell inoremap <leader>. -><Space>
autocmd FileType haskell inoremap <leader>, <-<Space>
autocmd FileType nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
map <c-f> :call JsBeautify()<cr>
autocmd! bufwritepost .vimrc source %

" Mappings for compiling Latex file
autocmd FileType tex nmap <buffer> T :!open -a Skim %:r.pdf<CR><CR>
augroup latex
autocmd BufWritePost *.tex silent! execute "!latexmk % -pdf -bibtex" | redraw!
autocmd FileType tex setlocal spell
