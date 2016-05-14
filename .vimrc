"B
":set background&

" General Settigns
" Set sheel to sh so that env set in .zshenv is ignored
set shell=bash
set nocompatible
filetype off	"required
syntax enable

" Vundle and it plugins
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto = 'git'
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"Plugin 'jelera/vim-javascript-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hashivim/vim-vagrant'
Plugin 'tfnico/vim-gradle'
Plugin 'yegappan/mru'
Plugin 'git://git.wincent.com/command-t.git/'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-fugitive'
Plugin 'alfredodeza/pytest.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'
Plugin 'Lokaltog/powerline'
Plugin 'klen/python-mode'
Plugin 'alfredodeza/konira.vim'
Plugin 'greyblake/vim-preview'
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'nsf/gocode', {'rtp': 'vim/'}
"Plugin 'dgryski/vim-godef'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'bling/vim-bufferline'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'

"Plugins to add support for Clojure and other Lisps

Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'elzr/vim-json'
call vundle#end() " required by vundle

" Filetypes
filetype plugin indent on    " required for vim bundle and pytho

set t_Co=256 " Set colors to 256 (Works best in gnome terminal). Must be set before colorscheme

" Colors dependent on the altercation/vim-colors-solarized plugin and have
" to bp set afterard
let g:solarized_visibility="high"
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Showing line numbers and length
set number " show line numbers
set tw=79 "width of document
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap when typing
set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=DarkRed

"  For OS X allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set Split Defaults
set splitbelow
set splitright

" Bufferline Integration with statusline
let g:bufferline_echo = 1
  "autocmd VimEnter *
   " \ let &statusline='%{bufferline#refresh_status()}'
    "  \ .bufferline#get_status_string()

" map turn off highligt to esc

nmap <leader>h :noh<return><esc>

" Fold code
"noremap <space> zo
noremap <space> za

"Map Leader Key
let mapleader = ","

"Json Formatter

nmap =j :%!python -m json.tool<CR>

"Movement maps
map <Leader>n <Esc>:tabprevious<CR>
map <Leader>m <Esc>:tabnext<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map sort to a key
vnoremap <Leader>s :sort<CR>

" Allow easier movment of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" easier formatting of paragraphs
vmap Q pq
nmap Q gqap

" Useful Settings
set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"Syntastic
let g:syntastic_check_on_open=1

"ConqueTerm
nmap <leader>cq :ConqueTermSplit bash<CR>

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 " Always show status line

" NerdTree
nmap <leader>ne :NERDTree<CR>

" Taglist
map <F3> <Esc>:TlistToggle<CR>
autocmd BufWritePost *.* :TlistUpdate

" Command-T
" Tell Command-T to ignore things we don't care about
set wildignore+=*.class,.git,.hg,.svn,target/**,.pyc

" Jedi Config
let g:jedi#show_call_signatures = "1"

" Simpylfold Config
let g:SimpylFold_fold_docstring = 0 " Don't fold doc strings

"To fix annoying issue with YouCompleteMe
"let g:clang_user_options='|| exit 0'

" python-mode
" https://github.com/klen/python-mode
let g:pymode_virtualenv=1 " Auto fix vim python paths if virtualenv enabled
let g:pymode_folding=1  " Enable python folding
let g:pymode_utils_whitespaces=0  " Do not autoremove unused whitespaces
map <Leader>rgd :call RopeGotoDefinition()<CR>
map <Leader>pl :PyLint<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
let g:pymode_lint_ignore = "C0110 Exported"  " ignore pep257 missing docstring warning
let g:pymode_lint_minheight = 5   " Minimal height of pylint error window
let g:pymode_lint_maxheight = 15  " Maximal height of pylint error window
let g:pymode_lint_write = 0  " Disable pylint checking every save
let g:pymode_run_key = "<leader>run"  " default key conflicts with jedi-vim
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_checker="pyflakes,pep8,pep257,mccabe"
let g:pymode_syntax_highlight_self=0  " do not highlight self
let g:pymode_rope_vim_completion=0  " use jedi-vim for completion
let g:pymode_rope_guess_project=0
let g:pymode_doc_key="<leader>k"  " used jedi-vim for help
"Disable Pyflakes for konira files
"autocmd BufRead,BufWrite case_*.py :let g:pymode_lint = 0

"YCM cache
let g:ycm_cache_omnifunc = 0


" Add pysmell support
autocmd FileType python setlocal omnifunc=pysmell#Complete

"HTML Settings
"Use F8 to close HTML tag
inoremap <F8> </<C-X><C-O>

" Permenantly Disable Ex Mode
"nnoremap Q <nop> " Don't need this now that Q is mapped to pq

"Indent
set smartindent
set autoindent

"Markdown to HTML Conversion Command - Requires Markdown.pl in path
nmap <leader>md :%!~/bin/Markdown.pl --html4tags<cr>

"vim-go config
"let g:go_fmt_command = "goimports"

" Add xsd config here

autocmd FileType xsd setlocal shiftwidth=2 tabstop=2

" Add Custom Functions Here

" Word Processor Mode - http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	setlocal spell spelllang=en_us
	set complete+=s
	set formatprg=par
	setlocal wrap
	setlocal linebreak
endfu
com! WP call WordProcessorMode()

" Remove trailing white space on save
autocmd BufWritePre *.* :%s/\s\+$//e

"Nginx syntax support
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" Autoreload .vimrc
augroup reload_vimrc " {
	    autocmd!
	        autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END " ;}
