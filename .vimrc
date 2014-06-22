"B
":set background&

" General Settigns
set nocompatible
filetype off	"required
syntax enable

" Vundle and it plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'plasticboy/vim-markdown'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tfnico/vim-gradle'
Plugin 'yegappan/mru'
"Plugin 'git://git.wincent.com/command-t.git/'
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
Plugin 'jnwhiteh/vim-golang'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'dgryski/vim-godef'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-ruby/vim-ruby'
call vundle#end() " required by vundle

" Filetypes
filetype plugin indent on    " required for vim bundle and pytho

set t_Co=256 " Set colors to 256 (Works best in gnome terminal). Must be set before colorscheme

" Colors dependent on the altercation/vim-colors-solarized plugin and have
" to bp set afterard
set background=dark
colorscheme solarized

" Showing line numbers and length
set number " show line numbers
set tw=79 "width of document
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap when typing
set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=Black  guibg=#2c2d27

" Set Split Defaults
set splitbelow
set splitright

" map turn off highligt to esc

noremap <leader>h :noh<return><esc>

" Fold code
"noremap <space> zo
noremap <space> za

"Map Leader Key
let mapleader = ","

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

" Add pysmell support
autocmd FileType python setlocal omnifunc=pysmell#Complete

" Permenantly Disable Ex Mode
"nnoremap Q <nop> " Don't need this now that Q is mapped to pq

"Indent
set smartindent 
set autoindent


" Autoreload .vimrc
augroup reload_vimrc " {
	    autocmd!
	        autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END " }
