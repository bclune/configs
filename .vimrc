call pathogen#infect()

filetype plugin on
filetype indent on

set nocompatible
set nowrap
set colorcolumn=80
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set laststatus=2
"set foldmethod=manual
set splitright
set splitbelow
set nohlsearch

syntax enable
set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
set background=light

" fold/unfold with space
nnoremap <space> za
vnoremap <space> zf

" unfuck behavior of Y
nmap Y y$

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

command W w
command Wq wq
command WQ wq
command Q q
" Compile TeX files with :T (opens on local machine)
command T execute "!pdflatex % && evince %:r.pdf"

" Clear screen on quit
au VimLeave * :!clear 

" --DIVINE WRITE-- "
cmap w!! w !sudo tee > /dev/null %

" set matching pairs to include pointy brackets
set mps+=<:>

" Indent xml properly when using =
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Tagbar javascript support
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }
"
" Set tabstop to 4 spaces for python (PEP8 is great)
au FileType python setlocal shiftwidth=4 tabstop=4

set re=1

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" strip extra whitespace on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb :call TrimWhiteSpace()

"Set the cryptmethod to use the blowfish cipher
:setlocal cm=blowfish
