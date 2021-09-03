" coc 全般のコンフィグ
" coc.nvim {{{
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
inoremap <C-S> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
" can not use noremap for <Plug>
" https://github.com/neoclide/coc.nvim/issues/1207
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-emmet',
      \ 'coc-docker']
 "     \ 'coc-explorer']
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
\     'position': 'buffer',
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\     'quit-on-open': v:true,
\     'open-action-strategy': "previousBuffer"
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
\   'tab': {
\     'position': 'tab',
\     'sources': [
\       {'name': 'file', 'expand': v:true}
\     ],
\     'quit-on-open': v:true,
\     'open-action-strategy': 'split',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\ }

" Use preset argument to open it
"nnoremap <space>ei :CocCommand explorer --preset ide<CR>
"nnoremap <space>ed :CocCommand explorer --preset dotfiles<CR>
"nnoremap <space>eb :CocCommand explorer --preset buffer<CR>
"nnoremap <space>ev :CocCommand explorer --preset .vim<CR>
"nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
"nnoremap <space>et :CocCommand explorer --preset tab<CR>

" List all presets
nnoremap <space>el :CocList explPresets

" refresh
autocmd User CocDiagnosticChange,CocGitStatusChange
    \ call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['refresh'])

" }}}

" coc-prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }}}
