function! s:init_ddc()
  let l:sources = []

  call ddc#custom#patch_global('completionMode', 'popupmenu')
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
          \   'matchers': ['matcher_head'],
          \   'sorters': ['sorter_rank']},
          \ })

  " vim-lsp
  let l:sources += ['vim-lsp']
  call ddc#custom#patch_global('sourceOptions', {
          \ 'vim-lsp': {
          \   'matchers': ['matcher_head'],
          \   'mark': 'LSP',
          \ },
          \ })

  " ddc-buffer
  let l:sources += ['buffer']
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {'matchers': ['matcher_fuzzy']},
        \ 'buffer': {
        \   'mark': 'B',
        \ },
        \ })

  call ddc#custom#patch_global('sourceParams', {
        \ 'buffer': {
          \ 'requireSameFiletype': v:false,
          \ 'fromAltBuf': v:true,
          \},
          \})
  call ddc#custom#patch_global('sources', l:sources)
  call ddc#enable()
endfunction


call s:init_ddc()

