call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'othree/xml.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-endwise'
Plug 'takac/vim-hardtime'
Plug 'sheerun/vim-polyglot'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-matchtag'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-vinegar'
Plug 'romkatv/powerlevel10k'
"Plug 'ap/vim-buftabline'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
Plug 'ayu-theme/ayu-vim'
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:hardtime_default_on = 1

let g:airline_powerline_fonts = 1

set termguicolors
let ayucolor="dark"
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

syntax on
set number relativenumber
highlight Normal ctermbg=None
highlight LineNr ctermfg=37

highlight MatchParen  guibg=#00FF00 guifg=#111111
highlight LineNr guifg=#525252
highlight Directory guifg=#F06314
highlight StatusLine guifg=#525252

set tabstop=2
set shiftwidth=2
set cindent
set hidden
set breakindent
set backspace=indent

hi CursorLine guibg=#003F4B

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline 
	au WinLeave * setlocal nocursorline
augroup END

set belloff=all
"set vb
set showcmd
set ignorecase
set foldmethod=indent
set foldlevel=0

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set matchpairs+=<:>

hi ColorColumn guibg=#603816

let mapleader = ","

nnoremap <leader>x :Explore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0

nnoremap <leader>c :noh<CR>
nnoremap <c-p> :CtrlP<CR>
" this is a comment, feel free to delete if you ever notice me again.  Sigh.

nnoremap ; :
nnoremap : ;

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

nnoremap <c-i> :Cnext<CR>
nnoremap <c-u> :Cprev<CR>

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

nnoremap <c-j> :bp<CR>
nnoremap <c-k> :bn<CR>

let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_SR = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set timeoutlen=1000
set ttimeoutlen=5

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 250

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set scrolloff=10

set hlsearch
hi Search guibg=#858585

autocmd FileType help setlocal number relativenumber

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


set showcmd

" testing some auto save shortcuts 
	" as well as some backspace settings
" looks like they work!
