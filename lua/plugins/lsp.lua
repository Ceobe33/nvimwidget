return {
    {
        "pechorin/any-jump.vim",
    },
    {
        "folke/neodev.nvim",
        --Please disable `neodev.nvim` in your config.
        --This is no longer needed when you use `lazydev.nvim`
        enabled = false,
        opts = {},
    },
    { -- coc
        "neoclide/coc.nvim",
        -- TODO: have clang syntax error
        -- enabled = false,
        branch = "release",
        config = function()
            -- map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
            -- CocInstall coc-actions
            -- CocInstall coc-clangd
        end,
    },
    {
        "kevinoid/vim-jsonc",
    },
    {
        "nvimtools/none-ls.nvim",
        enabled = false,
        opts = function()
            local nls = require("null-ls")
            local formatting = nls.builtins.formatting
            local linter = nls.builtins.diagnostics
            return {
                sources = {
                    formatting.prettier.with({
                        extra_args = {
                            -- "--double-quote",
                            "--single-quote",
                        },
                    }),
                },
            }
        end,
    },
    { -- lsp-zero.nvim
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        enabled = false,
        opts = function()
            require("lazy").setup({
                { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
                { "neovim/nvim-lspconfig" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/nvim-cmp" },
            })
        end,
        requires = {
            -- lsp support
            -- Automatically install LSPs to stdpath for neovim
            {
                -- LSP Configuration & Plugins
                "neovim/nvim-lspconfig",
                dependencies = {
                    -- Useful status updates for LSP
                    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                    { "j-hui/fidget.nvim", opts = {} },

                    -- Additional lua configuration, makes nvim stuff amazing!
                    "folke/neodev.nvim",
                },
            }, -- required
            { "williamboman/mason.nvim", config = true }, -- optional
            { "williamboman/mason-lspconfig.nvim" }, -- optional

            -- autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            -- { "hrsh7th/cmp-buffer" },   -- Optional
            -- { "hrsh7th/cmp-path" },     -- Optional
            -- { "saadparwaiz1/cmp_luasnip" }, -- Optional
            -- { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            -- { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },
}
