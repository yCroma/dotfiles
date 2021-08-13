let g:markbar_open_vertical = v:false
let g:markbar_height = 8
let g:markbar_open_position = "rightbelow"
let g:markbar_marks_to_display = 'abcdefghijklmnopqrstuvwxyz'
let g:markbar_num_lines_context = {
      \ 'around_local': 2,
      \ 'around_file': 0, 
      \ }
nnoremap <Space>ms <Plug>ToggleMarkbar

" the following are unneeded if ToggleMarkbar is mapped
" nmap <Leader>mo <Plug>OpenMarkbar
" nmap <Leader>mc <Plug>CloseMarkbar
