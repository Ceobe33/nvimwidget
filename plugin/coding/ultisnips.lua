vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-f>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-b>'

vim.g.UltiSnipsEdit = 'vertical'

if 1 == vim.fn.has('mac') then
  vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.13/bin/python3'
end

