" pascal_lint.nvim
" by Dylan Araps

if exists("g:loaded_pascal_lint")
    finish
endif
let g:loaded_pascal_lint = 1

let g:pascal_lint#args = get(g:, 'pascal_lint#args', '-S2')
let g:pascal_lint#split = get(g:, 'pascal_lint#split', '5new')

function! RunFPC()
    if has('nvim')
        " List of lines to exclude from the output.
        let grep = '| grep -v "^Free Pascal\|^Copyright\|^Compiling\|^Target OS\|returned an error exitcode\|Compilation aborted"'

        " Save the current filename since we can't get it once we split.
        let file = expand('%:p')

        " Delete previous 'fpc' instance.
        silent! bd! fpc_term

        " Create a split.
        execute g:pascal_lint#split

        " Run 'fpc'.
        call termopen("fpc " . g:pascal_lint#args . " '" . file . "' 2>/dev/null " . grep)

        " Rename the buffer so we can replace it later.
        file fpc_term

        " Unfocus the buffer.
        wincmd w
    else
        echom "pascal_lint.nvim only works with neovim."
    endif
endfunction

" This command works with all of fpc's cmdline flags.
command! FPC call RunFPC()
