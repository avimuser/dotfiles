function tmuxinator
    set -l selected (find $HOME/Projects/ -depth -maxdepth 1 -type d | fzf)
    if test -n "$selected"
        if not tmux has-session -t $selected
            tmux new-session -dc $selected -s $selected
        end
        if test -n "$TMUX"
            tmux -u switch-client -t $selected
        else
            tmux -u a -t $selected
        end
    end
end
