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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/custom-git-commands/

export MANPAGER="vim -M +MANPAGER -c 'syntax off' -c 'set foldlevel=9999' -c 'set number relativenumber' -"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd zshmarks)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# alias ja='exa --oneline --classify --all --all --group-directories-first --color=never'
# alias jao='exa --oneline --all --all --classify --group-directories-first --color=never'
# alias jal='exa --long --all --all --group-directories-first --color=never'
# alias jat='exa --tree --level=2 --color=never'

# uses homebrew-installed GNU coreutils' ls
alias ls='gls --group-directories-first -F -a --color=auto'

alias gm="jump"
alias sm="bookmark"
alias dm="deletemark"
alias pm="showmarks"

alias chrome="open -a 'Google Chrome'"
alias copypath="pwd|pbcopy"

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

alias confgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# zsh vi mode
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

# export LS_COLORS="di=31;41:ln=31;41:so=31;41:pi=31;41:ex=31;41:bd=31;41:cd=31;41:su=31;41:sg=31;41:tw=31;41:ow=31;41:"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# ignore me
