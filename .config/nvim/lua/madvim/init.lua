require("madvim.set")
require("madvim.remap")
require("madvim.lazy")

local augroup = vim.api.nvim_create_augroup
local MadvimGroup = augroup('Madvim', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

-- vim.filetype.add({
--     extension = {
--         templ = 'templ',
--     }
-- })

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = MadvimGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = MadvimGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        local sev_error = vim.diagnostic.severity.ERROR
        local sev_warn = vim.diagnostic.severity.WARN
        local sev_info = vim.diagnostic.severity.INFO
        local sev_hint = vim.diagnostic.severity.HINT

        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = sev_error }) end, opts)
        vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = sev_error }) end, opts)
        vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = sev_warn }) end, opts)
        vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = sev_warn }) end, opts)
        vim.keymap.set("n", "[h", function() vim.diagnostic.goto_prev({ severity = sev_hint }) end, opts)
        vim.keymap.set("n", "]h", function() vim.diagnostic.goto_next({ severity = sev_hint }) end, opts)
        vim.keymap.set("n", "[i", function() vim.diagnostic.goto_prev({ severity = sev_info }) end, opts)
        vim.keymap.set("n", "]i", function() vim.diagnostic.goto_next({ severity = sev_info }) end, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})
