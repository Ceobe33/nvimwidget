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
        enabled = true,
        branch = "release",
        config = function()
            -- map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
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
    { -- vimspector
        -- debug adapter
        "puremourning/vimspector",
        -- diable
        enabled = false,

        -- adapter requirement
        -- keys = { "<leader>di", "<Plug>VimspectorBalloonEval", desc = "[d]ebug [i]nspect" },
        -- { "<leader>di", "<Plug>VimspectorBalloonEval", { desc = "[d]ebug [i]nspect" }},
    },
    { -- lsp-zero.nvim
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        enabled = false,
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
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            -- { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            -- { "rafamadriz/friendly-snippets" }, -- Optional
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.preset({
                name = "minimal",
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })
            lsp.ensure_installed({
                "tsserver",
                --'sumneko_lua',
                "eslint",
                "rust_analyzer",
            })

            -- (Optional) Configure lua language server for neovim
            lsp.nvim_workspace()

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })

            lsp.set_preferences({
                sign_icons = {},
            })

            lsp.setup_nvim_cmp({
                mapping = cmp_mappings,
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                -- Map("n", "gd", function() vim.lsp.buf.definition() end, opts)
                map("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                map("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                map("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                map("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)
                map("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)
                map("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                map("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                map("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end)

            lsp.setup()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")

            cmp.setup({

                -- ... Your other configuration ...

                mapping = {

                    -- ... Your other mappings ...
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- ... Your other mappings ...
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                -- ... Your other configuration ...
            })
        end,
    },
}
