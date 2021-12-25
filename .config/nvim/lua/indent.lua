vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

--vim.cmd("if has ('autocmd')")
vim.cmd("autocmd FileType make          setlocal ts=4")
vim.cmd("autocmd FileType php           setlocal ts=4")

vim.cmd("autocmd FileType dockerfile    setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType sh            setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType tmux          setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType zsh           setlocal sw=4 sts=4 ts=4 et")
--vim.cmd("endif")
