" syntax highlight
syntax enable
colorscheme minimalist

set number
set nocompatible
set complete-=i
set wildmenu
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

set hidden
set updatetime=300
set splitright
set splitbelow

set backspace=2
set hlsearch

" indent
if has("autocmd")
    "ファイルタイプの検索を有効にする
    filetype plugin on
    "ファイルタイプに合わせたインデントを利用
    filetype indent on
    "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
    autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType markdown    setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sh          setlocal sw=4 sts=4 ts=4 et
    autocmd FileType tmux        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType vim	       setlocal sw=2 sts=2 ts=2 et
endif

" folding
if has("autocmd")
    "ファイルタイプの検索を有効にする
    filetype plugin on
    autocmd FileType tmux        setlocal foldmethod=marker
    autocmd FileType zsh         setlocal foldmethod=marker
endif