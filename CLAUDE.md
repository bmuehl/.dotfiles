# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Architecture

This is a personal dotfiles repository managed with GNU Stow for symlink management. The structure follows Stow's conventions where each top-level directory represents a "package" containing configuration files in their expected directory structure.

Key directories:
- `fish/` - Fish shell configuration and functions
- `nvim/` - Neovim configuration with Lua-based setup using lazy.nvim
- `tmux/` - Tmux terminal multiplexer configuration  
- `homebrew/` - Homebrew package management with Brewfile
- `kitty/`, `wezterm/`, `ghostty/` - Terminal emulator configurations
- `lazygit/` - Git TUI configuration
- `k9s/` - Kubernetes CLI configuration
- `btop/` - System monitor configuration

## Common Commands

### Package Management
```bash
# Install/update Homebrew packages
brew bundle --file=homebrew/Brewfile

# Install packages with Homebrew bundle
cd homebrew && brew bundle
```

### Stow Management
```bash
# Install dotfiles (symlink to home directory)
stow <package-name>  # e.g., stow nvim, stow fish

# Remove dotfiles
stow -D <package-name>

# Restow (useful after updates)
stow -R <package-name>
```

### Neovim Configuration
The Neovim setup uses lazy.nvim as the plugin manager with configurations split across:
- `nvim/.config/nvim/lua/core/` - Core options and keymaps
- `nvim/.config/nvim/lua/plugins/` - Individual plugin configurations
- `nvim/.config/nvim/lazy-lock.json` - Plugin version lock file

### Fish Shell
Configuration includes:
- Vi key bindings with `jk` to escape insert mode
- kubectl completion
- Custom path additions for Homebrew, Go, and pnpm
- Increased ulimit for file handles

## Development Workflow

When making changes to configurations:
1. Edit files in their respective package directories
2. Use `stow -R <package>` to update symlinks if needed
3. Restart or reload the affected application
4. For Neovim plugins, use `:Lazy` commands within Neovim

## File Management

The repository uses `.stow-local-ignore` to exclude certain files from stowing, including:
- Version control files (.git, .svn, etc.)
- Backup files and lock files
- README and LICENSE files