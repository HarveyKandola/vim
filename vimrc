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
"Plugin 'vim-scripts/Auto-Pairs.git'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'eiginn/netrw'
Plugin 'scrooloose/syntastic'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

filetype plugin indent on  
syntax enable                                              " enable as opposed to on (keeps theme colors)
set encoding=utf-8
set showcmd                                                " display incomplete commands
set nowrap                                                 " don't wrap lines
set shiftwidth=4 
set tabstop=4
set shiftwidth=4
set expandtab
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
set completeopt-=preview
set cmdheight=2                                   
set showtabline=2
"set guifont=Anonymous\ Pro:h15                          
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set cursorline
set guioptions+=e
set guitablabel=%N\ %t\ %M
set nobackup                                               
set nowb
set noswapfile
set completeopt-=preview                                   " dont show me preview/scratch window when auto-completing
set completeopt=longest,menuone
set wildmode=longest,list:longest
set sessionoptions-=options                                " never save any vim options with the session!
set sessionoptions-=help
set sessionoptions-=blank
"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
set foldcolumn=1
" turn on mouse things
set mouse=a
" ignore patterns for ctrlp, etc.
set wildignore+=*/tmp/*,*.so,*.swp,all.min.js,all.min.css 
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

autocmd BufNewFile,BufRead *.min.js set filetype=min.js
autocmd FileType min.js setlocal syntax=javascript

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_snippet_engine = "ultisnips"
let g:ctrlp_working_path_mode = ''
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_diffs\|_uploads\|build'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:gitgutter_sign_column_always = 1
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"

"-----------------------------------------------
" autocomplete selection improvements
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" ----------------------------------------------
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" get rid of background color when highlighing brackets
hi MatchParen guibg=NONE guifg=YELLOW

set background=dark
colorscheme solarized
highlight SignColumn guibg=#073642                         
highlight SignColumn ctermbg=#073642

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html', 'go', 'min.js'] }
let g:syntastic_javascript_checkers = ['jshint']
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'


