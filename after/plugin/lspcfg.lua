-- TODO:want ot fix 'undefined diagnostics 'vim' but didn't work below'
--[[
local lspconfig = require("lspconfig")

vim.lsp.start({
    name = "lua-language-server",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".vim", "nvim" }, { upward = true })[1]),
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                },
            },
        },
    },
})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
print("here is lspcfg")
]]
