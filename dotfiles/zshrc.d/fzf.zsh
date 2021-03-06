# Uses fd as default command showing also hidden files
FZF_DEFAULT_COMMAND="fd --hidden"

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--height ${FZF_TMUX_HEIGHT:-60%} --preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa --tree --level 2 --long --header --git --color=always {}
else
    tput setaf 1; echo Something went wrong!
fi'"

# Use `exa` to preview directories when using Alt+c.
FZF_ALT_C_OPTS="--height ${FZF_TMUX_HEIGHT:-60%} --preview 'exa --tree --level 2 --long --header --git --color=always {} | head -200'"

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 60% "$@" --border
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always --stat | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}

bind-git-helper f b t r h
unset -f bind-git-helper

# Tmux switching with fzf
# Use FZF to switch Tmux sessions:
# bind-key s run "tmux new-window 'zsh -ci tmux-fzf-switch'"
tmux-fzf-switch() {
    local -r fmt='#{session_id}:|#S|(#{session_attached} attached)'
    { tmux display-message -p -F "$fmt" && tmux list-sessions -F "$fmt"; } \
        | awk '!seen[$1]++' \
        | column -t -s'|' \
        | fzf -q '$' --reverse --prompt 'switch session: ' -1 \
        | cut -d':' -f1 \
        | xargs tmux switch-client -t
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.fzf/shell/key-bindings.zsh
