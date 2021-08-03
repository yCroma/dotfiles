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

# functions

# cd_ghq_readme {{{
function cd_ghq_readme() {
    local destination_dir="$(ghq root)/$(ghq list | fzf --layout=reverse --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")"
    if [ -n "$destination_dir" ]; then
        cd $destination_dir
    fi
}
# }}}

# cd_ghq_log {{{
function cd_ghq_log() {
    local destination_dir="$(ghq root)/$(ghq list | fzf --layout=reverse --preview "git --git-dir $(ghq root)/{}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")"
    if [ -n "$destination_dir" ]; then
        cd $destination_dir
    fi
}
# }}}

# cd_ghq_file {{{
function cd_ghq_file() {
    local destination_dir="$(ghq root)/$(ghq list | fzf --layout=reverse --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")"
    if [ -n "$destination_dir" ]; then
        cd $destination_dir
    fi
}
# }}}

# alias
# {{{
alias pane2="bash ~/dotfiles/.scripts/pane2"
alias tks="bash ~/dotfiles/.scripts/tks"
alias gread=cd_ghq_raedme
alias glog=cd_ghq_log
alias gfile=cd_ghq_file
# }}}
