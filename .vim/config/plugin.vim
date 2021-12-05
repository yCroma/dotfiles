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

" comment line
Plug 'tpope/vim-commentary'

" emmet
Plug 'mattn/emmet-vim'

" make table for markdown
Plug 'mattn/vim-maketable'

" markdown
Plug 'violetyk/iikanji-markdown.vim'

" memo
Plug 'glidenote/memolist.vim'

" window resizing
Plug 'simeji/winresizer'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" repeat complex commands
Plug 'tpope/vim-repeat'

" change quotation
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

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

" inline command tool
Plug 'skanehira/command.vim'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/ddc.vim'
" Plug 'Shougo/pum.vim'

Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

" 重複が気になる場合は下記のプラグインを入れる
" Plug 'Shougo/ddc-converter_remove_overlap'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'shun/ddc-vim-lsp'
Plug 'tani/ddc-fuzzy'
Plug 'matsui54/ddc-buffer'
Plug 'LumaKernel/ddc-file'


" undo tree
Plug 'mbbill/undotree'

call plug#end()
