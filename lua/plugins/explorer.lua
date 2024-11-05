return {
    {
        "preservim/nerdtree",
        config = function()
            local opts = { buffer = bufnr, remap = false }
            opts.desc = "Focus on Nerdtree"
            Map("n", "<leader>n", ":NERDTreeFocus<CR>", opts)
            opts.desc = "Toggle Nerdtree"
            Map("n", "<leader>N", ":NERDTreeToggle<CR>", opts)
            opts.desc = "Find current find in Nerdtree explor"
            Map("n", "<leader>nf", ":NERDTreeFind<CR>", opts)
        end,
    },
}
