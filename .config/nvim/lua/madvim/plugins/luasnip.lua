return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",

    config = function()
        local luasnip = require('luasnip')
        local snippet = luasnip.snippet
        local text = luasnip.text_node

        luasnip.add_snippets("svelte", {
            snippet({ trig = 'component', desc = 'svelte component structure' }, {
                text({ '<script>', '</script>', '', '<style>', '</style>' }),
            })
        })
    end
}
