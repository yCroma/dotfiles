let g:fern#default_hidden = 1

let g:fern#renderer#default#leaf_symbol = "   "
let g:fern#renderer#default#collapsed_symbol = " + "
let g:fern#renderer#default#expanded_symbol = " - "

let g:fern#renderer = "nerdfont"

nnoremap <Space>eb :Fern . -reveal=%<CR>
nnoremap <Space>ef :Fern . -reveal=%<CR>
nnoremap <Space>eF :Fern . -opener=vsplit -reveal=%<CR>
nnoremap <Space>es :Fern . -opener=split -reveal=%<CR>
nnoremap <Space>ei :Fern . -drawer -reveal=% -toggle<CR>
nnoremap <Space>ed :Fern ~/dotfiles -drawer -reveal=% -toggle<CR>
"nnoremap <Space>ev :Fern ~/dotfiles/.vim -drawer -reveal=% -toggle<CR>
nnoremap <Space>ev :Fern . -opener=vsplit -reveal=%<CR>

function! s:init_fern() abort
  "Use 'select' instead of 'edit' for default 'open' action
  "nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  " remap for fern
  nmap <buffer> <C-h> <C-w><C-h>
  nmap <buffer> <C-j> <C-w><C-j>
  nmap <buffer> <C-k> <C-w><C-k>
  nmap <buffer> <C-l> <C-w><C-l>
  nmap <buffer> q :q<CR>
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> a <Plug>(fern-action-new-file)
  nmap <buffer> A <Plug>(fern-action-new-dir)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> df <Plug>(fern-action-trash)
  nmap <buffer> dF <Plug>(fern-action-remove)
  nmap <buffer> - <Plug>(fern-action-leave)
  nmap <buffer> <CR> <Plug>(fern-action-enter)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
