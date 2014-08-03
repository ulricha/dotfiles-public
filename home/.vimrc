filetype on 
filetype plugin on
filetype indent on
syntax on
set smartindent
set smarttab
set number
set hlsearch
set incsearch
set ignorecase
set showcmd
set showmatch

colors zenburn

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
let python_highlight_all=1

autocmd FileType tex,latex setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2 textwidth=80

autocmd FileType c setlocal nosmartindent cindent noexpandtab tabstop=8 shiftwidth=8 textwidth=78

autocmd FileType mail setlocal textwidth=80 nosmartindent noautoindent nocindent

autocmd BufRead *.java set makeprg=ant\ -find textwidth=80 shiftwidth=4
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%# 

autocmd FileType ocaml setlocal shiftwidth=2 textwidth=78

autocmd FileType xhtml,html set shiftwidth=2
autocmd FileType cpp setlocal nosmartindent cindent noexpandtab tabstop=4 shiftwidth=4

autocmd FileType cabal,haskell setlocal expandtab shiftwidth=4
