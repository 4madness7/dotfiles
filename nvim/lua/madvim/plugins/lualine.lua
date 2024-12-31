local p = require("rose-pine.palette")
local custom_rose_pine = {
    normal = {
        a = { bg = p.rose, fg = p.base, gui = "bold" },
        b = { bg = nil, fg = p.rose },
        c = { bg = nil, fg = p.text },
    },
    insert = {
        a = { bg = p.foam, fg = p.base, gui = "bold" },
        b = { bg = nil, fg = p.foam },
        c = { bg = nil, fg = p.text },
    },
    visual = {
        a = { bg = p.iris, fg = p.base, gui = "bold" },
        b = { bg = nil, fg = p.iris },
        c = { bg = nil, fg = p.text },
    },
    replace = {
        a = { bg = p.pine, fg = p.base, gui = "bold" },
        b = { bg = nil, fg = p.pine },
        c = { bg = nil, fg = p.text },
    },
    command = {
        a = { bg = p.love, fg = p.base, gui = "bold" },
        b = { bg = nil, fg = p.love },
        c = { bg = nil, fg = p.text },
    },
    inactive = {
        a = { bg = nil, fg = p.muted, gui = "bold" },
        b = { bg = nil, fg = p.muted },
        c = { bg = nil, fg = p.muted },
    },
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
        require('lualine').setup({ options = { theme = custom_rose_pine } })
    end
}
