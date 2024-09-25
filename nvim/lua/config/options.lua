local opt = vim.opt

-- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.autowrite = true
opt.confirm = true -- Confirm to save changes before exiting modified buffer

-- Sync with system clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" 

opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.foldlevel = 99
opt.number = true -- Print line number
opt.showmode = false -- Dont show mode since we have a statusline
