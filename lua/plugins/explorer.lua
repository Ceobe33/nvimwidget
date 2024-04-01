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
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        enabled = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
        config = function()
            -- require("nvim-tree").setup {}
            -- vim.keymap.set("n", "<C-n>", ":NvimTreeOpen<CR>")
        end,
        keys = {
            { "<C-n>", ":NvimTreeToggle<CR>", desc = "Open or close the tree" },
            { "<leader>nn", ":NvimTreeFocus<CR>", desc = "Open tree if it's closed, and then focus on the tree" },
            {
                "<leader>nf",
                ":NvimTreeFindFile<CR>",
                desc = "Move the cursor in the tree for the cur buffer, opening folders if needed",
            },
        },
    },
}
