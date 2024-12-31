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

        luasnip.add_snippets("svelte", {
            snippet({ trig = 'component-ts', desc = 'svelte component structure' }, {
                text({ '<script lang="ts">', '</script>', '', '<style>', '</style>' }),
            })
        })

        local snip_js_fun = {
            snippet({ trig = 'function', desc = 'javascript function structure' }, {
                text({'function () {', '}'}),
            })
        }
        luasnip.add_snippets("javascript", snip_js_fun)
        luasnip.add_snippets("typescript", snip_js_fun)
        luasnip.add_snippets("svelte", snip_js_fun)

        local snip_js_arr_fun = {
            snippet({ trig = 'arrow-fun', desc = 'javascript arrow function structure' }, {
                text({'() => { }'}),
            })
        }
        luasnip.add_snippets("javascript", snip_js_arr_fun)
        luasnip.add_snippets("typescript", snip_js_arr_fun)
        luasnip.add_snippets("svelte", snip_js_arr_fun)
    end
}
