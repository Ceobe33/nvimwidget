require('config.keymap')
require('config.autocmds')
vim = vim

local function load_dir(mod)
  local path = vim.fn.stdpath("config") .. '/' .. mod:gsub("%.", "/")
  for _, file in ipairs(vim.fn.readdir(path)) do
    if file:match("%.lua$") then
      require(mod .. "." .. file:gsub("%.lua$", ""))
    end
  end
end

local Plug = vim.fn['plug#']

-- vim.cmd([[
--   set runtimepath^=~/.vim/bundle/plug.nvim
-- ]])
--------------- plugins installation start ---------------
vim.call('plug#begin')

--===========-- tool --===========--
-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

--===========-- interface --===========--
Plug('Shougo/vimproc.vim', { ['do'] = 'make'})
-- On-demand loading: loaded when the specified command is executed
-- Plug('preservim/nerdtree', {['on'] = 'NERDTreeToggle', ['do'] = function ()
Plug('preservim/nerdtree', {['do'] = function ()
	vim.o.number = true
	vim.o.relativenumber = true
end })
Plug('tiagofumo/vim-nerdtree-syntax-highlight')
Plug('mbbill/undotree')
Plug('liuchengxu/vista.vim')
Plug('ryanoasis/vim-devicons')

--===========-- markdown --===========--
Plug('OXY2DEV/markview.nvim')


--===========-- colorscheme --===========--
Plug('rebelot/kanagawa.nvim')

--===========-- coding --===========--
-- show function name at first line where the cursor at 
Plug('nvim-treesitter/nvim-treesitter-context')

Plug('axieax/urlview.nvim')
-- Any valid git URL is allowed
Plug('https://github.com/junegunn/vim-easy-align.git')
-- Plug('windwp/nvim-autopairs')
Plug('jiangmiao/auto-pairs')

Plug('kdheepak/lazygit.nvim')

---@see required by ultisnips
Plug('honza/vim-snippets')
Plug('SirVer/ultisnips')

Plug('kawre/leetcode.nvim')
-- [TODO:]its didn't work of do function
-- Plug('ianding1/leetcode.vim', {['do'] = function ()
  vim.fn.system {'pip3', 'install pynvim keyring browser-cookie3 --user'}
  vim.fn.system {'npm', 'install -g leetcode-cli'}
-- end
-- })
Plug('neoclide/coc.nvim', {['branch'] = 'release' })

-- A simple statusline/winbar component that uses LSP to show your current code context. Named after the Indian satellite navigation system.
-- requiring `nvim-lspconfig`
Plug('SmiteshP/nvim-navic')

--===========-- lsp --===========--
Plug('nvim-treesitter/nvim-treesitter')
Plug('https://github.com/tree-sitter/tree-sitter-cli.git')
Plug('mason-org/mason.nvim')
-- required by `nvim-navic`
Plug('neovim/nvim-lspconfig')

-- Unmanaged plugin (manually installed and updated)
-- Plug('~/my-prototype-plugin')

vim.call('plug#end')
--------------- plugins installation end ---------------

-- load_dir("config")   -- loads all files in lua/config/
load_dir("plugin")

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
-- vim.cmd('silent! colorscheme seoul256')
-- vim.cmd('silent! colorscheme lunaperche')
-- vim.cmd('silent! colorscheme peachpuff')
-- vim.cmd('silent! colorscheme slate')
vim.cmd('silent! colorscheme kanagawa')
-- vim.cmd('silent! colorscheme sorbet')
-- vim.cmd('silent! colorscheme unokai')
-- vim.cmd('silent! colorscheme wildcharm')
