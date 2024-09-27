local opt = vim.opt

-- 剪贴板设置
-- 仅在非SSH环境下设置剪贴板，以确保OSC 52集成自动工作。需要Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- 界面设置
opt.cursorline = true -- 高亮当前行
opt.showmode = false -- 不显示模式，因为我们有状态栏
opt.termguicolors = true -- 启用终端真彩色

-- 编辑设置
opt.relativenumber = true -- 显示相对行号
opt.backspace = { "indent", "eol", "start" } -- 设置退格键行为
opt.tabstop = 4 -- 设置制表符宽度为4个空格
opt.shiftwidth = 4 -- 设置缩进宽度为4个空格
opt.expandtab = true -- 使用空格代替制表符
opt.shiftround = true -- 缩进时对齐到最接近的制表位
opt.autoindent = true -- 自动缩进
opt.smartindent = true -- 智能缩进
opt.completeopt = { "menuone", "noselect" } -- 设置补全选项
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 如果搜索包含大写字母，则区分大小写

-- 文件和缓冲区设置
opt.autowrite = true -- 自动保存
opt.confirm = true -- 退出修改过的缓冲区前确认保存
opt.autoread = true -- 自动重新加载外部修改的文件
opt.swapfile = false -- 不使用交换文件
opt.backup = false -- 不创建备份文件
opt.updatetime = 50 -- 设置更新时间间隔为50毫秒
opt.undofile = true -- 启用持久化撤销历史
opt.undodir = vim.fn.expand('/tmp/nvim/undo') -- 设置撤销文件目录
opt.splitright = true -- 新窗口在右侧打开