call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'takac/vim-hardtime'
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/xml.vim'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'tpope/vim-fugitive' "enables git command execution, I use it for blame
Plug 'leafgarland/typescript-vim'
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
Plug 'ap/vim-css-color' "highlight hex codes with their color
Plug 'blueyed/vim-diminactive' "uses colorcolumn to 'dim' inactive windows
Plug 'tpope/vim-endwise' "auto-complete if, do, def, etc
" Plug 'sheerun/vim-polyglot' "'collection of language packs for vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'leafOfTree/vim-matchtag' "highlights matching html tags
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
" Plug 'romkatv/powerlevel10k'
" Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc' "I think I installed this so the lua plugin would work?
" Plug 'ayu-theme/ayu-vim'
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
" Plug 'alvan/vim-closetag' "I think this duplicates the behavior of xml.vim
Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
call plug#end()

syntax off
set termguicolors

set timeoutlen=1000
set ttimeoutlen=5

set number relativenumber

set laststatus=2
set ruler

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx'

set showtabline=0

highlight StatusLine guifg=#BA4B07 guibg=#0f0f0f
highlight StatusLineNC guifg=#6c2b0a guibg=#0f0f0f

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
set statusline+=%{FugitiveStatusline()}

set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent
set backspace=indent

"set wildmenu
set iskeyword-=_

hi clear CursorLine
set cursorlineopt=number
set cursorline 

highlight LineNr guifg=#763B09
highlight CursorLineNr guifg=#ff6600 

set belloff=all
"set vb
set showcmd
set ignorecase
set foldmethod=indent
set foldenable
set foldlevel=0
hi Folded guifg=#763B09 guibg=#0f0f0f
highlight foldcolumn guibg=#0f0f0f guifg=#763B09
set foldcolumn=1
set foldminlines=0
"set fillchars=fold:\

set signcolumn=no
highlight SignColumn guibg=#0f0f0f
function! MyFoldText()
  const foldindicator = "|"
  return v:folddashes . v:folddashes . foldindicator
endfunction
set foldtext=MyFoldText()

" set foldopen-=search

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


let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak nolist

let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_SR = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set timeoutlen=1000
set ttimeoutlen=5

" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz
" nnoremap g* g*zz
" nnoremap g# g#zz

let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 250
let g:hardtime_default_on=1

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set scrolloff=10

set hlsearch
set incsearch

autocmd FileType help setlocal number relativenumber

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set showcmd

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
" nnoremap <expr> k v:count ? 'k' : 'gk'
" nnoremap <expr> j v:count ? 'j' : 'gj'

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

highlight Search guibg=#800080 guifg=#ff6600

highlight Pmenu guibg=#800080 guifg=#ff6600
highlight PmenuSel guibg=#ff6600 guifg=#0f0f0f

highlight Error guibg=#ff6600 guifg=#0f0f0f
highlight Warning guibg=#2B1408 

highlight CocInfoFloat guifg=#0f0f0f
highlight CocWarningHighlight guibg=#907600
highlight CocHintHighlight guibg=#005E63
highlight CocUnusedHighlight guibg=#391A08
highlight CocHintSign guifg=#0f0f0f

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak nolist

highlight VertSplit guifg=#800080 guibg=#ff6600
highlight MatchParen guibg=#800080 guifg=#ff6600

nnoremap z f
nnoremap Z F
nnoremap f z
nnoremap ff zz

highlight Comment guifg=#8E3C0B 
highlight NonText guifg=#763B09

set report=0
