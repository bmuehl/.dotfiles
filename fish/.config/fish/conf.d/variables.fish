# Fish universal variables configuration

# Virtual environment configuration
set -gx VIRTUAL_ENV_DISABLE_PROMPT true

# Fish configuration
set -g fish_key_bindings fish_vi_key_bindings

# Environment variables
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

# Go configuration
set -gx GOPATH $HOME/go

# pnpm configuration
set -gx PNPM_HOME "$HOME/Library/pnpm"

# PHP configuration (temporary fix)
set -gx PHP_CS_FIXER_IGNORE_ENV true

# Tide prompt configuration
set -g _tide_left_items vi_mode os pwd git newline
set -g _tide_right_items status cmd_duration context jobs node python java ruby kubectl
