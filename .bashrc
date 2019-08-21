# OS名を取得
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# エイリアス設定
if [ $OS == 'Mac' ]; then
  alias ls='ls --color=auto'
fi

alias ll='ls -al'
alias vi='vim'

alias ..='cd ./../'
alias ...='cd ./../../'
alias ....='cd ./../../../'
alias .....='cd ./../../../../'

# 環境変数設定

## dircolor
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# 初期化
if [ $OS == 'Mac' ]; then
  eval $(dircolors ~/dircolors.ansi-universal)
elif [ $OS == 'Linux' ]; then
  eval $(dircolors ~/dircolors.ansi-universal)
fi

# Git設定
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}
source ~/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# PS1設定
export PS1='\[\e[0;30;107m\] \w \[\e[1;37;41m\]$(parse_git_branch)\[\e[0m\]\n \$ '

