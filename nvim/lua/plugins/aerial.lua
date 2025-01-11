return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
    keys = {
        { '<leader>n', "<cmd>AerialToggle!<CR>", desc = "Open or close the aerial window" },
    },
}
