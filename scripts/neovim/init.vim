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


" Spell checking
autocmd FileType plaintex,tex,markdown setlocal spell! spelllang=en_gb
" Toggle spell check for other files
map <Leader>ts :setlocal spell! spelllang=en_gb<CR>
set spellfile=~/.config/nvim/spell/en.utf-8.add

" ale config
let g:ale_linters = { 'python': ['pyflakes'] }

" vim-latex-suite config
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:tex_flavor = 'latex'
let g:Tex_Env_figure = "\\begin{figure}[<+htpb+>]\<cr>\\centering\<cr>\\includegraphics[width=.7\\textwidth]{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"

