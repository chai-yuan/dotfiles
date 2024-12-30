#!/bin/bash

HOME_DIR="$HOME"
CURRENT_DIR=$(pwd)

declare -A DOTFILES
DOTFILES=(
    ["nvim"]="$HOME_DIR/.config/nvim"
    ["nix"]="$HOME_DIR/.config/nix"
    ["fontconfig"]="$HOME_DIR/.config/fontconfig"
    ["gdb"]="$HOME_DIR/.config/gdb"

    ["clang-format"]="$HOME_DIR/.clang-format"
    ["gitconfig"]="$HOME_DIR/.gitconfig"
    # 你可以在这里添加更多的 dotfiles
)

# 定义颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 显示帮助信息
help() {
    echo "Usage: $0 {install|uninstall|help}"
    echo ""
    echo "Commands:"
    echo "  install    - Create symbolic links for all dotfiles."
    echo "  uninstall  - Remove symbolic links for all dotfiles."
    echo "  help       - Display this help message."
}

# 安装 dotfiles
install() {
    for dotfile in "${!DOTFILES[@]}"; do
        src="$CURRENT_DIR/$dotfile"
        dest="${DOTFILES[$dotfile]}"

        if [ -e "$dest" ]; then
            echo -e "${YELLOW}Warning: $dest already exists. Skipping.${NC}"
        else
            echo -e "${GREEN}Creating symlink for $dotfile...${NC}"
            ln -s "$src" "$dest"
        fi
    done
}

# 卸载 dotfiles
uninstall() {
    for dotfile in "${!DOTFILES[@]}"; do
        dest="${DOTFILES[$dotfile]}"

        if [ -L "$dest" ]; then
            echo -e "${GREEN}Removing symlink for $dotfile...${NC}"
            rm "$dest"
        else
            echo -e "${YELLOW}Warning: $dest is not a symlink. Skipping.${NC}"
        fi
    done
}

# 根据传入的参数调用相应的函数
case "$1" in
    install)
        install
        ;;
    uninstall)
        uninstall
        ;;
    help)
        help
        ;;
    *)
        echo -e "${YELLOW}Invalid command. Use 'help' for usage information.${NC}"
        exit 1
        ;;
esac
