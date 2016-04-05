scriptencoding utf-8

if !exists("g:loaded_vimux") || exists("g:loaded_vimux_haskell") || &cp
    finish
endif

let g:loaded_vimux_haskell = 1

function! vimuxhaskell#GhciOpen()
    if executable("ghci")
        call VimuxOpenRunner()
        call VimuxSendText("ghci")
        call VimuxSendKeys("enter")
    endif
endfunction

function! vimuxhaskell#GhciClose()
    if executable("ghci")
        call VimuxSendText(":quit")
        call VimuxSendKeys("enter")
    endif
    call VimuxCloseRunner()
endfunction

function! vimuxhaskell#GhciInterrupt()
    if executable("ghci")
        call VimuxSendKeys("C-c")
    endif
endfunction

function! vimuxhaskell#GhciLoadFile()
    if executable("ghci")
        call VimuxSendText(":l ".expand("%:p"))
        call VimuxSendKeys("enter")
    endif
endfunction

function! vimuxhaskell#GhciRunCommand()
    if executable("ghci")
        call inputsave()
        let cmd = input("ghci> ")
        call inputrestore()
        call vimuxhaskell#GhciSendRaw(cmd)
    endif
endfunction

function! vimuxhaskell#GhciSendRaw(content)
    if executable("ghci")
        call VimuxSendText(a:content)
        call VimuxSendKeys("enter")
    endif
endfunction

function! vimuxhaskell#GhciSendBuffer(content)
    if executable("ghci")
python << pythonend
import vim
content = vim.eval("a:content")
lines = content.split("\n")
if (len(lines)>1):
    lines[0] = "let "+lines[0]
new_content = "\n\\".join([":{"]+lines[:1]+["    "+line for line in lines[1:]]+[":}"])
vim.command('let newcontent ="%s"'%new_content)
print('let newcontent = "%s"'%new_content)
pythonend
        call vimuxhaskell#GhciSendRaw(newcontent)
    endif
endfunction

function! vimuxhaskell#GhciSendTextObject(motion)
    call setreg('g', '', 'v')
    if a:motion ==# "char"
        let visual = 'v'
    elseif a:motion ==# "line"
        let visual = 'V'
    elseif a:motion ==# "block"
        let visual = 'V'
    endif
    execute 'normal! `['.visual.'`]"vy'
    call vimuxhaskell#GhciSendBuffer(getreg('v'))
endfunction


