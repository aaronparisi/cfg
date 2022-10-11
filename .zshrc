printf '\n%.0s' {1..100}
#
# numterms=$(~/numterms.sh)
# prevnumterms=$(cat ./prevnumterms.txt)
# 
# # if (( $numterms > prevnumterms )); then
# if (( false )); then
# 	# get nyt headlines and print links for them
# 	nyt_response=$(curl "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=TCFjpTQnj7jzvmtelNVLTvRbQZAnqWnH")
# 	jq -r '.results[] | "\u001b]8;;\(.url)\u0007\(.title)\u001b]8;;\u0007"' <<<"$nyt_response"
# 
# 	echo
# 	echo
# 
# 	# print out local weather
# 	curl wttr.in
# else
# 	ps aux
# fi

# echo $numterms > ~/prevnumterms.txt

#TRAPEXIT() {
#	echo "inside TRAPEXIT"
#	sleep 1
#	echo $( ~/numterms.sh ) > ~/prevnumterms.txt
#}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/custom-git-commands/

export MANPAGER="vim -M +MANPAGER -c 'syntax off' -c 'set foldlevel=9999' -c 'set number relativenumber' -"

plugins=(git wd zshmarks)

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

alias gm="jump"
alias sm="bookmark"
alias dm="deletemark"
alias pm="showmarks"

alias chrome="open -a 'Google Chrome'"
alias copypath="pwd|pbcopy"

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

alias ga='git add .'
alias gcm='git commit -m'
alias grao='git remote add origin'
alias gp='git push'
alias gst='git status'
alias gpuo='git push --set-upstream origin'
alias glo='git log --oneline'
alias gvl='git vlog'
alias gvd='git vdiff'
alias grb='git rebase'
alias gcb='git checkout -b'
alias gco='git checkout'

precmd() { print "" }

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

PROMPT=$'%F{white}\u256d %n@%m %f%F{green}%~%f %F{blue}${vcs_info_msg_0_}%f
%F{white}\u2570 %f%F{white}%# %f'

setopt auto_cd

autoload -U compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
