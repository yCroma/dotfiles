# dotfiles

## alias

tk, tmux kill-session
pane2, tmux split window
gread, ghq+fzf でREADME.mdを一覧表示
glog, ghq+fzf でgit.logを表示
gfile, ghq+fzf でプロジェクトルートのファイルリスト表示
vip, CtrlPしながらvimを起動

### TODO
- [ ] tmux外でgのつくコマンドを叩いた時に、sessionをひらきながら起動する
- [ ] paneの小サイズ用のコマンドを追加する


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
|:Files          |fzf.vim                 |
|:GFiles         |                        |
|:GFiles?        |                        |
|:Buffers        |                        |
|:Colors         |                        |
|:History        |                        |
|<Leader>s       |easymotion              |
|<Leader>{j.k}   |                        |
|<C-e>           |winresizer              |
|<C-p>           |CtrlP                   |
|cs"'            |surround.vim            |
|ds"             |                        |

## tmux

prefix <C-o>

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

### requirements

- zplug

|plugin                 |do              |
|-----------------------|----------------|
|zsh-azyng              |非同期処理?     |
|pure                   |テーマ          |
|zsh-syntax-highlighting|syntax highlight|
|zsh-history-substring  |過去履歴?       |
|zsh-autosuggestions    |サジェスト      |
|zsh-completions        |補完強化?       |
|zsh-256color           |256色表示にする?|

## ghq

|command       |mean                                    |
|--------------|----------------------------------------|
|ghq create url|ローカルでgit initして連携してくれる    |
|ghq get url   |リモートからリポジトリをクローンしてくる|
|ghq list      |ghqが管理しているリポジトリのリスト表示 |

## fzf

### requirements

- ripgrep
- bat
