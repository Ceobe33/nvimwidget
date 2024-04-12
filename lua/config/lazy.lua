local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

---user keymap api
---@param mode string "n" "v" "i"
---@param lhs any
---@param rhs any
---@param opts any
---@param isApi any
function map(mode, lhs, rhs, opts, isApi)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        local info = debug.getinfo(2, "S")
        opts.desc = (opts.desc or "") .. " --=>" .. info.source:match("[^/\\]+$")
        if isApi then
            vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
        else
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end
end

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        {
            -- practice vim operate
            "ThePrimeagen/vim-be-good",

            "tyru/open-browser.vim",
            "fladson/vim-kitty",
        },
        -- import/override with your plugins
        { import = "plugins" },
        { import = "plugins.snippets" },
        { import = "plugins.ui" },
        { import = "lazyvim.plugins.extras.ui.alpha" },
        -- disabled plugins
        { "lervag/vimtex", enabled = false },
        { "nvim-neo-tree/neo-tree.nvim", enabled = false },
        { "nvim-tree/nvim-tree.lua", enabled = false },
        -- { "neoclide/coc.nvim", enabled = false },
        -- { "pechorin/any-jump.vim", enabled = false },
        -- { "rafamadriz/friendly-snippets", enabled = false },
        -- { "nvim-treesitter/nvim-treesitter", enabled = false },
        -- { "williamboman/mason.nvim",         enabled = false },
        -- { "stevearc/dressing.nvim",          enabled = false },
        -- { "folke/noice.nvim", enabled = false },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    ui = {
        border = "rounded",
    },
    -- install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
