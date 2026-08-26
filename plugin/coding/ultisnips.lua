vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-n>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-p>'

vim.g.UltiSnipsEdit = 'vertical'
vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "after/plugin/snippets"}

if 1 == vim.fn.has('mac') then
  vim.g.python3_host_prog = '$HOME/.pyenv/shims/python3'
elseif 1 == vim.fn.has('termux') then
  vim.g.python3_host_prog = '$HOME/../usr/bin/python3'
end

