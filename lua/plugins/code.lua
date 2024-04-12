local list_snips = function()
    local ft_list = require("luasnip").available()[vim.o.filetype]
    local ft_snips = {}
    for _, item in pairs(ft_list) do
        ft_snips[item.trigger] = item.name
    end
    print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command("SnipList", list_snips, {})
return {
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
        -- enabled = false,
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = function()
            require("luasnip").filetype_extend("typescript", { "javascript" })
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
