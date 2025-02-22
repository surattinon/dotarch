

# Tmux Auto Start
if [ ! "${termemu}" = "login" ]; then
    # Auto Install TPM
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi

if [ -z "$TMUX" ]; then
    # Check if the console is "login" (kmscon)
    if [ "${termemu}" = "fbterm" ]; then
        session_name="fb-shell"
    else
        session_name="shell"
    fi

    # Check if the session already exists
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        # Create a new session if it doesn't exist
        tmux new-session -s "$session_name"
    else
        # Attach to the existing session
        tmux attach -t "$session_name"
    fi
fi
fi
