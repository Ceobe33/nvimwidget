if true then
  return
end
-- Leaving this empty will use the default options from the
 -- `nvim-lspconfig` plugin. See |:h vim.lsp.Config| for all
 -- available fields, and see below for more customization.
 local clangd_opts = {
   -- Add custom command-line flags:
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose', },
    cmd_env = {
        -- Instructs clangd to write its log to this file:
        CLANGD_TRACE = '$HOME/.config/nvim/clangd.log',
    },
    -- Customize clangd's behaviour:
    init_options = { fallbackFlags = { '-std=c++17' }, },
    -- Note: the init_options field in your clangd options table must contain key-value fields from the initialiazationOptions structure, as described in the “Compilation Commands” section in the page on protocol extensions(https://clangd.llvm.org/extensions#compilation-commands).
 }

 -- ------------------------------------------ --
 -- For version 0.10.x and below:
 -- require('lspconfig').clangd.setup(clangd_opts)

 -- ------------------------------------------ --
 -- For version 0.11.x and above:
 if not vim.lsp.is_enabled('clangd') then
     vim.lsp.enable('clangd', clangd_opts)
 end
