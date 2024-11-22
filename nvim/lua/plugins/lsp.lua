return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        -- 一些快捷键配置
        -- 跳转定义和实现
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
        vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
            { desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>",
            { desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
        -- 工作区配置
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { desc = '[W]orkspace [L]ist Folders' })

        vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename ++project<cr>", { desc = '[R]e[n]ame' })
        vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", { desc = '[C]ode [A]ction' })
        vim.keymap.set('n', '<leader>da', "<cmd>lua require('telescope.builtin').diagnostics()<cr>",
            { desc = '[D]i[A]gnostics' })
        vim.keymap.set('n', "<leader>fm", function() vim.lsp.buf.format {} end, { desc = "[F]ormat code" })

        -- 各种语言服务器的配置
        lspconfig.clangd.setup {
            cmd = {
                "clangd",
                "--header-insertion=never"
            },
            capabilities = capabilities,
        }
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
        }
        lspconfig.nixd.setup {
            settings = {
                nixd = {
                    formatting = {
                        command = { "nixfmt" },
                    },
                },
            },
            capabilities = capabilities,
        }
    end
}
