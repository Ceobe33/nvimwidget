
vim.api.nvim_create_user_command('CtagsGenerate', function()
    vim.cmd('silent !ctags -R .')
end, {})
local function is_universal_ctags_available()
    -- 检查可执行文件
    if vim.fn.executable('ctags') ~= 1 then
        return false
    end

    -- 检查版本
    local result = vim.fn.system('ctags --version 2>&1')
    return result:match("Universal Ctags") ~= nil
end

local function check_and_notify()
    if is_universal_ctags_available() then
        -- vim.notify("✓ universal-ctags 已就绪", vim.log.levels.INFO, {title = "ctags"})
    else
        vim.notify(
            "✗ universal-ctags 未安装或不可用\n" ..
            "请运行: brew install universal-ctags",
            vim.log.levels.WARN,
            {title = "ctags", timeout = 5000}
        )
    end
end

-- 延迟检查，避免阻塞启动
vim.defer_fn(function()
    check_and_notify()
end, 1000)

-- Map('n', ':ctagsgenerate', function()
--     vim.notify('ctags 已在后台生成', vim.log.levels.INFO, { title = 'ctags' })
-- end, {desc='generate cur proj background'})


