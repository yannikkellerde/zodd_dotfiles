# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" > /dev/null
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
ZSH_DISABLE_COMPFIX="true"
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
export ZSH="/home/kappablanca/.oh-my-zsh"
DISABLE_AUTO_UPDATE="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
prompt default &> /dev/null
PROMPT='%F{magenta}%1~%f %F{red}❯%F{yellow}❯%F{green}❯ %f'

ZSH_AUTOSUGGEST_STRATEGY=(history completion)


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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(
    zsh-autosuggestions 
    git 
    history 
    web-search 
    copydir 
    copyfile 
    copybuffer 
    dirhistory
);

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#
# -------------------- VARIABLES --------------------
#

export PATH="$HOME/.config/polybar/scripts:$PATH"
export PATH="$DOTFILES/setup-scripts:$PATH"
export PATH="/home/kappablanca/.local/bin:$PATH"
export PATH="/home/kappablanca/Documents/git-lab/dotfiles/setup-scripts:$PATH"
PATH=$PATH:$HOME/.config/polybar/scripts:$HOME/.scripts:$HOME/.scripts/theme-swap

export BROWSER="firefox"
export WALLPAPERS="$HOME/.wallpapers"


# o---------------------------------------------------------------------------------------o
# |--------------------------------------- ALIASES ---------------------------------------|
# o---------------------------------------------------------------------------------------o


# ---------------------------------------- File Editing ----------------------------------------

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias condas='source /home/kappablanca/.local/bin/conda_activate.sh && conda'
alias vim='nvim'
alias ovim='vim'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc='nvim $HOME/.zshrc'

# Ranger configuration file
alias rangerc='nvim $HOME/.config/ranger'

# nvim configuration file
alias vimrc='nvim $HOME/.config/nvim/init.vim'
alias bspwmrc='nvim $HOME/.config/bspwm/bspwmrc'
    
# Polybar config
alias polycfg='nvim $HOME/.config/polybar/config' 
alias polyscr='nvim $HOME/.config/polybar/scripts' 
 
# sxhkd config
alias kbinds='nvim $HOME/.config/sxhkd/sxhkdrc'

# kitty config
alias kittyrc='nvim $HOME/.config/kitty/colorscheme.conf'
#

# reloads zsh config
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

#
# -------------------- KEYBINDINGS --------------------
#

bindkey -v
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#
# -------------------- ADDITIONAL SOURCES --------------------
#
setxkbmap de

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'

	elif [[ ${KEYMAP} == main ]] ||
			 [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} = '' ]] ||
			 [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

#source $HOME/.oh-my-zsh/custom/plugins/zsh-directory-history/directory-history.plugin.zsh

# autosuggestions color
#autosuggestions_colorscheme_dir="$HOME/.oh-my-zsh/additional/plugins/auto-suggestions/auto-suggestions.colorscheme.conf"
#[ -f $autosuggestions_colorscheme_dir ] && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=`$autosuggestions_colorscheme_dir`

# if [ -d $HOME/.oh-my-zsh/additional ];
# then

#     # autosuggestions_colorscheme
#     autosuggestions_colorscheme=$HOME/.oh-my-zsh/additional/plugins/auto-suggestions/auto-suggestions.colorscheme.conf
#     [ -f $autosuggestions_colorscheme ] && source $autosuggestions_colorscheme

#     # prompt
#     prompt_config=$HOME/.oh-my-zsh/additional/prompt.conf
#     [ -f $prompt_config ] && source $prompt_config
# fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)";
