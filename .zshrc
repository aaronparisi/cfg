printf '\n%.0s' {1..100}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/custom-git-commands/

export MANPAGER="vim -M +MANPAGER -c 'syntax off' -c 'set foldlevel=9999' -c 'set number relativenumber' -"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# uses homebrew-installed GNU coreutils' ls
alias ls='gls --group-directories-first -F -a --color=never'

alias python="python3"

function chpwd_do_ls () {
	ls
}
chpwd_functions=( chpwd_do_ls )

declare -a SCOLDS
SCOLDS=(
  "Everything is an instruction."
  "Remember the scream test."
	"rm is a dangerous command."
	"Read the error message."
  "Read the docs."
  "Generally, not trying too hard will result in good enough code."
)
alias clear='echo ${SCOLDS[ $RANDOM % ${#SCOLDS[@]} + 1 ]}'
alias c='clear'

alias vimz='vim ~/.zshrc'
alias vimv='vim ~/.vimrc'

alias sc='source ~/.zshrc'
alias ez='exec zsh'

alias ..='cd ..'

alias confgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ga='git add'
alias gad='git add .'
alias gcm='git commit -m'
alias gra='git remote add'
alias gpu='git push'
alias gbr='git branch'
alias gst='git status'
alias gsl='git stash list'
alias gsd='git stash drop'
alias gps='git push --set-upstream' 
alias glo='git log --oneline'
alias gvl='git vlog'
alias gvd='git vdiff'
alias gdt='git difftool'
alias grb='git rebase'
alias gcb='git checkout -b'
alias gco='git checkout'

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c%m)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]=' ?'
  fi
}

setopt prompt_subst
PROMPT=$'
%F{white}\u256d %~ ${vcs_info_msg_0_}
\u2570 %# %f'

# function git_branch_name() {
#   branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
#   if [[ $branch == "" ]];
#   then
#     :
#   else
#     echo '('$branch')'
#   fi
# }
# PROMPT=$'
# %F{white}\u256d %~ $(git_branch_name)
# \u2570 %# %f'

setopt auto_cd

autoload -U compinit; compinit

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
