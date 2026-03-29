return {
    {
        "jiangmiao/auto-pairs",
        enabled = false,
    },
    {
        "Valloric/YouCompleteMe",
        enabled = false,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        enabled = false,
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- Exploring source file structure with vista.vim
    {
        "liuchengxu/vista.vim",
        -- enabled = false,
        config = function()
            Map("n", "<leader>cv", ":Vista!!<CR>", { desc = "toggle vista outlines" })
            -- Map("n", "<leader>cv", "set rnu<bar> Vista!!<CR>", { desc = "toggle vista outlines" })
            -- Map("n", "<leader>cv", function()
            --     vim.cmd("Vista!!")
            --     vim.cmd("set rnu")
            -- end, { desc = "toggle vista outlines" })
        end,
    },
    -- { "preservim/tagbar" },
    {
        "simrat39/symbols-outline.nvim",
        enabled = false,
        opts = function()
            require("symbols-outline").setup()
        end,
    },
    -- tag generate
    { "ludovicchabant/vim-gutentags" },

    -- snippets
    {
        "SirVer/ultisnips",
        -- enabled = false,

        config = function()
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<c-f>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<c-b>"
            vim.g.UltiSnipsEditSplit = "vertical"
            vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/after/plugin/snippets" }
        end,
    },
    {
        "saghen/blink.cmp",
        enabled = false,
        opts = {
            snippets = {
                expand = function(snippet, _)
                    return LazyVim.cmp.expand(snippet)
                end,
            },

            appearance = {
                -- sets the fallback highlight groups to nvim-cmp's highlight groups
                -- useful for when your theme doesn't support blink.cmp
                -- will be removed in a future release, assuming themes add support
                use_nvim_cmp_as_default = false,
                -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            completion = {
                accept = {
                    -- experimental auto-brackets support
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
                ghost_text = {
                    enabled = vim.g.ai_cmp,
                },
            },

            -- experimental signature help support
            -- signature = { enabled = true },

            sources = {
                -- adding any nvim-cmp sources here will enable them
                -- with blink.compat
                compat = {},
                default = { "lsp", "path", "snippets", "buffer" },
            },

            cmdline = {
                enabled = true,
                keymap = {
                    preset = "cmdline",
                    ["<Right>"] = false,
                    ["<Left>"] = false,
                },
                completion = {
                    list = { selection = { preselect = false } },
                    menu = {
                        auto_show = function(ctx)
                            return vim.fn.getcmdtype() == ":"
                        end,
                    },
                    ghost_text = { enabled = true },
                },
            },

            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_and_accept" },
            },
        },
    },
    { "honza/vim-snippets" },
    -- {
    --     "echasnovski/mini.comment",
    --     event = "VeryLazy",
    --     config = function ()
    --         map("n", "gcc", builtin.oldfiles, { desc = "[F]iles [R]ecent" })
    --     end,
    --     opts = {
    --         options = {
    --             custom_commentstring = function()
    --                 return require("ts_context_commentstring.internal").calculate_commentstring()
    --                     or vim.bo.commentstring
    --             end,
    --         },
    --     },
    -- },
    {
        "stevearc/conform.nvim",
        -- enabled = false,
        opts = function()
            -- require("lspconfig").lua_ls.setup({})
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- Use a sub-list to run only the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier" },
                    cpp = { "clang-format" },
                    tex = { "latexindent" },
                    ["*"] = { "codespell", "prettierd", "prettier" },
                    ["_"] = { "trim_whitespace" },
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        enabled = false,
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        -- dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            -- require("luasnip").filetype_extend("typescript", { "javascript" })
            -- require("luasnip.loaders.from_vscode").load({ path = { "./snippets/" } })
            -- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
            -- require("luasnip.loaders.from_vscode").load_standalone({
            --     path = { "~/.config/nvim/after/plugin/snippets/typescript.code-snippets" },
            -- })
            -- require("luasnip.loaders.from_vscode").lazy_load()
            -- require("luasnip.loaders.from_lua").load({ path = { "./snippets" } })
        end,
        -- config = function()
        --     require("luasnip").snippets({
        --         trig = "if",
        --         [[
        --         if ${1:condition} then
        --             $0
        --         end
        --         ]],
        --     })
        -- end,
    },
}
