local exist, mod = pcall(require, 'urlview')
if exist then
  require('urlview').setup({
  })

  Map("n", "\\u", "<Cmd>UrlView<CR>", { desc = "View buffer URLs" })
  Map("n", "\\U", "<Cmd>UrlView packer<CR>", { desc = "View Packer plugin URLs" })
end
