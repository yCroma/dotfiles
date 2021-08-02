# dotfiles

## vim

### requirements

- for coc
  - node
  - npm
- for preview-markdown
  - mdcat
    - `brew install mdcat`

|commands        |plugins                 |
|----------------|------------------------|
|:PlugInstall    |VimPlug                 |
|:PlugUpdate     |                        |
|:PlugClean      |                        |
|:XTermColorTable|show terminal 256 colors|
|:SyntaxInfo     |SyntaxInfo              |
|:PreviewMarkdown|preview-markdown        |
|:MakeTable      |vim-maketable           |
|:MakeTable!     |                        |
|:UnmakeTable    |                        |
|<Leader>s       |easymotion              |
|<Leader>{j.k}   |                        |
|<C-e>           |winresizer              |
|<C-p>           |CtrlP                   |
|cs"'            |surround.vim            |
|ds"             |                        |

## tmux

|command              |mean                        |
|---------------------|----------------------------|
|tmux ls              |session 一覧を見る          |
|tmux a -t session_num|session_numにアタッチする   |
|prefix               |C-b                         |
|pre + c.C            |{window. Session}を作成する |
|pre + I.O            |windowを切り替える          |
|pre + H.L            |Sessionを切り替える         |
|pre + -.|            |pane を切る                 |
|pre + a              |アタッチしているwindowの一覧|
|pre + s              |セッション一覧              |
|pre + t              |aと同じ？                   |
|pre + d              |detach session              |
|pre + hjkl           |サイズ変更                  |
|pre + Right.Left     |windowの入れ替え            |
|pre + {}             |paneの入れ替え              |

## zsh

test
