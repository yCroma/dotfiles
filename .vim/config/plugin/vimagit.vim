let g:magit_default_show_all_files = 2
let g:magit_default_fold_level = 1
let g:magit_auto_foldopen = 0

let g:magit_folding_open_mapping = [ 'l', 'zo', 'zO' ]
let g:magit_folding_close_mapping = [ 'h', 'zc', 'zC' ]

nnoremap <Space>mg :Magit<CR>
nnoremap <Space>mo :MagitOnly<CR>
nnoremap S Szz

"autocmd FileType magit nnoremap <buffer> { {<Down>
"autocmd FileType magit nnoremap <buffer> } <UP>}<Down>
