
# regular review in nvim again

[RESULT](#stage-3)  

[1. why(trigger)](#rigger-event)  
[2. how(figure out problem)](#solve-problem)  
[3. ope(confuse operating in progress)](#confuse)  
[4. get(get something in this trip)](#getting)  

## trigger event

> how to get current file path?

search "复制当前文件路径 vim" in google  
get:  
[如何将当前文件名复制到系统剪切板中？(vim)](https://forum.ubuntu.org.cn/viewtopic.php?t=384112)

<!-- TODO: fix #2 indent correctly -->
> #1  
>> 不少编辑器都有复制文件名、文件路径到剪切板的功能，vim下如何实现呢？  
expand("%:t") 获取当前文件名  
expand("%:p") 获取当前文件名（包含路径）  
但如何做成键盘快捷键复制到系统剪切板中？  
>> ```
>> ```
> #2  
>> 这样复制到 X 主选择区
>> ```vim
>> let @*=expand('%') "把 @* 换成 @+ 就是剪贴板。
>> ```
> #6  
>> 俺以前写的，和楼主的差不多;
>> ```vim
>> function! g:CopyFileEntryToClipBoard() "for syntax/index.vim {{{
>> let @+ = expand("%:p").'|'.line(".")
>> endfunction
>> silent! command -nargs=0 CopyEntry call g:CopyFileEntryToClipBoard()
>> ```
>> 不过，多了一个当前行数的功能。  
然后利用我另外一个插件，能够跳转、并定位到，该文件的具体行。  
写资料、看书必备。

本来到到2楼就可以解决我的问题，往下划了划发现了别人造好的轮子

## solve problem

### stage 1

my vim environment is neovim, it's lua.  
so I try to find something ways to solve problem how to source vim file in lua.  

by search I get a figuring way, yeah just send command `:so(urce) /path/to/vim_config.vim`  
yeah, it's really simple  
so add `vim.cmd([[source ./keymaps.vim]])` in my lua keymap config file

is that problem solved? that copy problem  
~~the answer is objectively~~ yes, it was, but not useful with my requirement  
I need a little fix with that

### stage 2

my vim is in WSL, so when copy the file path which in windows  
there has prefix `/mnt/x/` which I didn't want it  
so I asking AI  
> -- 将expend结果的前缀 “/mnt/x/" 替换成 "x:/"  
-- 在Vim中，如果你想替换 expand 函数返回的结果中的前缀，你可以使用Vim的字符串替换函数 substitute。以下是如何在Vim脚本中执行此操作的示例：
> ```vim
> let original_path = expand("%:p")
> let modified_path = substitute(original_path, '^/mnt/e/', 'e:/', '')
> ```
> 这里，original_path 保存了 expand 函数的输出，然后 substitute 函数用于查找以 /mnt/e/ 开头的字符串，并将其替换为 e:/。替换函数的第三个参数是替换后的字符串，第四个参数是标志，这里为空字符串表示默认行为。  
如果你想在Lua中执行相同的操作，可以使用以下代码：
> ```vim
> local original_path = vim.fn.expand("%:p")
> local modified_path = original_path:gsub("^/mnt/e/", "e:/")
> ```
> 在这段Lua代码中，gsub 函数用于全局替换字符串。它将 original_path 中所有匹配 /mnt/e/ 前缀的字符串替换为 e:/。结果存储在 modified_path 变量中。

and this try, redirect me to the regular expression

然后我修正了一下问题: e还有可能是d

> 了解了您的需求，如果 “e” 和 “d” 都是可能的盘符，并且您想要将它们都替换为对应的盘符路径（例如 e:/ 和 d:/）,以下是如何做到这一点的示例：  
> ```vim
> let original_path = expand("%:p")
> " 使用 substitute 进行全局替换
> let modified_path = substitute(original_path, '^/mnt/\\(e\\|d\\)/', '\=submatch(1):upper() . ":/"', 'g')
> ```
到了这里就导向了错误的方向，其实我是知道`\0`, `\1` 是使用前一个匹配结果作为输入项，但是这里忘记了  
`submatch()` 官方文档是用来计算, 完了会在结尾追加换行 :/
> ```txt
> " :h(elp) submatch()
> submatch({nr} [, {list}])                                      *submatch()* *E935*
> 		Only for an expression in a |:substitute| command or
> 		substitute() function.
> 		Returns the {nr}th submatch of the matched text.  When {nr}
> 		is 0 the whole matched text is returned.
> 		Note that a NL in the string can stand for a line break of a
> 		multi-line match or a NUL character in the text.
> 		Also see |sub-replace-expression|.  
>
> 		If {list} is present and non-zero then submatch() returns
> 		a list of strings, similar to |getline()| with two arguments.
> 		NL characters in the text represent NUL characters in the
> 		text.
> 		Only returns more than one item for |:substitute|, inside
> 		|substitute()| this list will always contain one or zero
> 		items, since there are no real line breaks.
> 
> 		When substitute() is used recursively only the submatches in
> 		the current (deepest) call can be obtained.
> 
> 		Returns an empty string or list on error.
> 
> 		Examples: 
> 			s/\d\+/\=submatch(0) + 1/
> 			echo substitute(text, '\d\+', '\=submatch(0) + 1', '')
> 		This finds the first number in the line and adds one to it.
> 		A line break is included as a newline character.
>```

在错误方向浪费了一些时间,不过这个经历会成为一个解决之后问题的"index"  
提供快速解决问题的"灵光一闪"

### stage 3

找到解决方法之后,很快就写出了对应的方法, 到最后 很有成就感 :)  

> ```vim
> "这样复制到 X 主选择区
> "let @*=expand('%')
> "把 @* 换成 @+ 就是剪贴板。
> 
> function! g:CpFileEntryToClipBoardNoLineWin()
> let original_path = expand("%:p")
> let modified_path = substitute(original_path, '^/mnt/\(\w\)', '\1:', '')
> "echo modified_path
> let @+ = modified_path
> endfunction
> silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoardNoLineWin()
> 
> function! g:CpFileEntryToClipBoardNoLine()
> let @+ = expand("%:p")
> endfunction
> silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoardNoLine()
> 
> function! g:CpFileEntryToClipBoard()
> let @+ = expand("%:p").'|'.line(".")
> endfunction
> silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoard()
> ```

## confuse

## getting

regular in vim, `substitute`, `submatch()` keywords

vim function must use capital character as function name the first character
