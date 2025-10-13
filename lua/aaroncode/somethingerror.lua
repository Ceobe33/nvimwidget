--[[
---@ cuz input a invalid symbol(..opt.guicursor = " ")white space is invalid symbol
while source set.lua file errors
E5108: Error executing lua: [string ":source (no file)"]:9: nvim_exec()..:source (no file): Vim(source):E5108: Error executi
ng lua vim/_meta.lua:0: E545: Missing colon
stack traceback:
        [C]: in function 'nvim_set_option_value'
        vim/_meta.lua: in function '_set'
        vim/_meta.lua: in function '__newindex'
        [string ":source (no file)"]:3: in main chunk
        [C]: in function 'cmd'
        [string ":source (no file)"]:9: in function <[string ":source (no file)"]:8>
stack traceback:
        [C]: in function 'cmd'
        [string ":source (no file)"]:9: in function <[string ":source (no file)"]:8>
--]]
