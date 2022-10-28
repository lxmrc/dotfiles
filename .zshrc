# zsh
alias zc="vim -n ${HOME}/.zshrc"
alias sc="source ${HOME}/.zshrc"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
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
# alias zshconfig="mate ${HOME}/.zshrc"
# alias ohmyzsh="mate ${HOME}/.oh-my-zsh"

# add ${HOME}/bin to path
export PATH="$HOME/bin:$PATH"

# ls when I cd
# function cd {
#     builtin cd "$@" && ls -l
#     }

# ctrl + p = vim + FZF
bindkey -s '^p' 'vim -n $(fzf)^M'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" ' 

bindkey -s '^f' 'feh $(fzf)^M'

export EDITOR='vim'

# bundler
export BUNDLER_EDITOR="vim"

# docker
export PATH=/usr/bin:$PATH
# export DOCKER_HOST=unix:///run/user/1000/docker.sock

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# alias za="vim ${HOME}/.oh-my-zsh/custom/aliases.zsh" 
# alias sa="source ${HOME}/.oh-my-zsh/custom/aliases.zsh"

# ls
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

# tmux
alias tc="vim ${HOME}/.tmux.conf"
alias tn="tmux new"
alias tls="tmux ls"
alias ta="tmux attach"
alias st="tmux source ${HOME}/.tmux.conf"

# vim
alias v="vim -n "
alias vw="vim -nc 'Goyo | VimwikiIndex'"
alias vwd="vim -nc VimwikiDiaryIndex"
alias vc="vim -n ${HOME}/.vimrc" 
alias vg="vim -c 'Gedit :'" 
alias vs="vim -c 'Scratch'"

# git
alias gs="git status"
alias glo="git log --oneline"
alias glno="git log --name-only --oneline"
alias gd="git diff"
alias gds="git diff --staged"
alias gdh="git diff HEAD~1"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gca="git commit --amend"
alias gr="git rebase -i"
alias grc="git rebase --continue"
alias gb="git checkout"
alias gfc="git fetch-checkout"
alias gbn="git checkout -b"
alias gl="git log"
alias glp="git log -p"
alias gpa="git push && actions-cli"
alias gpf="git push --force"
alias gcm="git checkout master"
alias gcmp="git checkout master && git pull"
alias gfo="git fetch origin"
alias gsu="git stash -u"
alias gsp="git stash pop"
alias gf="git diff --name-only master"

# github
alias ghrv="gh run view"
alias ghrw="gh run watch"

# heroku
alias hbl="heroku logs --source app --dyno api --tail"

# ruby
alias r="ruby"
alias rt="ruby *_test.rb"

# bundle
alias bi="bundle install"
alias b="bundle exec"
alias brdm="bundle exec rails db:migrate"
alias brdr="bundle exec rails db:rollback"
alias br="bundle exec rspec"
alias biw="bundle config --local disable_platform_warnings true"
alias bjs="bundle exec jekyll serve --watch"
alias sdw="export RUBYOPT=-W1"
alias bgc="bundle exec guard -c"

# postgres
alias pg="sudo -u postgres psql"

# veracrypt 
# alias dc="veracrypt $HOME/crypt $HOME/private"
# alias ec="veracrypt -d $HOME/private"

# redshift
# alias rs="redshift -t 2900:2900 > /dev/null 2>/dev/null &"

# ghostwriter
# alias gw="ghostwriter > /dev/null 2>/dev/null &"

# rails
alias rrc="vim -n $HOME/.railsrc"
alias rc="rails console"
alias rcs="rails console --sandbox"
alias rdm="rails db:migrate"
alias rdr="rails db:rollback"

# docker
alias dsa="docker ps -q | xargs -r docker stop"
alias dps="docker ps"
alias wdps="watch docker ps"

# white noise generator
alias sn="sox-noise > /dev/null 2>/dev/null &"

# gogh
alias gogh="$HOME/Scripts/gogh.sh"

# disable autocorrect
unsetopt correct_all
unsetopt correct

# make tmux default shell
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# add ruby dir to $PATH
# export PATH="${HOME}/.local/share/gem/ruby/3.0.0/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# guake
# alias light="guake --change-palette 'Mar'"
# alias dark="guake --change-palette 'Nord'"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eagle
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcs="docker-compose stop"
alias dcu="docker-compose up -d && docker-compose logs -f --tail=100 web"
alias dcr="docker-compose restart"
alias drw="docker-compose restart web"
alias dcl="docker-compose logs -f --tail=100 "
alias dclw="docker-compose logs -f --tail=100 web"
alias dcl0="docker-compose logs -f --tail=0 "
alias dcl0w="docker-compose logs -f --tail=0 web"
alias dct="docker-compose exec web bundle exec rspec"
alias dcf="docker-compose exec web bundle exec rspec --fail-fast"
alias dcc="docker-compose exec web rails console"
alias dce="docker-compose exec"
alias dcew="docker-compose exec web"
alias dcp="docker attach eagle-dev-local_web_1"
alias dcpw="docker attach eagle-dev-local_workers_1"

# apt
alias ai="sudo apt install -y"
alias as="apt search"
alias au="sudo apt update"
alias aid="sudo apt -f install -y"

# dpkg
alias di="sudo dpkg -i "

# .clear
alias .clear=clear

# Copy last command
alias clc="fc -ln -1 | tr -d '\n' | xclip -sel c"

# Pipe to clipboard
alias x=" tr -d '\n' | xclip -sel c"

# Clear ~/.vim/view/
alias rmv="rm -rf ${HOME}/.vim/view/"

# Remove all .sw* files in directory
alias rsw="find . -type f -name '*.sw[klmnop]' -delete"

# nnn
alias n=nnn

# tmux-resurrect
alias trs="$HOME/bin/tmux-resurrect/scripts/save.sh"
alias trr="$HOME/bin/tmux-resurrect/scripts/restore.sh"

# alacritty
alias ac="vim -n ${HOME}/.alacritty.yml"
alias light="alacritty-themes Default.light; echo light > $HOME/.theme; tmux source-file \"${HOME}/code/tmux-powerline-light/green-light.tmuxtheme\""
alias dark="alacritty-themes Monokai.dark; echo dark > $HOME/.theme; tmux source-file \"${HOME}/code/tmux-powerline-light/green-dark.tmuxtheme\""
alias at="alacritty-themes"

# vim-anywhere
# export PATH="$HOME/.vim-anywhere/bin/run:$PATH"

# restart network-manager
alias rnm="sudo systemctl restart network-manager"

# kill gnome shell
alias kgs="sudo killall -3 gnome-shell"

# go
# export PATH=$PATH:/usr/local/go/bin

# sync dot files
alias sdf="git -C ${HOME}/code/dotfiles add . && git -C ${HOME}/code/dotfiles commit -m 'Update dotfiles' && git -C ${HOME}/code/dotfiles push"

export DENO_INSTALL="/home/alex/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

alias rgl="rg -l"

alias ggc="vim -n ${HOME}/.gitconfig"
alias ggi="vim -n ${HOME}/.gitignore"

alias wpr="gh pr list --state merged --search "
alias mpr="gh pr list --state merged"

function erb_lint()
{
  rbenv shell 3.1.1
  erblint -a $1
  rbenv shell $(rbenv local)
  return 0
}

alias el="erb_lint"

export THEME=$(cat $HOME/.theme)

if [ "$THEME" = "light" ]
then
  tmux source-file "${HOME}/code/tmux-powerline-light/green-light.tmuxtheme"
elif [ "$THEME" = "dark" ]
then
  tmux source-file "${HOME}/code/tmux-powerline-light/green-dark.tmuxtheme"
fi
