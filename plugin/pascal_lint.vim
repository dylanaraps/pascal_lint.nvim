"=============================================================
" file: pascal_lint.vim
" author:  dylan araps <dylan.araps at gmail.com>
" license: mit license
"=============================================================

if exists('g:loaded_pascal_lint') || !has('nvim')
    finish
endif
let g:loaded_pascal_lint = 1

" Load the plugin when 'FPC' is first called.
command! FPC call pascal_lint#RunFPC()
