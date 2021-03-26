#zmodload zsh/zprof
# For debugging zsh startup
# from - https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
# echo "Activating $HOME/.zshrc"

# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="/Users/bobrien/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes


#ZSH_THEME="agnoster-light"
ZSH_THEME="cobalt2"
# An attempt to fix garbled chars in Emacs shells (ansi-term, multi-term, etc)
if [ -n "$INSIDE_EMACS" ]; then
    export TERM=eterm-256color
    unset zle_bracketd_paste
fi
# End Emacs fix

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#bundler
colored-man-pages
colorize
git
gpg-agent
#nvm
osx
#pyenv
#python
#rake
#ruby
#rbenv
#zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
# From https://github.com/rothgar/mastering-zsh
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands
# End of rothgar
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
# This helped with pyenv install failing with expat not found
export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
export RUBY_HOME=/usr/local/opt/ruby/bin
# This was recommended for being able to access /usr/include files on Catalina
export CPATH=`xcrun --show-sdk-path`/usr/include
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PYENV_ROOT="$HOME/.pyenv"
# start pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
# end pyenv setup
# start rbenv setup
eval "$(rbenv init -)"
# end rbenv setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# Bottom part of debugging slow zsh startup (see top of this file as well)
# zprof
# for AWS console stuff - check ~/.aws for credentials
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
alias buau="brew update && brew upgrade"
# Find running Emacs process
alias pge="pgrep -fail emacs"
# Find running Emacs socket
alias ems="lsof -c Emacs | grep server | tr -s ' ' | cut -d' ' -f8"
# Find files opened with current Emacs process
alias emacsfo="lsof -Fn +p $(pgrep Emacs) | tail -n +2 | cut -c2-"
# Non-GCCEMACs aliases
alias emd="~/src/gnu-emacs/28/emacs/nextstep/Emacs.app/Contents/MacOS/Emacs --daemon=VANILLAEMACS"
alias  em="~/src/gnu-emacs/28/emacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient -s VANILLAEMACS -c -n -a ''"
alias emt="~/src/gnu-emacs/28/emacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient -s VANILLAEMACS -nw"
alias emq="~/src/gnu-emacs/28/emacs/nextstep/Emacs.app/Contents/MacOS/Emacs -Q"
# GCCEMACs aliases
alias gcemd="~/src/gnu-emacs/28/gccemacs/nextstep/Emacs.app/Contents/MacOS/Emacs --daemon=GCCEMACS"
alias  gcem="~/src/gnu-emacs/28/gccemacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient -s GCCEMACS -c -n -a ''"
alias gcemt="~/src/gnu-emacs/28/gccemacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient -s GCCEMACS -nw"
alias gcemq="~/src/gnu-emacs/28/gccemacs/nextstep/Emacs.app/Contents/MacOS/Emacs -Q"
# VIM aliases
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias cdp="cd /Users/bobrien/code/python"
alias cdg="cd /Users/bobrien/src/gnu-emacs/28/gccemacs"
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Add zprof to the end to profile zsh startup times.  
# Don't forget to add zmodload zsh/zprof to the top of .zshrc
#zprof
