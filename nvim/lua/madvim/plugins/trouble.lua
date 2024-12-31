return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        height = 8,
        use_diagnostic_signs = true
    },
    config = function()
        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle()
        end)

        vim.keymap.set("n", "<leader>tw", function()
            require("trouble").toggle("workspace_diagnostics")
        end)

        vim.keymap.set("n", "<leader>td", function()
            require("trouble").toggle("document_diagnostics")
        end)

        vim.keymap.set("n", "<C-n>", function()
            require("trouble").next({ skip_groups = true, jump = true });
        end)

        vim.keymap.set("n", "<C-p>", function()
            require("trouble").previous({ skip_groups = true, jump = true });
        end)
    end
}
