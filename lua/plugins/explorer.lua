return {
    {
        "preservim/nerdtree",
        config = function()
            local opts = { buffer = bufnr, remap = false }
            opts.desc = "Focus on Nerdtree"
            Map("n", "<leader><leader>n", ":NERDTreeFocus<CR>", opts)
            opts.desc = "Toggle Nerdtree"
            Map("n", "<leader>N", ":NERDTreeToggle<CR>", opts)
            opts.desc = "Find current find in Nerdtree explor"
            Map("n", "<leader>nf", ":NERDTreeFind<CR>", opts)
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
            Map(
                "n",
                "<leader><leader>u",
                ":UndotreeToggle<CR>:UndotreeFocus<CR>",
                { desc = "undotree toggle then focus" }
            )
        end,
    },
}
