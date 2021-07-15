# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
# configure key keybindings
#bindkey -e                                        # emacs key bindings
#bindkey ' ' magic-space                           # do history expansion on space
#bindkey '^[[3;5~' kill-word                       # ctrl + Supr
#bindkey '^[[3~' delete-char                       # delete
#bindkey '^[[1;5C' forward-word                    # ctrl + ->
#bindkey '^[[1;5D' backward-word                   # ctrl + <-
#bindkey '^[[5~' beginning-of-buffer-or-history    # page up
#bindkey '^[[6~' end-of-buffer-or-history          # page down
#bindkey '^[[H' beginning-of-line                  # home
#bindkey '^[[F' end-of-line                        # end
#bindkey '^[[Z' undo                               # shift + tab undo last action
# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion
# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data
export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
#export GOPATH=/Users/lidi/go 
#export GOROOT=/usr/local/go
#export GOBIN=$GOROOT
#
HOMEBIN=/Users/lidi/bin 
MAVEN_HOME=/Users/lidi/software/apache-maven
PATH=$PATH:$MAVEN_HOME/bin:$GOROOT/bin:$GOPATH/bin:$HOMEBIN 	
export MAVEN_HOME
export PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/lidi/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="frisk"
#ZSH_THEME="random"
#ZSH_THEME="agnoster"

ZSH_THEME=powerlevel10k/powerlevel10k
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=##5C6370'
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#E5C07B'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999797'
#ZSH_THEME='random'
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE="nerdfont-complete"
## Customise the Powerlevel9k prompts
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
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
#plugins=(git)
plugins=(
  git
  zsh-autosuggestions
   autojump
)
source $ZSH/oh-my-zsh.sh
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
#export LANG=en_US.UTF-8
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
# alias ohmyzsh="mate ~/.oh-my-zsh"
#brew 自动更新
export HOMEBREW_NO_AUTO_UPDATE=true 
# ------------------------------------fzf ----------------------------------
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || bat {}) 2> /dev/null | head -500'"
export CLOUD_HOME="/Users/lidi/Library/Mobile Documents/com~apple~CloudDocs"
# --------------------------------------------------------------------------

JDK_8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home'
JDK_12_HOME='/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home'
alias JDK_9="export JAVA_HOME=$JDK_8_HOME;PATH='$PATH:$JAVA_HOME/bin';export PATH"
alias JDK_12="export JAVA_HOME=$JDK_12_HOME;PATH='$PATH:$JAVA_HOME/bin';export PATH"
alias reload='. ~/.zshrc'
GRADLE_HOME='/Users/lidi/software/gradle-6.8'
GRADLE_USER_HOME='/Users/lidi/.gradle'
export GRADLE_USER_HOME
export GRADLE_HOME
JAVA_HOME=$JDK_8_HOME
export JAVA_HOME
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export RUST_BACKTRACE=1
RUST_PATH="$HOME/.cargo/bin:$PATH"
FIRE_FOX_PATH="/Applications/Firefox.app/Contents/MacOS"
export PATH="/usr/local/opt/openssl@1.1/bin:$JAVA_HOME/bin:$RUST_PATH:$GRADLE_HOME/bin:$FIRE_FOX_PATH:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
#-----------------man ------------------------------
#export BAT_THEME='Coldark-Dark'
export BAT_THEME='OneDark'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#-----------------man ------------------------------
#export LANG=zh_CN.UTF-8  
#export PYTHON_HOST_PROG='/usr/local/bin/python2'
#export PYTHON3_HOST_PROG='/usr/local/bin/python3'
#---------------------------plug--------------------------------------
# alias ss_start='nohup sslocal -c ~/.config/shadowsocks/confg.json > /tmp/shadowsocks.log 2>&1 &'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#plugins Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#export PYENV_ROOT="$HOME/git/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/lidi/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then 
		. ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=underline
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold 
		ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi
#alias proxy='export http_proxy=http://127.0.0.1:1090;export https_proxy=http://127.0.0.1:1090;'
alias fvim='vim $(fzf)'
#alias proxy='export http_proxy=http://127.0.0.1:10887;export https_proxy=http://127.0.0.1:10887;'
#alias proxy='export http_proxy=http://127.0.0.1:10887;export https_proxy=http://127.0.0.1:10887;'

alias proxy='export http_proxy=http://127.0.0.1:4780;export https_proxy=http://127.0.0.1:4780;'
#alias proxy='export http_proxy=http://127.0.0.1:8080;export https_proxy=http://127.0.0.1:8080;'
alias unproxy='unset http_proxy;unset https_proxy;'
#export GOPROXY='https://127.0.0.1:1087'
alias sed='gsed'
alias reboot='~/bin/reboot.sh'
alias vim="/opt/nvim-osx64/bin/nvim"
alias pip3='/usr/bin/pip3'
#alias proxy='proxychains4'
# ----------------------------------------------tmux -----------------------------------------------
#alias t-snew='tmux new -s'
#alias t-wnew='tmux new -w'
#
#alias t-ks='tmux kill-session -t'
#alias t-kw='tmux kill-window -t'
#alias t-ls='tmux ls'
#alias t-at='tmux attach -t'
#alias t-sw='tmux switch -t'
#alias t-rename='tmux rename-session -t'
#alias t-lb='tmux list-buffers'
#alias t-sb='tmux show-buffer -b'
#alias t-cb='tmux choose-buffer'
#export GOPROXY=https://mirrors.aliyun.com/goproxy/
# -------------------------------------------git 0---------------------------------------
#
#.0alias proxy='/usr/local/bin/proxychains4'
#alias proxy='export all_proxy=socks5://127.0.0.1:1088'
alias unproxy='unset all_proxy'

alias git_checkout='git checkout $(git branch -r | fzf)'
#alias GOPROXY='go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/'
aria_conf='/Users/lidi/.aria2/aria2.conf'
alias aria2rpc='aria2c --conf-path=${aria_conf} -D'
#alias proxy='export all_proxy=socks5://127.0.0.1:1080'
#alias unproxy='unset all_proxy'
alias pip='/usr/local/bin/pip3.9'
alias ctags='/usr/local/bin/ctags'

alias tls='tmux ls'
alias tneww='tmux neww -n'
alias tnew='tmux new -t'
export DYLD_LIBRARY_PATH="/usr/local/Cellar/mysql/8.0.22_1/lib/libmysqlclient.21.dylib"
# rbenv config 
export PATH="$HOME/.rbenv/bin:$PATH"
export WORKON_HOME=~/Envs
export HISTTIMEFORMAT='%F %T'

export VISUAL=/usr/local/bin/vim

# xplr works best with aliases
alias x="xplr"
alias sys_ls='ls'

#alias ls='exa'
alias ls='lsd'

alias la='ls -a'
alias ll='ls -la'
alias lt='ls --tree'
alias sync='~/bin/sync.sh'
# Change directory
alias xcd='cd "$(xplr)"'

alias sys_cat='cat'
alias cat='bat'
alias tattach='tmux attach -t $(tmux ls | cut -d":" -f1 | fzf)'
if [ -f '/Users/lidi/.alias' ];then
	. ~/.alias
fi
#ENV_FILE=/Users/lidi/.env
#if [ -f "$ENV_FILE" ];then
#	while read ENV_LINE 
#	do
#		export "$ENV_LINE"
#	done < $ENV_FILE
#fi
#VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3



[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh


VAGRANT_HOME=/Volumes/LDZ/vm/vagrant
if [[ ! -d "$VAGRANT_HOME" ]];then
	VAGRANT_HOME=/Users/lidi/.vagrant.d
fi
export VAGRANT_HOME

eval "$(rbenv init -)"
#[ -f ~/.bin/init ] && . ~/.bin/init
