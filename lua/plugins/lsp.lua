return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    -- keys = { { "S", false } },
    lazy = false,
    commit = "v0.9.2",
    build = ':TSUpdate',
    -- auto_install = false,
    -- ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "python", "latex", "markdown" },
    highlight = { enable = true },
    config = function()
      require('nvim-treesitter').install({ "c", "lua", "vim", "vimdoc", "javascript", "html", "python", "latex", "markdown" }) --:wait(3000)
      -- vim.treesitter.start()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    config = function()
      vim.lsp.config.lua_ls.setup()
    end,
  },
  {
    "pechorin/any-jump.vim",
  },
  {
    "folke/neodev.nvim",
    enabled = false,
    --Please disable `neodev.nvim` in your config.
    --This is no longer needed when you use `lazydev.nvim`
    opts = {},
  },
  { -- coc
    "neoclide/coc.nvim",
    -- enabled = false,
    branch = "release",

    opts = function(_, opts)
      if opts.ui == nil then
        opts.ui = {}
      end
      opts.ui.border = "rounded"
    end,
    config = function()
      -- map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
      -- CocInstall coc-actions
      -- CocInstall coc-clangd
    end,
  },
  {
    "kevinoid/vim-jsonc",
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local linter = nls.builtins.diagnostics
      return {
        sources = {
          formatting.prettier.with({
            extra_args = {
              -- "--double-quote",
              "--single-quote",
            },
          }),
        },
      }
    end,
  },
  {
	  "folke/lazydev.nvim",
	  enabled = false,
	  optional = true,
	  -- Same as `dependencies` but does not force the plugin to load
		  specs = {
			  { "saghen/blink.cmp", opts = { sources = { default = { "lazydev" } } } },
		  },
  },
}
