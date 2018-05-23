set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gerw/vim-latex-suite'
Plugin 'gmarik/vundle'
Plugin 'Rename'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ton/vim-bufsurf'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()
filetype plugin indent on

" mapping space and enter to new stuff
nmap <space> i<space><esc>l
nmap <enter> o<esc>
nmap <s-space> a<space><esc>
nmap <s-enter> O<esc

"let's the syntastic check for c++11 methods
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_python_checkers = ['pyflakes']

"vim-latex-suite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor = 'latex'

" Some other things
color desert
syntax on

set wildmenu
set showcmd
set autoindent
set confirm
set visualbell
set notimeout ttimeout ttimeoutlen=200

nmap <Leader>f gg=G
nmap <silent> <C-i> :BufSurfBack<CR>
nmap <silent> <C-o> :BufSurfForward<CR>
autocmd FileType plaintex,tex,json setlocal spell! spelllang=en_gb

" Setting tabwidths
autocmd FileType c setlocal shiftwidth=8 tabstop=8
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType r,ruby,eruby,plaintex,tex,matlab,yaml,scss,haskell,lhaskell,cabal setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c,cpp,java,php,r,ruby,eruby,plaintex,tex,matlab,yaml,make,haskell,lhaskell autocmd BufWritePre <buffer> :%s/\s\+$//e
