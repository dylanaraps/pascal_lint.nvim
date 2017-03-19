"=============================================================
" FILE: pascal_lint.vim
" AUTHOR:  Dylan Araps <dylan.araps at gmail.com>
" License: MIT license
"=============================================================

let g:pascal_lint#args = get(g:, 'pascal_lint#args', '-S2')
let g:pascal_lint#split = get(g:, 'pascal_lint#split', '5new')

function! pascal_lint#RunFPC()
    " List of lines to exclude from the output.
    let grep = '| grep -v "^Free Pascal\|^Copyright\|^Compiling\|^Target OS\|returned an error exitcode\|Compilation aborted"'

    " Save the current filename since we can't get it once we split.
    let file = expand('%:p')

    " Delete previous 'fpc' instance.
    silent! bd! fpc_term

    " Create the split.
    execute g:pascal_lint#split

    " Run 'fpc'.
    call termopen("fpc " . g:pascal_lint#args . " '" . file . "' 2>/dev/null " . grep)

    " Rename the buffer so we can replace it later.
    file fpc_term

    " Unfocus the buffer.
    wincmd w
endfunction

