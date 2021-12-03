call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
        \ 'vim-lsp': {
        \   'matchers': ['matcher_fuzzy'],
        \   'sourters': ['souter_fuzzy'],
        \   'converters': ['converter_fuzzy'],
        \   'mark': 'lsp',
        \ },
        \ })

call ddc#custom#patch_global('source', ['buffer'])
call ddc#custom#patch_global('sourceOptions', {
      \ 'buffer': {
      \   'matchers': ['matcher_fuzzy'],
      \   'mark': 'B',
      \ },
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'buffer': {
      \ 'requireSameFiletype': v:false,
      \ 'fromAltBuf': v:true,
      \},
      \})

" Customize global settings
" Use around source.
"call ddc#custom#patch_global('completionMenu', 'pum.vim')
"let g:setline_insert = v:true
"inoremap <C-n> <Cmd>call pum#map#select_relative(+1)<CR>
"inoremap <C-p> <Cmd>call pum#map#select_relative(-1)<CR>
"inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
"inoremap <C-e> <Cmd>call pum#map#cancel()<CR>
" https://github.com/Shougo/ddc-around
" call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
" 
" error
" call ddc#custom#patch_global('sourceOptions', {
"       \ '_': {
"       \   'matchers': ['matcher_head'],
"       \   'sorters': ['sorter_rank']},
"       \ })

" Mappings


" Use ddc.
call ddc#enable()
