HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.config/zsh/history

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
setopt AUTO_CD

autoload -U compinit; compinit
_comp_options+=(globdots)
source $HOME/.config/zsh/completion.zsh

autoload -U colors; colors
PS1="%B%{$fg[red]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%~"$'\n'"%{$fg[blue]%}==>%{$reset_color%}%b "

source /home/alls/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/alls/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' autosuggest-accept

alias ls='eza --icons'
alias l='ls -l'
alias la='ls -la'
alias lt='ls --tree'
alias bat='batcat'
alias v='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 100%'
export FZF_CTRL_T_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'batcat -n --color=always {}' --bind 'ctrl-p:toggle-preview'"
export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git'
