" StIm - Star Improved
" Maintainer:   Robin Skahjem-Eriksen <robinds@student.matnat.uio.no>
" Version:      0.1

if exists('g:loaded_stim_plugin')
    finish
endif
let g:loaded_stim_plugin = 1

function s:updateState()
    let s:searchword = expand("<cword>")

    if !exists('b:virginstar')
        let b:virginstar = 1
    endif

    if !exists('b:lastterm')
        let b:lastterm = s:searchword
    endif

    if !&hlsearch
        let b:virginstar = 1
    endif

    if b:lastterm != s:searchword
        let b:virginstar = 1
        let b:lastterm = s:searchword
    endif
endfunction

function s:frwdWord()
    let @/ = "\\<". b:lastterm ."\\>"

    if b:virginstar
        " Set the previous context mark on the word searched from.
        call setpos("''", getcurpos())
    else
        call search("\\<". b:lastterm ."\\>")
    endif

    let b:virginstar = 0
endfunction

function s:bkwdWord()
    let @/ = "\\<". b:lastterm ."\\>"

    if b:virginstar
        call setpos("''", getcurpos())
    else
        call search("\\<". b:lastterm ."\\>", "b")
    endif

    let b:virginstar = 0
endfunction

function s:frwdPrtl()
    let @/ = b:lastterm

    if b:virginstar
        call setpos("''", getcurpos())
    else
        call search(b:lastterm)
    endif

    let b:virginstar = 0
endfunction

function s:bkwdPrtl()
    let @/ = b:lastterm

    if b:virginstar
        call setpos("''", getcurpos())
    else
        call search(b:lastterm, "b")
    endif

    let b:virginstar = 0
endfunction

nnoremap <silent> <Plug>StImFrwdWord :call <SID>updateState()<CR>:call <SID>frwdWord()<CR>:set hlsearch<CR>:let v:searchforward=1<CR>
nnoremap <silent> <Plug>StImBkwdWord :call <SID>updateState()<CR>:call <SID>bkwdWord()<CR>:set hlsearch<CR>:let v:searchforward=0<CR>
nnoremap <silent> <Plug>StImFrwdPrtl :call <SID>updateState()<CR>:call <SID>frwdPrtl()<CR>:set hlsearch<CR>:let v:searchforward=1<CR>
nnoremap <silent> <Plug>StImBkwdPrtl :call <SID>updateState()<CR>:call <SID>bkwdPrtl()<CR>:set hlsearch<CR>:let v:searchforward=0<CR>

if !exists("g:stim_no_mappings") || ! g:stim_no_mappings
    nmap * <Plug>StImFrwdWord
    nmap # <Plug>StImBkwdWord
    nmap g* <Plug>StImFrwdPrtl
    nmap g# <Plug>StImBkwdPrtl
endif

" vim:set ft=vim sw=4 sts=4 et:
