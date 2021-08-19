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

" move buffer into tabline
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bpre<CR>

" push Esc twice, stop hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" <C-c> to <Esc>
inoremap <C-c> <Esc>

" switch window
nnoremap <space>r <C-w>r
nnoremap <space>R <C-w>R

" search use verymagic
nnoremap / /\v

" mapping for terminl
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <C-h> <C-w>h

" create tab
nnoremap <Space>t0 :0tabnew<CR>
nnoremap <Space>t$ :$tabnew<CR>
nnoremap <Space>t1 :1gt<CR>
nnoremap <Space>t2 :2gt<CR>
nnoremap <Space>t3 :3gt<CR>

" create tab Terminal
" nnoremap <silent><Space>t :0tabnew<CR>:terminal ++curwin<CR>
nnoremap <Space>tv :vert terminal<CR>
nnoremap <Space>ts :bo terminal<CR>
