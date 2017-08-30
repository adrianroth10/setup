set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'Buffergator'
Plugin 'derekwyatt/vim-scala'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gerw/vim-latex-suite'
Plugin 'gmarik/vundle'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'klen/python-mode'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'matchit.zip'
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

"vim-latex-suite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'

"python-mode
let g:pymode_rope_completion = 0

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
nmap <Leader>t :call RunCurrentSpecFile() <CR>
nmap <silent> <C-i> :BufSurfBack<CR>
nmap <silent> <C-o> :BufSurfForward<CR>

autocmd FileType c setlocal shiftwidth=8 tabstop=8
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType r,ruby,eruby,plaintex,tex,matlab,yaml,scss,haskell setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c,cpp,java,php,r,ruby,eruby,plaintex,tex,matlab,yaml,make autocmd BufWritePre <buffer> :%s/\s\+$//e
