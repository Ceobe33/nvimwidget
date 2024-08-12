-- local list_snips = function()
--     local ft_list = require("luasnip").available()[vim.o.filetype]
--     local ft_snips = {}
--     for _, item in pairs(ft_list) do
--         ft_snips[item.trigger] = item.name
--     end
--     print(vim.inspect(ft_snips))
-- end
--
-- vim.api.nvim_create_user_command("SnipList", list_snips, {})
return {
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
        opts = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = function(bufnr)
                        if require("conform").get_formatter_info("ruff_format", bufnr).available then
                            return { "ruff_format" }
                        else
                            return { "isort", "black" }
                        end
                    end,
                    -- Use a sub-list to run only the first available formatter
                    javascript = { { "prettierd", "prettier" } },
                    cpp = { "clang-format" },
                    tex = { "latexindent" },
                    ["*"] = { "codespell" },
                    ["_"] = { "trim_whitespace" },
                },
            })
        end,
    },
    {
        -- " post install (yarn install | npm install) then load plugin only for editing supported files
        -- Plug 'prettier/vim-prettier', {
        --   \ 'do': 'yarn install --frozen-lockfile --production',
        --   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
        "prettier/vim-prettier",
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
        keys = function()
            map("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { desc = "undotree toggle then focus" })
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
