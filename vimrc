"
" You might need to install these on OSX:
" 
" brew install ctags
" go get -u github.com/jstemmer/gotags
" npm install -g git+https://github.com/ramitos/jsctags.git
" npm install -g jshint
"

set nocompatible                " choose no compatibility with legacy vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'mklabs/grunt.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'vim-scripts/Auto-Pairs.git'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'eiginn/netrw'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rizzatti/dash.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'ternjs/tern_for_vim'

call vundle#end()

filetype plugin indent on  
syntax enable                                              " enable as opposed to on (keeps theme colors)

"------------------------------------------------------------------------------
" General defaults
set encoding=utf-8
set showcmd                                                " display incomplete commands
"set nowrap                                                 " don't wrap lines
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
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set cursorline
set guioptions+=e
" this next line is now in .gvimrc
"set guitablabel=\[%N\]\ %t\ %M 
set nobackup                                               
set nowb
set noswapfile
set completeopt-=preview                                   " dont show me preview/scratch window when auto-completing
set completeopt=longest,menuone
set wildmode=longest,list:longest
set sessionoptions-=options                                " never save any vim options with the session!
set sessionoptions-=help
set sessionoptions-=blank
set mouse=a
set scrolloff=5
" Multiple windows are equally sized and open in reading order.
set equalalways
set splitbelow splitright

"------------------------------------------------------------------------------
" Auto-complete file types
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
" autocomplete selection improvements -- http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:omni_sql_no_default_maps = 1

"------------------------------------------------------------------------------
" File type mappings
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufRead *.min.js set filetype=min.js
autocmd FileType min.js setlocal syntax=javascript
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

"------------------------------------------------------------------------------
" Key mappings
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <F2> :buffers<CR>:buffer<Space>
nnoremap <F3> :bdelete<CR>
nnoremap <F4> :vs<CR>
nnoremap <F5> :sp<CR>
nnoremap <F6> <C-w>w
nnoremap <F7> :TagbarToggle<CR>
nnoremap <F9> :Dash<CR>
au FileType go nmap <F10> :GoDef<CR>
au FileType go nmap <F11> :GoReferrers<CR>
au FileType go nmap <F12> <Plug>(go-rename)

"------------------------------------------------------------------------------
" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "ultisnips"
"let g:tagbar_type_go = {
    "\ 'ctagstype' : 'go',
    "\ 'kinds'     : [
        "\ 'p:package',
        "\ 'i:imports:1',
        "\ 'c:constants',
        "\ 'v:variables',
        "\ 't:types',
        "\ 'n:interfaces',
        "\ 'w:fields',
        "\ 'e:embedded',
        "\ 'm:methods',
        "\ 'r:constructor',
        "\ 'f:functions'
    "\ ],
    "\ 'sro' : '.',
    "\ 'kind2scope' : {
        "\ 't' : 'ctype',
        "\ 'n' : 'ntype'
    "\ },
    "\ 'scope2kind' : {
        "\ 'ctype' : 't',
        "\ 'ntype' : 'n'
    "\ },
    "\ 'ctagsbin'  : 'gotags',
    "\ 'ctagsargs' : '-sort -silent'
"\ }

"------------------------------------------------------------------------------
" CTRL-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,all.min.js,all.min.css,*/dist/*,*/dist-prod/*
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = { 
            \ 'dir': '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|_uploads$\|_convert$\|tmp$\|_diffs$\|dist-prod$\|node_modules$\|project_files$\|test$', 
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'
            \ }
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_diffs\|_uploads\|build\|tmp\|tests\|dist\|dist-prod\|bower_components'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_match_window = 'bottom,order:ttb'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"let g:ctrlp_user_command = 'ag %s -l -g ""'
let g:ctrlp_match_window = 'results:30'    

"------------------------------------------------------------------------------
" Git
let g:gitgutter_sign_column_always = 1

"------------------------------------------------------------------------------
" Snippets
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"

"------------------------------------------------------------------------------
" Colors
" get rid of background color when highlighing brackets
hi MatchParen guibg=NONE guifg=YELLOW
set background=dark
colorscheme solarized
highlight SignColumn guibg=#073642                         
"highlight SignColumn ctermbg=#073642
"remove search highlighting
nnoremap <silent> <esc> :noh<cr><esc>

"------------------------------------------------------------------------------
" Code folding
set foldcolumn=1
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
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

"------------------------------------------------------------------------------
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['js', 'go'],
    \ 'passive_filetypes': ['html', 'min.js'] }
let g:syntastic_ignore_files = ['\.min\.js$', '\.min\.css$']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_enable_signs=1

"------------------------------------------------------------------------------
" Airline Status
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

