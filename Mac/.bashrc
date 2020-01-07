# ls
alias ll='ls -l'
alias la='ls -la'

# rm
# brew install rmtrash
alias rm='rmtrash'

# git
alias add='git add'
alias com='git commit'
alias push='git push'
alias pull='git pull'
alias fetch='git fetch'
alias stash='git stash'
alias clone='git clone'
alias gd='git diff'

# git reset
alias grh='git reset --hard'

# git branch
alias gbr='git branch'
alias gch='git checkout'
alias gst='git status'

# git log
alias gl='git log --oneline -n 50'
alias gg='git log --oneline --graph --all'
alias graph='git graph'

# fastlane
alias fastlane='bundle exec fastlane'


# gitの設定
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# color
# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1='\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
else
    PS1='\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
fi

