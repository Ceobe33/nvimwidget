-- about latex plugin
return {
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end,
        keys = function()
            -- map("n", "\\lv", function()
            --     local line = vim.api.nvim_win_get_cursor(0)[1]
            --     local input = vim.api.nvim_get_current_line()
            --     local cmd = string.format(
            --         '/usr/local/bin/zathura -x \'nvim --cmd "call v:lua.SyncTeX(%d, "%s")"\' --synctex-forward 1:1:minimal.tex minimal.pdf >/dev/null 2>&1 &',
            --         line,
            --         input
            --     )
            --     vim.cmd(cmd)
            --     vim.cmd("redraw!")
            -- end, { desc = "undotree toggle then focus", silent = true })
        end,
    },
    --[[
      - vimtex
        - compile files currently
        - transparent, let file compile result show in the background
      - knap(but only fluently use on linux/mac)
        - real-time compile
      - luasnip
        - powerful snip plugin

    --]]
    --
    {
        "preservim/vim-markdown",
        requires = {
            { "godlygeek/tabular" },
        },
    },
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
--[[
  - markdown
    - support KeTex
  - code
    - code runner
    - dap
      -  can debugging
--]]
