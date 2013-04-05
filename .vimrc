call pathogen#infect()

set nocompatible        " do not emulate vi's limitations, whatever they are
set nowrap              " learn how to write 80-character wide code, y'all!
set colorcolumn=80
set tabstop=4           " tab character treated as four characters wide
set expandtab           " tab inserts spaces instead of tab character...
set shiftwidth=4        " ...specifically, four spaces
set autoindent          " keep current indentation level when starting new line
set incsearch           " incremental search: match as you type
set ignorecase          " ignore case when searching...
set smartcase           " ...except when I use caps in a search term
set scrolloff=3         " start scrolling viewport berore cursor reaches top/bot
set laststatus=2        " always show the status line
set foldmethod=manual  

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:NERDTreeWinSize = 30
let g:tagbar_width = 30
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

syntax enable               " enable syntax coloring
set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
set background=dark
command W w
command Wq wq
command WQ wq
command Q q
command T execute "!pdflatex % && evince %:r.pdf"

au VimLeave * :!clear 

" --DIVINE WRITE-- "
cmap w!! %!sudo tee > /dev/null %

" Magento Translation boilerplate "
let @e="di<?php echo $this->__('')?>4hp"

" set matching pairs to include pointy brackets
set mps+=<:>
