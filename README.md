# pascal_lint.nvim

This is a simple plugin to call `fpc` (Free Pascal Compiler) and display the output of the compilation to the user asynchronously.

There aren't any linting options for Pascal apart from using the Lazarus IDE so this is a good enough compromise.

Note: This makes use of Neovim's terminal splits. The plugin won't work in regular vim.


## Requirements

- `fpc` must be in your `$PATH`.
- `neovim`


## Installation

Use your favorite plugin manager.

- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'dylanaraps/pascal_lint.nvim'` to your `init.vim`
  2. Run `:PlugInstall`


## Usage

### :FPC

Run `fpc` on the current file and display the compiler output in a split below.

### Compile on save

Display compiler output on file save. This is asynchronous so it doesn't block neovim.

Add this line to your `init.vim`.

```viml
autocmd BufWritePost *.pas :FPC
```


## Options

### `g:pascal_lint#args`

Which arguments to pass to `fpc`.

```viml
" Default
let g:pascal_lint#args = '-S2'
```

### `g:pascal_lint#split`

What size split to create.

```viml
" Default
let g:pascal_lint#split = '5new'
```
