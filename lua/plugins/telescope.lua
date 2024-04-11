-- change some telescopemoptions and a keymap to browse plugin files
return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    { -- telescope
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files({
                        cwd = vim.fn.expand("%:p:h"),
                        file_ignore_patterns = { "node_modules" },
                    })
                end,
                desc = "[f]ind [f]iles (cwd)",
            },
            {
                "<leader>fF",
                function()
                    require("telescope.builtin").find_files({
                        file_ignore_patterns = { "node_modules" },
                    })
                end,
                desc = "[f]ind [F]iles (root)",
            },
            {"<leader>fg", false},
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
              "<leader>fp",
              function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
              desc = "Find Plugin File",
            },
        },
        config = function()
            local builtin = require("telescope.builtin")
            --- <C-d>,<C-u> scroll preview window down and up
            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            -- See `:help telescope.builtin`
            map("n", "<leader>fr", builtin.oldfiles, { desc = "Files Recent" })
            map("n", "<leader><space>", builtin.buffers, { desc = "Find existing buffers" })
            map("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            map("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
            map("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
            -- vim.keymap.set('n', '<leader>ps', function()
            --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
            -- end)

            -- map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            map("n", "<leader>sg", function()
                require("telescope.builtin").live_grep({
                    cwd = vim.fn.expand("%:p:h"),
                    file_ignore_patterns = { "node_modules" },
                })
            end, { desc = "[S]earch by [G]rep(plugins/telescope)" })
            map("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
            map("n", "<leader>pr", builtin.lsp_references, { desc = "Pameter References" })
        end,
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
                find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            },
        },
    },
    {
        -- amongst your other plugins
        "fladson/vim-kitty",
        ft = "kitty",
    },
}
