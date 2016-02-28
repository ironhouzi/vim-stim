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

    if !exists('b:stim_lastterm')
        let b:stim_lastterm = searchword
    endif

    let opts = split(a:opts, '\zs')

    if count(opts, 'g')
        let @/ = searchword
    else
        let @/ = "\\<". searchword ."\\>"
    endif

    if !&hlsearch || b:stim_lastterm != @/
        let b:stim_virginstar = 1
    endif

    let b:stim_lastterm = @/

    if !b:stim_virginstar
        execute "normal! n"
    endif

    let b:stim_virginstar = 0
endfunction

nnoremap <silent> *  :call StIm('')<CR>:set hlsearch<CR>
nnoremap <silent> g* :call StIm('g')<CR>:set hlsearch<CR>
