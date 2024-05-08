# abbreviations
abbr -a gc --position anywhere --set-cursor 'git commit -m "%"'
abbr -a ga --position anywhere "git add -A"
abbr -a gp --position anywhere "git push"
abbr -a lg --position anywhere "lazygit"

# kubectl
kubectl completion fish | source

if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_vi_key_bindings
end
 
# golang
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

set -gx PHP_CS_FIXER_IGNORE_ENV true # delete after php-cs-fixer update

ulimit -n 100000 # increase max open files
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/python/libexec/bin
