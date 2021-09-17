# .zshrc

# source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# env
# {{{
export EDITOR=vim
export PATH=$PATH:$HOME/go/bin
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="\
    --layout=reverse \
    --border \
    --bind CTRL-B:preview-up,up:preview-up,CTRL-F:preview-down,down:preview-down
    "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="\
    --height 100% \
    --preview 'bat \
        --color=always \
        --style=numbers,changes \
        --line-range=:100 {}' \
    --preview-window down:80% \
    "

case ${OSTYPE} in
    linux*)
        export DENO_INSTALL="/home/kuroy/.deno"
        export PATH="$DENO_INSTALL/bin:$PATH"
        ;;
esac

# tentative not added {{{
# 色付きプレビュー {{{
# --preview 'bat \
#   --color=always \
#   --style=numbers,changes,header \
#   --line-range=:100 {}\
#   '\
# }}}
# インライン（フル画面にしない）{{{
# --info-inline
# }}}
# 高さ {{{
# --height 50%
# }}}
# }}}

# intentionally disabled {{{
# 高さは任意に設定したいから
# --height 50%
# 位置調整のやり方を残しておきたいから
# --preview-window down:99% 
# 状況によって、sortしたい時とそうでない時があるから
# --no-sort
# }}}

# }}}

# Use modern completion system
# {{{
autoload -Uz compinit
compinit
# }}}

# zplug
# {{{
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
# }}}

# alias
# {{{
alias pane="bash ~/dotfiles/.scripts/pane"
alias pane1="bash ~/dotfiles/.scripts/pane1"
alias pane11="bash ~/dotfiles/.scripts/pane11"
alias pane2="bash ~/dotfiles/.scripts/pane2"
alias ts="zsh ~/dotfiles/.scripts/ts"
alias tks="tmux kill-session"
alias tkw="tmux kill-window"
alias tusl="bash ~/dotfiles/.scripts/tusl"
alias vip="vim -c CtrlP"
alias vif="Vif"
alias vic='vim -c "tabnew"'
alias vit='vim -c "tabnew"'
alias vimo="vim -c MagitOnly"
alias ide='vim -c "Fern . -drawer -toggle"'
alias gread="zsh ~/dotfiles/.scripts/ghq/gread"
alias glog="zsh ~/dotfiles/.scripts/glog"
alias gdif="zsh ~/dotfiles/.scripts/gdif"
alias glist="zsh ~/dotfiles/.scripts/ghq/glist"
alias gfile="zsh ~/dotfiles/.scripts/ghq/gfile"
alias cdgr="cd-gitroot"
alias hcm="fzf-history-widget"
alias frm="zsh ~/dotfiles/.scripts/frm"
alias fgl="zsh ~/dotfiles/.scripts/fgl"
alias me="memo edit"
alias mn="memo new"
alias mc="memo cat"
alias ms="memo serve"

# os依存
case ${OSTYPE} in
    darwin*)
        alias ls="ls -FG"
        ;;
    linux*)
        alias ls="ls --color=auto"
        alias grep="grep --color=auto"
        ;;
esac
# }}}

# functions
#  {{{
# implemented function {{{
# cd した時に自動でlsしてくれる
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        # F: 拡張子を表示
        # G: 色付け
        ls -FG
    fi
}
# }}}

# original function {{{

Vif() {
    vim $(fzf --height 100% \
        --preview 'bat \
            --color=always \
            --style=numbers,changes,header \
            --line-range=:100 {}'\
        --preview-window down:80% )
}
# }}}

# }}}

