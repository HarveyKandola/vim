if has("gui_macvim")
    macmenu File.Print key=<nop>
    map <D-p> :CtrlP<CR>
endif
set guitablabel=\[%N\]\ %t\ %M 

hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white guibg=#244144 
