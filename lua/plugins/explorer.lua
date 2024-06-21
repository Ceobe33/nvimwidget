return {
    {
        "preservim/nerdtree",
        config = function()
            local opts = { buffer = bufnr, remap = false }
            opts.desc = "Focus on Nerdtree"
            map("n", "<leader>n", ":NERDTreeFocus<CR>", opts)
            opts.desc = "Toggle Nerdtree"
            map("n", "<leader>N", ":NERDTreeToggle<CR>", opts)
            opts.desc = "Find current find in Nerdtree explor"
            map("n", "<leader>nf", ":NERDTreeFind<CR>", opts)
        end,
    },
}
