-- 插入模式下按 'jj' 退出插入模式
vim.keymap.set('i', 'jj', "<Esc>", { desc = "Exit insert mode" })

-- 映射 <C-s> 为保存文件
vim.keymap.set({ 'n', 'i' }, '<C-s>', function()
    vim.cmd('write') -- 保存文件
    if vim.fn.mode() == 'i' then
        return '<Esc>' -- 如果是插入模式，保存后返回普通模式
    end
end, { desc = "Save File", expr = true })

-- 窗口导航
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Go to Left Window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Go to Lower Window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Go to Upper Window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Go to Right Window" })
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = "Decrease Window Height" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Decrease Window Width" })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Increase Window Width" })

-- 缓冲区导航
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = "Prev Buffer" })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = "Prev Buffer" })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = "Next Buffer" })

-- 删除缓冲区
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Delete Buffer" })
vim.keymap.set('n', '<leader>bD', ':bdelete!<CR>', { desc = "Delete Buffer and Window" })

-- 退出并清除高亮搜索
vim.keymap.set({ 'i', 'n', 's' }, '<esc>', '<esc>:noh<CR>', { desc = "Escape and Clear hlsearch" })

-- 窗口操作
vim.keymap.set('n', '<leader>-', ':split<CR>', { desc = "Split Window Below" })
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = "Split Window Right" })
vim.keymap.set('n', '<leader>wd', ':q<CR>', { desc = "Delete Window" })

-- 终端操作
vim.keymap.set('n', '<leader>t', ':terminal<CR>a', { desc = "Open Terminal" })
--vim.keymap.set('t', '<leader>t', 'exit<CR>', { desc = "Close Terminal" })
