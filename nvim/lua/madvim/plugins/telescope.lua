return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    ".git/.*",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    hidden = true,
                },
            }
        });

        telescope.load_extension('fzf');

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

        vim.keymap.set('n', '<leader>pgs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("v", "<leader>ss", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)

            local start_sel = vim.fn.getpos("'<");
            local end_sel = vim.fn.getpos("'>");
            local start_line = start_sel[2];
            local end_line = end_sel[2];
            local start_col = start_sel[3];
            local end_col = end_sel[3];

            if start_line == end_line then
                local line = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)[1]

                builtin.grep_string({ search = string.sub(line, start_col, end_col) })
            else
                print("Multiline search not available.")
            end
        end)

        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}
