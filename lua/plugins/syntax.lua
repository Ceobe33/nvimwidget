return {
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = "LazyFile",
        config = function()
            Map("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })
            Map("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
            Map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Todo (Trouble)" })
            Map(
                "n",
                "<leader>xT",
                "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>",
                { desc = "Todo/Fix/Fixme (Trouble)" }
            )
            Map("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Todo" })
            Map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", { desc = "Todo/Fix/Fixme" })
        end,
    },
}
