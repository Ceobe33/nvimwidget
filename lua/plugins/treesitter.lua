return {
    "nvim-treesitter/nvim-treesitter",
    -- keys = { { "S", false } },
    opts = function(_, opts)
        -- add tsx and treesitter
        -- require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
        vim.list_extend(opts.ensure_installed, {
            "c",
            "cpp",
            "lua",
            -- "go",
            -- "python",
            -- "rust",
            -- "tsx",
            -- "typescript",
            -- "vimdoc",
            "vim",
        })
        opts.auto_install = true
        opts.run = ":TSInstallFromGrammer"
        -- opts.run = ":TSInstall"
        opts.prefer_git = false
    end,
    highlight = { enable = true },
}
