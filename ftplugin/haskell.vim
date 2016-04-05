if !exists("g:vimux_haskell_default_mapping") || !g:vimux_haskell_default_mapping
    finish
endif

nmap gb <Plug>(operator-sendghci)

nnoremap go :GhciOpen<Enter>
nnoremap gx :GhciClose<Enter>
nnoremap gi :GhciInterrupt<Enter>
nnoremap gl :GhciLoadFile<Enter>
nnoremap gc :GhciRunCommand<Enter>
autocmd VimLeave *.hs :GhciClose
