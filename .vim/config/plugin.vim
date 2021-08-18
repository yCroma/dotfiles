" install plugin with vim-plug

call plug#begin('~/.vim/ftplugin')

" colorsheme {{{
Plug 'flazz/vim-colorschemes'
" }}}

" tabline {{{
Plug 'itchyny/lightline.vim'

" buftabline for lightline
" now i use tab
"Plug 'mengelbrecht/lightline-bufferline'
" }}}

" prettier
" now i use coc-prettier
" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html']}

" filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'

" auto-pair
Plug 'mattn/vim-lexiv'

" emmet
Plug 'mattn/emmet-vim'

" make table for markdown
Plug 'mattn/vim-maketable'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" window resizing
Plug 'simeji/winresizer'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" repeat complex commands
Plug 'tpope/vim-repeat'

" change quotation
Plug 'tpope/vim-surround'

" replace
Plug 'kqito/vim-easy-replace'

" Terminal Color Table
Plug 'guns/xterm-color-table.vim'

" for tmux
Plug 'christoomey/vim-tmux-navigator'

" move quic
"Plug 'easymotion/vim-easymotion'

" git-diff
Plug 'jreybert/vimagit'
" sign git diff
Plug 'airblade/vim-gitgutter'
" use for lightline to display FugitiveHead
Plug 'tpope/vim-fugitive'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'

" Popup your buffer
Plug 'yCroma/pobls.vim'

" preview-markdown
Plug 'skanehira/preview-markdown.vim'

" task runner
Plug 'thinca/vim-quickrun'

" smurt indent with backslash
"Plug 'lambdalisue/vim-backslash'

" show marks
" not used
"Plug 'kshenoy/vim-signature'
"Plug 'Yilin-Yang/vim-markbar'

" denops plugins
Plug 'vim-denops/denops.vim'
Plug 'skanehira/command.vim'

call plug#end()
