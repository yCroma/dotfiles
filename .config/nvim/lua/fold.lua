-- folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 100

vim.cmd('augroup folding')
vim.cmd('autocmd!')
vim.cmd('autocmd FileType css                setlocal foldmethod=indent')
vim.cmd('autocmd FileType html               setlocal foldmethod=indent')
vim.cmd('autocmd FileType php                setlocal foldmethod=indent')
vim.cmd('autocmd FileType javascript         setlocal foldmethod=indent')
vim.cmd('autocmd FileType javascriptreact    setlocal foldmethod=indent')
vim.cmd('autocmd FileType typescript         setlocal foldmethod=indent')
vim.cmd('autocmd FileType typescriptreact    setlocal foldmethod=indent')
vim.cmd('autocmd FileType tmux setlocal foldmethod=marker')
vim.cmd('autocmd FileType vim  setlocal foldmethod=marker')
vim.cmd('autocmd FileType zsh  setlocal foldmethod=marker')
vim.cmd('augroup END')
