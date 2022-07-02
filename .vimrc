call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'othree/xml.vim' "for auto-closing and auto-indenting html tags
Plug 'vim-airline/vim-airline' "makes the status bar at the bottom do cool stuff
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
"Plug 'neoclide/coc-eslint'
"Plug 'neoclide/coc-prettier'
Plug 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plug 'tpope/vim-fugitive' "enables git command execution, I use it for blame
Plug 'leafgarland/typescript-vim'
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
Plug 'ap/vim-css-color' "highlight hex codes with their color
Plug 'ryanoasis/vim-devicons' "adds icons to things like CtrlP, airline status bar
Plug 'blueyed/vim-diminactive' "uses colorcolumn to 'dim' inactive windows
Plug 'tpope/vim-endwise' "auto-complete if, do, def, etc
Plug 'takac/vim-hardtime' "prevent 'cheating'
Plug 'sheerun/vim-polyglot' "'collection of language packs for vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-matchtag' "highlights matching html tags
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
"Plug 'romkatv/powerlevel10k'
"Plug 'ap/vim-buftabline'
"Plug 'xolox/vim-lua-ftplugin'
"Plug 'xolox/vim-misc' "I think I installed this so the lua plugin would work?
Plug 'ayu-theme/ayu-vim'
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
"Plug 'alvan/vim-closetag' "I think this duplicates the behavior of xml.vim
Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
call plug#end()

"let g:airline#extensions#tabline#enabled = 1
let g:hardtime_default_on = 1

let g:airline_powerline_fonts = 1

set termguicolors
"let ayucolor="dark"
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

syntax on
set number relativenumber
highlight Normal ctermbg=None
highlight LineNr ctermfg=37

highlight MatchParen  guibg=#ffa064 guifg=#111111
highlight LineNr guifg=#525252
highlight Directory guifg=#F06314
highlight StatusLine guifg=#525252

set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent
set backspace=indent

"set wildmenu
set iskeyword-=_

hi CursorLine guibg=#1A1A1A
hi CursorColumn guibg=#1A1A1A
"set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"augroup CursorLine
"	au!
"	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
"	au WinLeave * setlocal nocursorline nocursorcolumn
"augroup END

set belloff=all
"set vb
set showcmd
set ignorecase
set foldmethod=indent
set foldlevel=0
hi Folded guibg=#0B0B0B

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set matchpairs+=<:>

hi ColorColumn guibg=#321F0D

let mapleader = ","

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0

nnoremap <c-p> :CtrlP<CR>
" this is a comment, feel free to delete if you ever notice me again.  Sigh.
" ^^ I noticed you on June 28, 2022, and you are beautiful.
" If I feel guilted to add to this every fucking time I see it I'm gonna be upset - July 1, 2022

nnoremap <leader>s :source ~/.vimrc<CR>

nnoremap ; :
nnoremap : ;

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

command -nargs=+ Megrep vimgrep /<args>/ `git ls-files`

nnoremap :cnext<CR> :Cnext<CR>
nnoremap :cprev<CR> :Cprev<CR>
nnoremap <leader>r :Cnext<CR>
nnoremap <leader>e :Cprev<CR>

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak nolist

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

set scrolloff=1

set hlsearch
set incsearch
" hi Search guibg=#858585

autocmd FileType help setlocal number relativenumber

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


set showcmd

" testing some auto save shortcuts
	" as well as some backspace settings
" looks like they work!
