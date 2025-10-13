local M = {}

local utils = require("utils")

vim.g.session_dir = vim.fn.stdpath("config") .. "/sessions"

if vim.fn.isdirectory(vim.g.session_dir) == 0 then
    vim.fn.mkdir(vim.g.session_dir, "p")
end

local function get_session_name()
    if vim.fn.trim(vim.fn.system("git rev-parse --is-inside-work-tree")) == "true" then
        return vim.fn.trim(vim.fn.system("basename `git rev-parse --show-toplevel`"))
    else
        return "Session.vim"
    end
end

local default_session_name = get_session_name()

local function make_session(session_name)
    local cmd = "mks! " .. session_name
    vim.cmd(cmd)
end

function M.save_session()
    vim.ui.input({ prompt = "Input session name: ", default = default_session_name }, function(session_name)
        if session_name then
            session_name = vim.g.session_dir .. "/" .. session_name
            make_session(session_name)
        end
    end)
end

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function restore_session(prompt_bufnr, _)
    actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local session_name = selection[1]:gsub("./", "")
        session_name = vim.g.session_dir .. "/" .. session_name
        local cmd = "source " .. session_name
        vim.cmd(cmd)
        utils.info(session_name, "Session restored")
    end)
    return true
end

function M.list_session()
    local opts = {
        attach_mappings = restore_session,
        prompt_title = "Select session ",
        cwd = vim.g.session_dir,
    }
    require("telescope.builtin").find_files(opts)
end
return M
