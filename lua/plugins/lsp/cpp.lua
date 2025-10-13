return {
    -- switch within cpp & h files
    {
        "derekwyatt/vim-fswitch",
        config = function()
            Map("n", "<leader>oh", ":FSSplitLeft<CR>", { desc = "open source/header on left" })
            Map("n", "<leader>ol", ":FSSplitRight<CR>", { desc = "open source/header on right" })
            Map("n", "<leader>ok", ":FSSplitAbove<CR>", { desc = "open source/header on above" })
            Map("n", "<leader>oj", ":FSSplitBelow<CR>", { desc = "open source/header on below" })
        end,
    },
    -- c++ syntax highlighting
    {
        "bfrg/vim-cpp-modern",

        -- cppman for cppreference document
        config = function()
            -- map("n", "K", function()
            --     local old_isk = vim.bo.iskeyword
            --     vim.bo.iskeyword = old_isk .. ",:"
            --     local str = vim.fn.expand("<cword>")
            --     vim.bo.iskeyword = old_isk
            --     -- os.execute("cppman " .. str)
            --     -- vim.cmd("cppman " .. str)
            --     -- vim.cmd("command! -nargs=0 Cppman" .. str)
            -- end)
        end,
    },
    {
        "Badhi/nvim-treesitter-cpp-tools",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        -- Optional: Configuration
        opts = function()
            Map("v", "<leader>cg", "<cmd>TSCppDefineClassFunc<CR>", { desc = "create class defination" })
            Map("v", "<leader>ci", "<cmd>TSCppMakeConcreteClass<CR>", { desc = "create child class" })
            -- The Rule of Three suggests that if you need to define any of a copy constructor, copy assignment operator or destructor then you would usually need to define “all three”
            ---@ rule 3 is used in c++11 and early, and 5 is newer
            Map("v", "<leader>c3", "<cmd>TSCppMakeConcreteClass<CR>", { desc = "add missing func obey rule 3" })
            Map("v", "<leader>c5", "<cmd>TSCppMakeConcreteClass<CR>", { desc = "add missing func obey rule 5" })
            local options = {
                preview = {
                    quit = "q", -- optional keymapping for quit preview
                    accept = "<tab>", -- optional keymapping for accept preview
                },
                header_extension = "h", -- optional
                source_extension = "cpp", -- optional
                custom_define_class_function_commands = { -- optional
                    TSCppImplWrite = {
                        output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
                    },
                    --[[
                <your impl function custom command name> = {
                    output_handle = function (str, context)
                        -- string contains the class implementation
                        -- do whatever you want to do with it
                    end
                }
                ]]
                },
            }
            return options
        end,
        -- End configuration
        config = true,
    },
}
