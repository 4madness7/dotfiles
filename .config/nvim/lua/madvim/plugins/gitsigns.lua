return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        local gitsigns = require('gitsigns')
        gitsigns.setup()

        vim.keymap.set("n", "<leader>hp" ,gitsigns.preview_hunk)
        vim.keymap.set("n", "<leader>hs" ,gitsigns.stage_hunk)
        vim.keymap.set("n", "<leader>hu" ,gitsigns.undo_stage_hunk)
        vim.keymap.set("n", "<leader>hr" ,gitsigns.reset_hunk)
    end
}
