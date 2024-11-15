return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = { 'clangd', 'lua_ls' }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                -- on_attach = my_custom_on_attach,
                capabilities = capabilities,
            }
        end
    end
}
