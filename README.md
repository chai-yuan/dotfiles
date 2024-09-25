# My Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. These dotfiles are managed using a simple Bash script that allows for easy installation and uninstallation.

## Usage

### Install&Uninstall Dotfiles
```bash
# To install the dotfiles, run:
./manage_dotfiles.sh install
# To uninstall the dotfiles, run:
./manage_dotfiles.sh uninstall
# To display the help message, run:
./manage_dotfiles.sh help
```

### Adding New Dotfiles
To add new dotfiles to the repository, edit the manage_dotfiles.sh script and add new entries to the DOTFILES associative array. For example:
```bash
declare -A DOTFILES
DOTFILES=(
    ["nvim"]="$HOME_DIR/.config/nvim"
    ["nix"]="$HOME_DIR/.config/nix"
    # Adding New Dotfiles
)
```
Each entry should map a dotfile name (e.g., nvim) to its target location (e.g., $HOME_DIR/.config/nvim).

## License
This project is licensed under the MIT License. See the LICENSE file for details.

