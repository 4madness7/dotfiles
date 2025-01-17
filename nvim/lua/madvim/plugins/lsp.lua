return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
                },
            },
        },
    },

    lazy = false,

    config = function()
        -- getting lsp capabilities
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- setting up plugins
        require("fidget").setup({}) -- for notifications

        require("mason").setup()    -- to install lsps
        require("mason-lspconfig").setup({
            automatic_installation = false,
            ensure_installed = {
                "gopls",
                "lua_ls",
                "nil_ls",
                "ts_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
            }
        })

        -- Setting diagnostic icons
        local signs = {
            { name = 'DiagnosticSignError', text = '✘' },
            { name = 'DiagnosticSignWarn', text = '▲' },
            { name = 'DiagnosticSignHint', text = '⚑' },
            { name = 'DiagnosticSignInfo', text = '»' },
        }

        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
        end

        vim.diagnostic.config({
            -- update_in_insert = true,
            signs = {
                active = signs
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end
}
