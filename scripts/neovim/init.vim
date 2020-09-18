"set smartindent                         " Makes indenting smart
"set autoindent                          " Good auto indent

" General behavior for tabs
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2                       " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set expandtab                           " Converts tabs to spaces

" Setting for special filetypes
autocmd FileType c setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
