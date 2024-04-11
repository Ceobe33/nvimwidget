return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = function(_, opts)
        table.insert(opts.ensure_installed, "prettier")
        if opts.ui == nil then
            opts.ui = {}
        end
        opts.ui.border = "rounded"
    end,
}
