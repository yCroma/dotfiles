export DENO_INSTALL="/home/kuroy/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

alias tmux='tmux -2'
alias pane='bash ~/.scripts/pane'

# ターミナルプロンプトの表示・色の変更
# git や PROMPT_COMMANDは下の記事
# url: https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
# Bashプロンプトの変更
# url: https://qiita.com/zaburo/items/9194cd9eb841dea897a0
# Macのターミナル（bash）を最低限色付けする
# url: https://qiita.com/lemtosh469/items/81919186611ac68b11c8

# 更新点：
# Bashプロンプト：ディレクトリパスのイニシャルを取得する方法
# url: https://www.javaer101.com/en/article/96142520.html

source ~/dotfiles/.scripts/git_prompt

# PS1 variable
PROMPT_NONE="\[\e[m\]"
PROMPT_GREEN="\[\e[0;32m\]"
PROMPT_BLUE="\[\e[0;34m\]"
PROMPT_YELLOW="\[\e[0;33m\]"
PROMPT_USERNAME="\u"
PROMPT_HOSTNAME="\h"
PROMPT_DIRFULLPATH="\w"
PROMPT_USERRANK="\$"

# 出力毎に実行
function reload {
	export PS1="$PROMPT_GREEN$PROMPT_USERNAME$PROMPT_NONE@$PROMPT_HOSTNAME $PROMPT_GREEN$PROMPT_DIRFULLPATH $PROMPT_NONE$(__git_ps1 "(%s)") $PROMPT_NONE$PROMPT_USERRANK "
}

PROMPT_COMMAND='reload'. ~/.bashrc

#export CLICOLOR=1
#export TERM=xterm-256color
