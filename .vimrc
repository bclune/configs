call pathogen#infect()

filetype plugin on
filetype indent on

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
set splitright
set splitbelow

" fold/unfold with space
nnoremap <space> za
vnoremap <space> zf

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:NERDTreeWinSize = 40
let g:tagbar_width = 40
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
set background=light
command W w
command Wq wq
command WQ wq
command Q q
command T execute "!pdflatex % && evince %:r.pdf"

au VimLeave * :!clear 

" --DIVINE WRITE-- "
cmap w!! w !sudo tee > /dev/null %

" Magento Translation boilerplate "
let @e="di<?php echo $this->__('')?>4hp"

" set matching pairs to include pointy brackets
set mps+=<:>

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
