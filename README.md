# dotfiles

## vim-work

### vim
:PlugInstall : VimPlug
<C-e>: winresizer
cs"' : surround.vim
:SyntaxInfo : color info
:XTermColorTable : show terminal 256 colors


### tmux

tmux ls : session 一覧を見る
tmux a -t {session_num} : session_numにアタッチする

prefix = C-b

pre + c,C : {window, Session}を作成する
pre + I,O : windowを切り替える
pre + H,L : Sessionを切り替える
pre + -,| : pane を切る
pre + a   : アタッチしているwindowの一覧
pre + s	  : セッション一覧
pre + t   : aと同じ？

pre + d   : detach session
