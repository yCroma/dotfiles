let g:fern#default_hidden = 1
nnoremap <Space>ef :Fern . -reveal=%<CR>
nnoremap <Space>eF :vsp<CR>:Fern . -reveal=%<CR>

function! s:init_fern() abort
  "Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
