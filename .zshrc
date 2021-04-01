# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## My zshrc file:
# ========================

# To set zsh as default shell type: chsh -s $(which zsh)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nachoaz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(git
         zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###
# ALIAS
###
# Navigation
alias l='lsd -l'
alias ll='lsd -la'
alias la='ls -A'
alias dd='dd status=progress'

# Programs and shortcuts
alias r='ranger'
alias n='nautilus .'
alias code='codium'
alias ccat='batcat'

# Shortcuts
alias ipconfig='ip -c --brief addr show'
alias untar='tar -xvf'
alias forecast='curl -X GET wttr.in 2>/dev/null' # solo hoy --> | tail -n 50 | head -n 17 | tail -n 10'
alias whereisthepi='nmap -sn 192.168.0.1-254'

# Git
alias gg='lazygit'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gco='git checkout'

# Editor
alias ty='typora'
alias tyr='typora README.md'
alias vim='nvim'
alias jn='jupyter-notebook'
alias jl='jupyter lab'

# Docker
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}"'
alias dim='docker images'
alias dex='docker exec -it'
alias dc='docker-compose'

# Tiling window experiments
alias sortcut='vim ~/.config/sxhkd/sxhkdrc'
alias bspwmrc='vim ~/.config/bspwm/bspwmrc'

# FZF enable
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="/home/nachoaz/.local/bin:$PATH"

# Avoid share the terminal history between terminals
unsetopt share_history

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ROS + Gazebo
source /opt/ros/noetic/setup.zsh
export GAZEBO_MODEL_PATH=/home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/catkin_ws/../../assets/models
export GAZEBO_MODEL_PATH=:/home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/../assets/models
export GYM_GAZEBO_WORLD_CIRCUIT_F1=/home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/../assets/worlds/f1_1_simplecircuit.world
export /home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/catkin_ws/devel/setup.bash
export GYM_GAZEBO_WORLD_CIRCUIT_F1=/home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/CustomRobots/f1/worlds/simple_circuit.world

#
#
#########
#
#
#
# source /home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/catkin_ws/devel/setup.bash
# export GAZEBO_MODEL_PATH=/home/nachoaz/igarag/jderobot/gym-gazebo-2/gym_gazebo/envs/installation/catkin_ws/../../CustomRobots/f1/models

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


