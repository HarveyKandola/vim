set nocompatible                " choose no compatibility with legacy vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
PLugin 'tpope/vim-surround.git'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'mklabs/grunt.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'vim-scripts/Auto-Pairs.git'
Plugin 'rking/ag.vim'
Plugin 'docunext/closetag.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'eiginn/netrw'

call vundle#end()

filetype plugin indent on  
syntax enable                                              " enable as opposed to on (keeps theme colors)
set encoding=utf-8
set showcmd                                                " display incomplete commands
set nowrap                                                 " don't wrap lines
set tabstop=4 shiftwidth=4                                 " a tab is two spaces (or set this to 4)
set expandtab                                              " use spaces, not tabs (optional)
set backspace=indent,eol,start                             " backspace through everything in insert mode
set number
set hlsearch                                               " highlight matches
set incsearch                                              " incremental searching
set ignorecase                                             " searches are case insensitive...
set smartcase                                              " ... unless they contain at least one capital letter
set history=1000
set showmatch                                              " Show matching brackets.
set matchtime=5                                            " Bracket blinking.
set novisualbell                                           " No blinking
set noerrorbells                                           " No noise.
set laststatus=2                                           " Always show status line.
set vb t_vb=                                               " disable any beeps or flashes on error
set viewoptions=folds,options,cursor,unix,slash            " Better Unix / Windows compatibility
set virtualedit=onemore                                    " Allow for cursor beyond last character
set history=1000                                           " Store a ton of history (default is 20)
set hidden                                                 " Allow buffer switching without saving
set iskeyword-=.                                           " '.' is an end of word designator
set iskeyword-=#                                           " '#' is an end of word designator
set iskeyword-=-                                           " '-' is an end of word designator
set showmatch                                              " Show matching brackets/parenthesis
set autoindent
set completeopt-=preview
set cmdheight=2                                            " the height of the command line
set guitablabel=%N\ \ %t\ %M
set nobackup                                               " no backup/swap files
set nowb
set noswapfile
set completeopt-=preview                                   " dont show me preview/scratch window when auto-completing
"set completeopt=menu                                       " show me menu of completion options
set completeopt=longest,menuone
set wildmode=longest,list:longest
set sessionoptions-=options                                " never save any vim options with the session!
set sessionoptions-=help
set sessionoptions-=blank
" ignore patterns for ctrlp, etc.
set wildignore+=*/tmp/*,*.so,*.swp,call.min.js,all.min.css 
set omnifunc=syntaxcomplete#Complete                       " enable autocomplete/syntax highlighting
set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" color schemes
set background=dark
colorscheme solarized
highlight SignColumn guibg=#073642                         
highlight SignColumn ctermbg=#073642

if has('gui_running')
    set guifont=Consolas:h14                                " font family and size
endif

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_snippet_engine = "ultisnips"
let g:ctrlp_working_path_mode = ''
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_diffs\|_uploads'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:gitgutter_sign_column_always = 1
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"

"inoremap <C-Space> <C-x><C-o>
nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"-----------------------------------------------
" autocomplete selection improvements
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" ----------------------------------------------
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" default handling of Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" get rid of background color when highlighing brackets
hi MatchParen guibg=NONE guifg=YELLOW

