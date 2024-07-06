local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- TODO:when window or buffer lost focus then save file
-- vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
vim.api.nvim_create_autocmd({ "FocusLost" }, {
    group = augroup("AutoSave"),
    callback = function()
        if vim.bo.modified then
            -- 转换换行符为 CRLF
            vim.cmd([[silent! %s/\r\n/\r/g]])
            vim.cmd([[silent! %s/\n\r/\r/g]])
            vim.cmd("w")
        end
    end,
})
