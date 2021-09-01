# dotfiles

## setup

1. symbolic_linkをはる
2. osごとのファイルを実行

## middleware

- vim
- tmux
- fzf
  - bat, fd, riqgrep
- ghq
  - golang
- node, npm (for coc)
- deno(for denops)
- mdcat (for preview-markdown.vim)

## memo

- vim-plugin
  - vimagit
    - L: staging line
    - M: mark
    - S: stage/unstage marks or visualed
    - F: stage/unstage the file
    - CC: open commit section || commit
  - fugitive
    - :Git rm --cached %

## alias

| alias     | command                                          |
| --------- | ------------------------------------------------ |
| tks       | tmux kill-session                                |
| tkw       | tmux kill-window                                 |
| tusl      | tmux update status-line                          |
| pane{num} | tmux split window                                |
| gread     | ghq+fzf で README.md を一覧表示                  |
| glog      | ghq+fzf で git.log を表示                        |
| gfile     | ghq+fzf でプロジェクトルートのファイルリスト表示 |
| vip       | CtrlP しながら vim を起動                        |
| vif       | FZF しながら vim を起動                          |
| cdgr      | git-root まで移動                                |

### TODO

- [x] tmux 外で g のつくコマンドを叩いた時に、session をひらきながら起動する
- [x] pane の小サイズ用のコマンドを追加する

## vim

### requirements

- for coc
  - node
  - npm
- for preview-markdown
  - mdcat
    - `brew install mdcat`

| commands         | plugins                  |
| ---------------- | ------------------------ |
| :PlugInstall     | VimPlug                  |
| :PlugUpdate      |                          |
| :PlugClean       |                          |
| :XTermColorTable | show terminal 256 colors |
| :SyntaxInfo      | SyntaxInfo               |
| :MakeTable       | vim-maketable            |
| :MakeTable!      |                          |
| :UnmakeTable     |                          |
| :Files           | fzf.vim                  |
| :GFiles          |                          |
| :GFiles?         |                          |
| :Buffers         |                          |
| :Colors          |                          |
| :History         |                          |
| <Leader>s        | easymotion               |
| <Leader>{j.k}    |                          |
| <C-e>            | winresizer               |
| <C-p>            | CtrlP                    |
| cs"'             | surround.vim             |
| ds"              |                          |
| <Space>qr        | quickrun.vim             |
| <Space>md        | preview-markdown         |

## tmux

prefix <C-o>

| command               | mean                           |
| --------------------- | ------------------------------ |
| tmux ls               | session 一覧を見る             |
| tmux a -t session_num | session_num にアタッチする     |
| prefix                | C-q                            |
| pre + c.C             | {window. Session}を作成する    |
| pre + I.O             | window を切り替える            |
| pre + H.L             | Session を切り替える           |
| pre + -.pipe          | pane を切る                    |
| pre + a               | アタッチしている window の一覧 |
| pre + s               | セッション一覧                 |
| pre + t               | a と同じ？                     |
| pre + d               | detach session                 |
| pre + hjkl            | サイズ変更                     |
| pre + Right.Left      | window の入れ替え              |
| pre + {}              | pane の入れ替え                |
| pre + [               | コピーモードの開始             |

## zsh

### requirements

- zplug

| plugin                  | do                |
| ----------------------- | ----------------- |
| zsh-azyng               | 非同期処理?       |
| pure                    | テーマ            |
| zsh-syntax-highlighting | syntax highlight  |
| zsh-history-substring   | 過去履歴?         |
| zsh-autosuggestions     | サジェスト        |
| zsh-completions         | 補完強化?         |
| zsh-256color            | 256 色表示にする? |

## ghq

| command        | mean                                     |
| -------------- | ---------------------------------------- |
| ghq create url | ローカルで git init して連携してくれる   |
| ghq get url    | リモートからリポジトリをクローンしてくる |
| ghq list       | ghq が管理しているリポジトリのリスト表示 |

## fzf

### requirements

- ripgrep
- bat
- fd
