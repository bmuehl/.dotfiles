# bobthefish - theme config
set -g theme_color_scheme nord
set -g theme_nerd_fonts yes
set -g theme_newline_cursor yes
set -g theme_display_git_default_branch yes
set -g fish_prompt_pwd_dir_length 3

# kubectl
kubectl completion fish | source

if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_vi_key_bindings
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx XDG_CONFIG_HOME "$HOME/.config"
