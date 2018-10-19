set nocp
filetype off         " Vundle requirment?


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'farmergreg/vim-lastplace'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Fix the backspace key
set backspace=indent,eol,start

"vim-airline Configs
set noshowmode
set t_Co=256

" Smart width = 3
set ai sw=4
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab ts=4 sw=4

" Use Syntax highlights
syntax on

" Use the Delek color (good for night vision!)
colo delek

" Show line numbers, and make them relative to cursor
set number
set relativenumber

" keep an offset of at least 9 lines within the file.
set scrolloff=9

" Enable folding by indent, but dont start folded!
set foldmethod=indent
" set foldlevelstart=20
set foldlevel=99

" Break lines at words if able to
set linebreak

" Turn off default ruler
set noruler
set laststatus=2

" Now we can use a statusline!
"set statusline=
"set statusline+=%F       "tail of the filename
""set statusline+=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file

" Enable folding with the spacebar
nnoremap <space> za
inoremap # X#

" ***************
" Custom Commands
" ***************
command Date r !date +"\%a \%b \%d (\%D)"
command Time r !date
command D !dict <cword>

" Enable ctrl+b to run the current code in various languages
"autocmd FileType python nmap <C-b> :w\|!python %<CR>
"autocmd FileType ruby nmap <C-b> :w\|!ruby %<CR>
nmap <C-b> :w\|!%:p<CR>
nmap <C-l> :r !date<CR>

" Enable Ctrl+a to dict a word, allowing for alternate meaning lookups!
nmap <C-a> :!dict <cword><CR>
imap <C-a> <C-O>:!dict <cword><CR>

" Remap arrow keys to visually move lines, not based on line number
"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OQ /
inoremap <Esc>OR *
inoremap <Esc>Ol +
inoremap <Esc>OS -
inoremap <Esc>OM <Enter>

au BufRead *.txt setlocal spell
au BufRead *.tex setlocal spell
au BufRead *.html setlocal spell
au Filetype html,xml,xsl source ~/.vim/scripts/closetag_html.vim

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

set nocompatible
