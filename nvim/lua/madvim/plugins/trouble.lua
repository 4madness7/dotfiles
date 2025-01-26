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
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tt", function()
            trouble.toggle("diagnostics")
        end)

        -- vim.keymap.set("n", "<leader>tw", function()
        --     trouble.toggle("workspace_diagnostics")
        -- end)
        --
        -- vim.keymap.set("n", "<leader>td", function()
        --     trouble.toggle("document_diagnostics")
        -- end)

        vim.keymap.set("n", "<C-n>", function()
            trouble.next({ skip_groups = true, jump = true });
        end)

        vim.keymap.set("n", "<C-p>", function()
            trouble.prev({ skip_groups = true, jump = true });
        end)
    end
}
