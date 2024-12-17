return {
    -- 提供更好的搜索功能
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Telescope find files" },
        { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>",    desc = "Telescope buffers" },
        { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = "Telescope live grep" },
        { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>",  desc = "Telescope help tags" },
    },
}
