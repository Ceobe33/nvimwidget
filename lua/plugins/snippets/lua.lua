local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
-- require("luasnip.loaders").reload_file("./lua.lua")
ls.snippets = {
    -- When trying to expand a snippet, luasnip first searches the tables for
    -- each filetype specified in 'filetype' followed by 'all'.
    -- If ie. the filetype is 'lua.c'
    --     - luasnip.lua
    --     - luasnip.c
    --     - luasnip.all
    -- are searched in that order.
    -- typescript = {
    --     s(
    --         "warn",
    --         fmt(
    --             [[
    --             console.warn("aaronyunfei====={}", {})
    --             ]],
    --             {
    --                 c(1, { t("sth") }),
    --                 i(0),
    --             }
    --         )
    --     ),
    -- },
    lua = {
        s({ filetype = "lua", trig = "aaron" }, fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    },
    all = {
        -- trigger is fn.
        s("fn", {
            -- Simple static text.
            t("//Parameters: "),
            -- function, first parameter is the function, second the Placeholders
            -- whose text it gets as input.
            -- f(copy, 2),
            t({ "", "function " }),
            -- Placeholder/Insert.
            i(1),
            t("("),
            -- Placeholder with initial text.
            i(2, "int foo"),
            -- Linebreak
            t({ ") {", "\t" }),
            -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
            i(0),
            t({ "", "}" }),
        }),
    },
}
print("sth logic in lua $TM_FILE")
return {
    -- lf = { fmt("local {} = require('{}')", { i(1, "default"), rep(1) }) },
    -- s({ filetype = "lua", trig = "aaron" }, fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
}
