return {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    opts = {
        -- config goes here
        theme = {
            name = "dark",
        },
    },
    config = function(_, opts)
        require("github-preview").setup(opts)
    end
}
