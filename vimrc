runtime! archlinux.vim

" -=- List of plugins -=- {{{
call plug#begin()
  Plug 'tomasiser/vim-code-dark'  " VisualStudio-Style Colorcheme
  Plug 'vim-airline/vim-airline'  " Better status bar
  Plug 'preservim/nerdtree'       " Directory-Tree
  Plug 'ryanoasis/vim-devicons'   " Extended icons

  " -=- Autocomplete -=- {{{
  if ($USER != "root")
    Plug 'ycm-core/YouCompleteMe', { 'for': ['c', 'cpp', 'cmake', 'go'] }
  endif
  " }}}
call plug#end()
" }}}

" -=- General Settings -=- {{{
colorscheme codedark " Set Colorscheme

set encoding=UTF-8 " Set Vim encoding to UTF-8
set nocompatible   " Disable backward compatibility with Vi

set hlsearch " Highlight search occurrences
set number   " Show line numbers
set nowrap   " No wrap if line so long
syntax on    " Syntax highlighting
" }}}


" -=- Custom Mappings -=- {{{
let mapleader = "," " Set general <Leader>

" Toggle relative line numbers
nnoremap <Leader>n :set rnu!<CR>
" Disable search highlighting
nnoremap <Leader>h :noh<CR>
" Place word in double-quotes
nnoremap <Leader>" viwb<Esc>i"<Esc>ea"<Esc>
" Place word in quotes
nnoremap <Leader>' viwb<Esc>i'<Esc>ea'<Esc>
" Enable NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
" }}}


" -=- TABs setting -=- {{{
set softtabstop=1
set shiftwidth=0
set tabstop=4
set expandtab
set smarttab
" }}}

" -=- Autocommands groups -=- {{{
augroup filetype_tabs
  " Redefine all autocommands in this group
  autocmd!

  au FileType asm setl tabstop=1 shiftwidth=3 softtabstop=1    " Asm 3-Spaces TAB
  au FileType python setl tabstop=1 shiftwidth=2 softtabstop=1 " Python 2-Spaces TAB
  au FileType vim setl tabstop=1 shiftwidth=2 softtabstop=1    " Vim 2-Spaces TAB
  au FileType json setl tabstop=1 shiftwidth=2 softtabstop=1   " Json 2-Spaces TAB
  au FileType cmake setl tabstop=1 shiftwidth=2 softtabstop=1  " CMake 2-Spaces TAB
augroup END

augroup filetype_vim
  " Redefine all autocommands in this group
  autocmd!

  au FileType vim setl foldmethod=marker
augroup END
" }}}

" -=- Setting Airline -=- {{{
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

" Disable whitespace trailing check for markdown files
let g:airline#extensions#whitespace#skip_indent_check_ft = { 'markdown': ['trailing'] }
" }}}

" Setting YouCompleteMe
set completeopt-=preview " YCM Disable preview for TAB tokens

