call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'Quramy/vim-js-pretty-template'
Plug 'morhetz/gruvbox'
Plug 'othree/xml.vim' "for auto-closing and auto-indenting html tags
"Plug 'vim-airline/vim-airline' "makes the status bar at the bottom do cool stuff
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
highlight CursorLineNR guibg=#0f0f0f guifg=#9E9E9E
"set number 
highlight Normal ctermbg=None

highlight MatchParen  guibg=#ffa064 guifg=#111111
highlight LineNr guifg=#3C3C3C
highlight Directory guifg=#F06314
highlight StatusLine guibg=#828282 guifg=#301302
set laststatus=2
set ruler

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx'

set statusline=

let g:currentmode={
      \ 'n' : 'NORMAL ',
      \ 'v' : 'VISUAL ',
      \ 'V' : 'V-Line',
      \ "\<C-V>" : 'V-Block',
      \ 'i' : 'INSERT ',
      \ 'R' : 'R ',
      \ 'Rv' : 'V-Replace',
      \ 'c' : 'Command',
      \}

set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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
set cursorline cursorcolumn

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
	au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

set belloff=all
"set vb
set showcmd
set ignorecase
set foldmethod=indent
set foldenable
set foldlevel=0
hi Folded guibg=#0f0f0f guifg=#734C0A
highlight foldcolumn guibg=#301302 guifg=#734C0A
set foldcolumn=1
set foldminlines=0
"set fillchars=fold:\ 

set signcolumn=no
highlight SignColumn guibg=#0f0f0f
function! MyFoldText()
  const foldindicator = "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
  return v:folddashes . v:folddashes . foldindicator
endfunction
set foldtext=MyFoldText()

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set matchpairs+=<:>

hi ColorColumn guibg=#321F0D

let mapleader = ","
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0

nnoremap <c-p> :CtrlP<CR>
" this is a comment, feel free to delete if you ever notice me again.  Sigh.
" ^^ I noticed you on June 28, 2022, and you are beautiful.
" If I feel guilted to add to this every fucking time I see it I'm gonna be upset - July 1, 2022

nnoremap <leader>s :source ~/.vimrc<CR>
"nnoremap <leader>x :syntax sync fromstart<CR>

nnoremap ; :
nnoremap : ;

" command! Cnext try | cnext | catch | cfirst | catch | endtry
" command! Cprev try | cprev | catch | clast | catch | endtry
" 
" command -nargs=+ Megrep vimgrep /<args>/ `git ls-files`
" 
" nnoremap :cnext<CR> :Cnext<CR>
" nnoremap :cprev<CR> :Cprev<CR>
" nnoremap <leader>r :Cnext<CR>
" nnoremap <leader>e :Cprev<CR>

set scroll=55

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

set scrolloff=5

set hlsearch
set incsearch
" hi Search guibg=#858585

autocmd FileType help setlocal number relativenumber
"autocmd FileType help setlocal number 

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


set showcmd

" testing some auto save shortcuts
	" as well as some backspace settings
" looks like they work!

function! GotoJump()
  jumps
  let j = input("Please select a jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

command! Goj call GotoJump()

"autocmd FileType help nnoremap <buffer> <CR> <C-]>
"autocmd FileType help nnoremap <buffer> <BS> <C-T>
"autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
"autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
"autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
"autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

autocmd FileType help nnoremap <buffer> s /^\?=$/1<CR>zt :noh<CR>
autocmd FileType help nnoremap <buffer> S 2?^\==$?1<CR>zt :noh<CR>

"nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
"nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> j v:count ? 'j' : 'gj'

call jspretmpl#register_tag('html', 'html')
call jspretmpl#register_tag('/*html*/', 'html')
autocmd FileType javascript JsPreTmpl

function! FindFiles(filename)
  let error_file=tempname()
  silent exe '!find . -name "' .a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfunction
command! -nargs=1 FindFile call FindFiles(<q-args>)

set nospell

let @/ = ""
