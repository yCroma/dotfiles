# ENV
export EDITOR=vim
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="\
    --layout=reverse \
    --info inline \
    --border \
    --bind CTRL-B:preview-up,up:preview-up,CTRL-F:preview-down,down:preview-down
    --preview 'bat \
        --color=always \
        --style=numbers,changes,header \
        --line-range=:100 {}\
        '\
    "
# disabled setting
#--preview-window down:99% \

# Use modern completion system
autoload -Uz compinit
compinit

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplugins {{{
# 非同期処理できるようになる
zplug "mafredri/zsh-async"

# テーマ(ここは好みで。調べた感じpureが人気)
zplug "sindresorhus/pure"

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"

# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
zplug "zsh-users/zsh-history-substring-search"

# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zplug "zsh-users/zsh-autosuggestions"

# 補完強化
zplug "zsh-users/zsh-completions"

# 256色表示にする
zplug "chrissicool/zsh-256color"

# cd-gitroot でgit rootへ移動できる
zplug "mollifier/cd-gitroot"

# cd した時に自動でlsしてくれる
zplug "desyncr/auto-ls"
AUTO_LS_COMMANDS=(ls)

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# コマンドの履歴機能
# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000
# Then, source plugins and add commands to $PATH
zplug load

# }}}

# alias
# {{{
alias pane="bash ~/dotfiles/.scripts/pane"
alias pane1="bash ~/dotfiles/.scripts/pane1"
alias pane11="bash ~/dotfiles/.scripts/pane11"
alias pane2="bash ~/dotfiles/.scripts/pane2"
alias tks="tmux kill-session"
alias tkw="tmux kill-window"
alias tusl="bash ~/dotfiles/.scripts/tusl"
alias vip="vim -c CtrlP"
alias ide='vim -c "CocCommand explorer --preset ide"'
alias gread="zsh ~/dotfiles/.scripts/ghq/gread"
alias glog="zsh ~/dotfiles/.scripts/ghq/glog"
alias glist="zsh ~/dotfiles/.scripts/ghq/glist"
alias gfile="zsh ~/dotfiles/.scripts/ghq/gfile"
alias cdgr="cd-gitroot"

alias ls="ls -FG"
# }}}
