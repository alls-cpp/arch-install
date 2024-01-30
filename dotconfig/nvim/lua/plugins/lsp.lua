return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
        end,
    },
}
