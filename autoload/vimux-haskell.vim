scriptencoding utf-8

if !exists("g:loaded_vimux") || exists("g:loaded_vimux_haskell") || &cp
    finish
endif

g:loaded_vimux_haskell = 1
g:vimux_haskell_default_mapping = 0

function! GhciOpen()
    if executable("ghci")
        call VimuxOpenRunner()
        call VimuxSendText("ghci")
        call VimuxSendKeys("enter")
    endif
endfunction

function! GhciClose()
    if executable("ghci")
        call VimuxSendText(":quit")
        call VimuxSendKeys("enter")
    endif
    call VimuxCloseRunner()
endfunction

function! GhciInterrupt()
    if executable("ghci")
        call VimuxSendKeys("C-c")
    endif
endfunction

function! GhciLoadFile()
    if executable("ghci")
        call VimuxSendText(":l ".expand("%:p"))
        call VimuxSendKeys("enter")
    endif
endfunction

function! GhciRunCommand()
    if executable("ghci")
        call inputsave()
        let cmd = input("ghci> ")
        call inputstore()
        call VimuxSendText(cmd)
        call VimuxSendKeys("enter")
    endif
endfunction

