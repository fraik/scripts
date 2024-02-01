" vrij naar: https://dougblack.io/words/a-good-vimrc.html
:sy on                " enable syntax processing
:se tabstop=4         " number of visual spaces per TAB 
:se softtabstop=4     " number of spaces in tab when editing
:se shiftwidth=4      " number of spaces when indenting using >
:se expandtab         " tabs are spaces
:se nu                " linenumbers
:se showcmd           " show command in showcmdloc
:se wildmenu          " visual autocomplete for command menu
:se lazyredraw        " redraw only when we need to
:se incsearch         " search as characters are entered
:se hlsearch          " highlight matches
:se foldenable        " enable folding
:se foldlevelstart=10 " open most folds by default
:se foldmethod=indent " fold based on indent level
:se bg=dark           " the dark side is strong in this one
" space open/closes folds
nnoremap <space> za

" sometimes handy
":se cursorline        " highlight current line

" temporarily interpret Jenkinsfile as Groovy with silly tabs
:au BufNewFile,BufRead Jenkinsfile setf groovy | :se tabstop=3 | :se softtabstop=3 | :se shiftwidth=3
