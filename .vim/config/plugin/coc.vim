" coc 全般のコンフィグ
" coc.nvim {{{
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
inoremap <C-S> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-yaml',
      \ 'coc-docker',
      \ 'coc-explorer']
" }}}

" coc-explorer {{{
let g:coc_explorer_global_presets = {
\   'ide': {
\     'position': 'left',
\     'width': 35,
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\   },
\   'dotfiles': {
\     'root-uri': '~/dotfiles',
\     'position': 'left',
\     'width': 35,
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\   },
\   'buffer': {
\     'position': 'right',
\     'width': 60,
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\     ],
\   },
\   '.vim': {
\     'position': 'left',
\     'root-uri': '~/.vim',
\     'width': 35,
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ]
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\ }

" Use preset argument to open it
nnoremap <space>ei :CocCommand explorer --preset ide<CR>
nnoremap <space>ed :CocCommand explorer --preset dotfiles<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>
nnoremap <space>ev :CocCommand explorer --preset .vim<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>

" List all presets
nnoremap <space>el :CocList explPresets

" refresh
autocmd User CocDiagnosticChange,CocGitStatusChange
    \ call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['refresh'])

" }}}
