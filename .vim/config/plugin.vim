" install plugin with vim-plug

call plug#begin('~/.vim/ftplugin')
" auto-pair
Plug 'mattn/vim-lexiv'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" window resizing
Plug 'simeji/winresizer'

" change quotation
Plug 'tpope/vim-surround'

" Terminal Color Table
Plug 'guns/xterm-color-table.vim'

" for tmux
Plug 'christoomey/vim-tmux-navigator'

" move quic
Plug 'easymotion/vim-easymotion'

call plug#end()
