return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'L3MON4D3/LuaSnip',

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = 'luasnip' },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        completion = {
            accept = {
                auto_brackets = { enabled = false },
            },
            documentation = {
                -- Controls whether the documentation window will automatically show when selecting a completion item
                auto_show = true,
            },
            menu = {
                -- nvim-cmp style menu
                draw = {
                    columns = {
                        { "label",     gap = 1 },
                        { "kind_icon", gap = 1, "kind" }
                    },
                }
            },
        },

        signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
}
