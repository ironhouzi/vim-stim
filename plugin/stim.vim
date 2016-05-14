" StIm - Star Improved
" Maintainer:   Robin Skahjem-Eriksen <robinds@student.matnat.uio.no>
" Version:      0.1

if exists('g:loaded_stim_plugin')
    finish
endif
let g:loaded_stim_plugin = 1

function! StIm(opts)
    let searchword = expand("<cword>")

    if !exists('b:stim_virginstar')
        let b:stim_virginstar = 1
    endif

    let opts = split(a:opts, '\zs')

    if count(opts, 'g')
        let term = searchword
    else
        let term = "\\<". searchword ."\\>"
    endif

    if !&hlsearch || term != @/
        let b:stim_virginstar = 1
    endif

    if b:stim_virginstar
        " Change current search term.
        let @/ = term
        " Update search history.
        execute "normal! /". term
        let b:stim_virginstar = 0
    else
        execute "normal! n"
    endif
endfunction

nnoremap <silent> *  :call StIm('')<CR>:set hlsearch<CR>
nnoremap <silent> g* :call StIm('g')<CR>:set hlsearch<CR>
