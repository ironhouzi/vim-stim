" StIm - Star Improved
" Maintainer:   Robin Skahjem-Eriksen <robinds@student.matnat.uio.no>
" Version:      0.1

if exists('g:loaded_stim_plugin')
    finish
endif
let g:loaded_stim_plugin = 1

function! StIm()
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

    let @/ = "\\<". b:lastterm ."\\>"

    if b:virginstar
        execute "normal! /\\<". b:lastterm ."\\>"
    else
        execute "normal! n"
    endif

    let b:virginstar = 0
endfunction

execute "nnoremap <silent> * :call StIm()<CR>:set hlsearch<CR>"
