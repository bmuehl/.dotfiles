# Fish shell configuration

# kubectl completion
kubectl completion fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint # switch to command mode with jk
end

# System configuration
ulimit -n 100000 # increase max open files

# Add paths 
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/python/libexec/bin
fish_add_path $GOPATH/bin
fish_add_path "$PNPM_HOME"
