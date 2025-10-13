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

        opts = function(_, opts)
            if opts.ui == nil then
                opts.ui = {}
            end
            opts.ui.border = "rounded"
        end,
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
    {
        "folke/lazydev.nvim",
        optional = true,
        -- Same as `dependencies` but does not force the plugin to load
        specs = {
            { "saghen/blink.cmp", opts = { sources = { default = { "lazydev" } } } },
        },
        -- "saghen/blink.cmp",
        -- dependencies = { "folke/lazydev.nvim" },
        -- opts = {
        --     sources = {
        --         -- add lazydev to your completion providers
        --         default = { "lazydev" },
        --         providers = {
        --             lazydev = {
        --                 name = "LazyDev",
        --                 module = "lazydev.integrations.blink",
        --                 score_offset = 100, -- show at a higher priority than lsp
        --             },
        --         },
        --     },
        -- },
    },
}
