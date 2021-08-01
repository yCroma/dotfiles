" coc 全般のコンフィグ

" coc-explorer
let g:coc_explorer_global_presets = {
\   'ide': {
\     'position': 'left',
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\   },
\   'dotfiles': {
\     'root-uri': '~/dotfiles',
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\   },
\   '.vim': {
\     'position': 'left',
\     'root-uri': '~/.vim',
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ]
\   },
\   'home': {
\     'root-uri': '~/',
\     'sources': [
\       {'name': 'buffer', 'expand': v:true},
\       {'name': 'file', 'expand': v:true}
\     ],
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\ }

" Use preset argument to open it
nnoremap <space>ei :CocCommand explorer --preset ide<CR>
nnoremap <space>ed :CocCommand explorer --preset dotfiles<CR>
nnoremap <space>ev :CocCommand explorer --preset .vim<CR>
nnoremap <space>eh :CocCommand explorer --preset home<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets

" refresh
autocmd User CocDiagnosticChange,CocGitStatusChange
    \ call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['refresh'])


