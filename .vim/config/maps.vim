" maps

" move window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" move cursor and centering
noremap j gjzz
noremap k gkzz
noremap { {zz
noremap } }zz
noremap za zazz
noremap n nzz
noremap N Nzz
noremap H Hzz
noremap M Mzz
noremap L Lzz
noremap G Gzz

" once push g, jump line number
nnoremap - ggzz
" jump with my feelings
noremap <C-i> <C-o>zz
noremap <C-o> <C-i>zz

" move buffer
nnoremap [b :bpre<CR>
nnoremap ]b :bnext<CR>
" move tab
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

" push Esc twice, stop hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" toggle relativenumber
"nnoremap <Space>tn  :<C-u>setlocal relativenumber!<CR>

" <C-c> to <Esc>
inoremap <C-c> <Esc>

" switch window
nnoremap <space>r <C-w>r
nnoremap <space>R <C-w>R

" split window
nnoremap <space>s :split<CR>
nnoremap <space>v :vsplit<CR>

" search use verymagic
nnoremap / /\v

" mapping for terminl
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <C-h> <C-w>h

" create tab
nnoremap <Space>t0 :0tabnew<CR>
nnoremap <silent><Space>t$ :$tabnew<CR>
nnoremap <Space>tn :tabnew<CR>
nnoremap <Space>g1 1gt<CR>
nnoremap <Space>g2 2gt<CR>
nnoremap <Space>g3 3gt<CR>

" create tab Terminal
" nnoremap <silent><Space>t :0tabnew<CR>:terminal ++curwin<CR>
nnoremap <Space>tv :vert terminal<CR>
nnoremap <Space>ts :bo terminal<CR>
