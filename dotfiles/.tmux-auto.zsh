# Auto Install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Tmux Auto Start
if [ -z "$TMUX" ]; then
    # Check if the tmux session 'shell' exists
    if tmux has-session -t shell 2>/dev/null; then
        tmux attach -t shell
    else
        tmux new-session -s shell
    fi
fi
