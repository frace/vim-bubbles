" File: vim-bubbles.vim
" Author: frace
" Url: https://github.com/frace/vim-bubbles
" Description: "Bubble" text like Textmate

if exists('g:loaded_bubbles')
    finish
endif

let s:plugin_name = 'vim-bubbles'
let g:loaded_bubbles = 1

if v:version < 703 || &compatible
    echom 'Plugin ' . s:plugin_name . ': ' . 'requires at least Vim 7.3 and :set nocompatible.'
endif

" Check user settings
if !exists('g:bubbles_leader')
    let g:bubbles_leader = '<C>'
endif

if !exists('g:bubbles_keyset')
    let g:bubbles_keyset = 'hjkl'
endif

function! s:AssembleMappings(leader, keyset)
    if !empty(a:leader)
        let l:leader = substitute(a:leader, '>', '-', '')
    else
        echom 'Plugin ' . s:plugin_name . ': ' . 'Please provide an arbitrary leader key.'
        return
    endif

    if a:keyset ==# 'hjkl'
        let l:keys = [ 'h> ', 'j> ', 'k> ', 'l> ' ]
    elseif a:keyset ==# 'arrows'
        let l:keys = [ 'Left> ', 'Down> ', 'Up> ', 'Right> ' ]
    else
        echom 'Plugin ' . s:plugin_name . ': ' . 'Allowed keysets are «hjkl» or «arrows»'
        return
    endif

    " Normal mode: Move line vertically and autindent
    execute "nnoremap <silent>" . l:leader . l:keys[1] . ":move .+1<Cr>==^"
    execute "nnoremap <silent>" . l:leader . l:keys[2] . ":move .-2<Cr>==^"

    " Normal mode: Indent line
    execute "nnoremap <silent>" . l:leader . l:keys[0] . "<<^"
    execute "nnoremap <silent>" . l:leader . l:keys[3] . ">>^"

    " Visual mode: Move lines vertically and autoindent
    execute "vnoremap <silent>" . l:leader . l:keys[1] . ":move '>+1<Cr>gv=gv"
    execute "vnoremap <silent>" . l:leader . l:keys[2] . ":move '<-2<Cr>gv=gv"

    " Visual mode: Indent lines
    execute "vnoremap <silent>" . l:leader . l:keys[0] . "<gv^"
    execute "vnoremap <silent>" . l:leader . l:keys[3] . ">gv^"

    return
endfunction

augroup InitKeyMaps
    autocmd!
    autocmd VimEnter * call s:AssembleMappings(g:bubbles_leader,g:bubbles_keyset)
    autocmd VimEnter * augroup! InitKeyMaps
augroup END
