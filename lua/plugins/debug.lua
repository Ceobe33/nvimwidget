local function getUserUI()
    return {
        controls = {
            element = "repl",
            enabled = true,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "󰜉",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "single",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = "",
        },
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25,
                    },
                    {
                        id = "breakpoints",
                        size = 0.25,
                    },
                    {
                        id = "stacks",
                        size = 0.25,
                    },
                    {
                        id = "watches",
                        size = 0.25,
                    },
                },
                position = "left",
                size = 40,
            },
            {
                elements = {
                    {
                        id = "repl",
                        size = 0.5,
                    },
                    {
                        id = "console",
                        size = 0.5,
                    },
                },
                position = "bottom",
                size = 10,
            },
        },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t",
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    }
end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            -- show parameter value in code scope
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup(getUserUI())
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
            -- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })

            require("nvim-dap-virtual-text").setup({
                -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
                -- display_callback = function(variable)
                --     local name = string.lower(variable.name)
                --     local value = string.lower(variable.value)
                --     if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
                --         return "*****"
                --     end
                --
                --     if #variable.value > 15 then
                --         return " " .. string.sub(variable.value, 1, 15) .. "... "
                --     end
                --
                --     return " " .. variable.value
                -- end,
            })

            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = "/home/aaron/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                },
                {
                    name = "Attach to gdbserver :1234",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "gdb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/gdb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                },
            }
            dap.configurations.c = dap.configurations.cpp

            Map("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
            Map("n", "<leader>dr", dap.run_to_cursor, { desc = "run to cursor" })

            -- Eval var under cursor
            Map("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            Map("n", "<F5>", dap.continue)
            Map("n", "<F11>", dap.step_into)
            Map("n", "<F10>", dap.step_over)
            Map("n", "<F8>", dap.step_out)
            Map("n", "<F9>", dap.step_back)
            Map("n", "S-<F5>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
