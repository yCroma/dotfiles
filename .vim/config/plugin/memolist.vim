let g:memolist_path = "~/Dropbox/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = '~/.config/memolist/'

nnoremap <Space>mn :MemoNew<CR>
nnoremap <Space>ml :MemoList<CR>
nnoremap <Space>mg :MemoGrep<CR>

let g:memolist_fzf = 1
