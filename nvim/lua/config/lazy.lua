-- lazyvim 储存路径
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 检查 lazy.nvim 是否已经安装
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- 如果未安装，则从 GitHub 克隆 lazy.nvim
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- 如果克隆失败，显示错误信息并退出
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- 将 lazy.nvim 添加到运行时路径
vim.opt.rtp:prepend(lazypath)

-- 确保在加载 lazy.nvim 之前设置 `mapleader` 和 `maplocalleader`
-- 以便映射正确。这也是设置其他选项（vim.opt）的好地方
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 设置 lazy.nvim
require("lazy").setup({
  spec = {
    -- 导入插件文件夹
    { import = "plugins" },
  },
  -- 在这里配置其他设置。查看文档获取更多详细信息。
  -- 安装插件时使用的配色方案。
  install = { colorscheme = { "habamax" } },
  -- 关闭自动检查插件更新
  checker = { enabled = false },
})
