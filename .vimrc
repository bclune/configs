call pathogen#infect()

set nocompatible
set nowrap
set colorcolumn=80
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set laststatus=2
set foldmethod=manual

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:NERDTreeWinSize = 30
let g:tagbar_width = 30
let g:syntastic_check_on_open=1
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

syntax enable
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
