" install plugin with vim-plug

call plug#begin('~/.vim/ftplugin')
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

" change quotation
Plug 'tpope/vim-surround'

" Terminal Color Table
Plug 'guns/xterm-color-table.vim'

" for tmux
Plug 'christoomey/vim-tmux-navigator'

" move quic
Plug 'easymotion/vim-easymotion'

" git-diff
Plug 'airblade/vim-gitgutter'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Popup your buffer
Plug 'yCroma/pobls.vim'

" preview-markdown
Plug 'skanehira/preview-markdown.vim'

call plug#end()
