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
