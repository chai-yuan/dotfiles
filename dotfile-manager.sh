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
    echo "  install    - 创建所有 dotfiles 的符号链接并配置 .bashrc"
    echo "  uninstall  - 移除所有 dotfiles 的符号链接"
    echo "  help       - 显示帮助信息"
}

# 安装 dotfiles
install() {
    # 创建符号链接
    for dotfile in "${!DOTFILES[@]}"; do
        src="$CURRENT_DIR/$dotfile"
        dest="${DOTFILES[$dotfile]}"

        if [ -e "$dest" ]; then
            echo -e "${YELLOW}警告: $dest 已存在，跳过。${NC}"
        else
            echo -e "${GREEN}为 $dotfile 创建符号链接...${NC}"
            ln -s "$src" "$dest"
        fi
    done

    # 配置 .bashrc
    BASH_SOURCE_FILE="bash_config"  # 当前目录下的配置文件名称
    SOURCE_LINE="source \"$CURRENT_DIR/$BASH_SOURCE_FILE\""
    BASH_RC="$HOME_DIR/.bashrc"
    # 确保 .bashrc 存在
    if [ ! -f "$BASH_RC" ]; then
        echo -e "${YELLOW}.bashrc 不存在，创建中...${NC}"
        touch "$BASH_RC"
    fi
    # 检查并添加 source 命令
    if grep -Fqx "$SOURCE_LINE" "$BASH_RC"; then
        echo -e "${YELLOW}.bashrc 中已存在配置行，跳过。${NC}"
    else
        echo -e "${GREEN}向 .bashrc 添加配置行...${NC}"
        echo "$SOURCE_LINE" >> "$BASH_RC"
        echo -e "${GREEN}建议重新加载配置: source ~/.bashrc${NC}"
    fi
}

# 卸载 dotfiles
uninstall() {
    for dotfile in "${!DOTFILES[@]}"; do
        dest="${DOTFILES[$dotfile]}"

        if [ -L "$dest" ]; then
            echo -e "${GREEN}移除 $dotfile 的符号链接...${NC}"
            rm "$dest"
        else
            echo -e "${YELLOW}警告: $dest 不是符号链接，跳过。${NC}"
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
        echo -e "${YELLOW}无效命令，使用 'help' 查看帮助信息。${NC}"
        exit 1
        ;;
esac
