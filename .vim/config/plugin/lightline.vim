let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ },
      \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
