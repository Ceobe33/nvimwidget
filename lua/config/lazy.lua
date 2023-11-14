local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                                    import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    {
      -- practice vim operate
      "ThePrimeagen/vim-be-good",

      "tyru/open-browser.vim",
      "fladson/vim-kitty",
    },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
    { import = "utils" },
    { import = "plugins.lsp" },
    -- { "zsh-syntax-highlighting" },
    -- disabled plugins
    { "lervag/vimtex",                   enabled = false },
    { "jose-elias-alvarez/null-ls.nvim", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim",     enabled = false },
    { "nvim-tree/nvim-tree.lua",         enabled = false },
    -- { "nvim-treesitter/nvim-treesitter", enabled = false },
    -- { "williamboman/mason.nvim",         enabled = false },
    -- { "stevearc/dressing.nvim",          enabled = false },
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