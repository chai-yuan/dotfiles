return {
    -- 提供更好的搜索功能
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Search files in the current directory" },
            { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Search for a string in the current directory using live grep" },
            { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Search Neovim help tags" },
            { '<leader>fp', "<cmd>lua require('telescope.builtin').builtin()<cr>", desc = "Search and run Telescope built-in functions" },
            { '<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>", desc = "Search and navigate through marks" },
            { '<leader>qf', "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Search and navigate through the quickfix list" },
            { '<leader>km', "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "Search and display Neovim keymaps" },
        },
    }
}
