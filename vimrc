runtime! archlinux.vim

" List Of Plugins
call plug#begin()
  Plug 'tomasiser/vim-code-dark'  " VisualStudio-Style Colorcheme
  Plug 'vim-airline/vim-airline'  " Better Status Bar
  Plug 'preservim/nerdtree'       " Directory-Tree
  Plug 'ryanoasis/vim-devicons'   " Extended Icons

  " Autocomplete
  if ($USER != "root")
    Plug 'ycm-core/YouCompleteMe', { 'for': ['c', 'cpp', 'cmake', 'go'] }
  endif
call plug#end()

" General Settings
colorscheme codedark " Set Colorscheme

set encoding=UTF-8 " Set Vim Encoding To UTF-8
set nocompatible   " Disable Backward Compatibility With Vi

set number " Show Line Numbers
set nowrap " No Wrap If Line So Long
syntax on  " Syntax Highlighting


" Custom Key-Bindings
let g:mapleader = "," " Set General <Leader>

" Toggle Relative Line Numbers
nnoremap <Leader>n :set rnu!<CR>
" Place Word In Double-Quotes
nnoremap <Leader>" viwb<Esc>i"<Esc>ea"<Esc>
" Place Word In Quotes
nnoremap <Leader>' viwb<Esc>i'<Esc>ea'<Esc>


" 4-TABs Config
se softtabstop=2
se shiftwidth=4
se tabstop=2
se expandtab
se smarttab

au FileType asm setl tabstop=1 shiftwidth=3 softtabstop=1    " Asm 3-Spaces TAB
au FileType python setl tabstop=1 shiftwidth=2 softtabstop=1 " Python 2-Spaces TAB
au FileType vim setl tabstop=1 shiftwidth=2 softtabstop=1    " Vim 2-Spaces TAB
au FileType cmake setl tabstop=1 shiftwidth=2 softtabstop=1  " CMake 2-Spaces TAB


" Setting Airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_section_z = "%p%% %l/%L\uE0A1 %v/%{strwidth(getline('.'))}\u2105 %b/%B"

" Disable Whitespace Trailing Check For Markdown Files
au FileType markdown silent AirlineToggleWhitespace

" Setting YouCompleteMe
set completeopt-=preview " YCM Disable Preview For TAB Tokens

