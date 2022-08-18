call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'takac/vim-hardtime'
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/xml.vim'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
" Plug 'ctrlpvim/ctrlp.vim' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
" set notermguicolors
" set t_Co=16
" colorscheme default

set timeoutlen=1000
set ttimeoutlen=5

set number relativenumber

set laststatus=2
set ruler

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx'

set showtabline=0

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

function StatusLineLeftSpacer()
  let spacer = repeat(" ", 3)
  return spacer
endfunction

" set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{StatusLineLeftSpacer()}
set statusline+=%<%F\ %h%m%r%=%-14.(%l/%L%)\ 
set statusline+=%{FugitiveStatusline()}

set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent
set breakindentopt=sbr,min:5,shift:1

function! MyShowBreak()
  " return repeat('  ', v:indentlevel) . "..."
  return "hiiiiii"
endfunction
" set showbreak=myShowBreak()
let &showbreak='     ... '
set backspace=indent,eol

set wildmenu
set iskeyword-=_

hi clear CursorLine
set cursorlineopt=number
set cursorline 


set belloff=all
"set vb
set showcmd
set ignorecase
set foldmethod=indent
set foldenable
set foldlevel=0
set foldcolumn=1
set foldminlines=0
set fillchars=fold:\ ,vert:\|

set signcolumn=no
function! MyFoldText()
  const indentChar = " "
  const indentChars = repeat(indentChar, v:foldlevel)
  const foldindicator = ""
  const tailChars = "-->-<--"
  return indentChars . indentChars . foldindicator . tailChars
endfunction
set foldtext=MyFoldText()

" set foldopen=all
" set foldclose=undo

set matchpairs+=<:>


let mapleader = ","
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0

nnoremap <c-p> :FZF<CR>

" nnoremap <c-p> :CtrlP<CR>
" this is a comment, feel free to delete if you ever notice me again.  Sigh.
" ^^ I noticed you on June 28, 2022, and you are beautiful.
" If I feel guilted to add to this every fucking time I see it I'm gonna be upset - July 1, 2022

nnoremap <leader>s :source ~/.vimrc<CR>
"nnoremap <leader>x :syntax sync fromstart<CR>

nnoremap ; :
nnoremap : ;


let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak nolist
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrapscan

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
autocmd FileType * setlocal syntax=off

set scrolloff=10

set hlsearch
set incsearch

autocmd FileType help setlocal number relativenumber

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

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



nnoremap z f
nnoremap Z F
nnoremap f z
nnoremap ff zz


set report=0
set display+=lastline
set title


function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! BuffersGrep (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=+ BuffGrep call BuffersGrep(<q-args>)

" inoremap <leader><CR> <CR><C-o>==<C-o>O

" set.filter(cur_poll=question.num_pol)
" ues_list('num_votes', flat=True))

" // Color Schemes + Highlighting
" Black, Orange and Yellow (default)
let MyBlack = '#0f0602'
let MyFore = '#ff5500'
let MyDullFore = '#AB390A'
let MyDullerFore = '#2E1205'
let MyDullestFore = '#451904'
let MySecondary = '#ffb900'

" lifted
" let MyBlack = '#000F2A'
" let MyFore = '#59E3C2'
" let MyDullFore = '#44AB93'
" let MyDullerFore = '#2E6F5F'
" let MyDullestFore = '#204A40'
" let MySecondary = '#f0bcd4'

" Neon Bogies
" let MyBlack = '#1b2d2a'
" let MyFore = '#aaa95a'
" let MyDullFore = '#76753F'
" let MyDullerFore = '#4F4E2B'
" let MyDullestFore = '#3E3D23'
" let MySecondary = '#ceff1a'

" New England
" let MyBlack = '#061a40'
" let MyFore = '#b9d6f2'
" let MyDullFore = '#b9d6f2'
" let MyDullerFore = '#b9d6f2'
" let MyDullestFore = '#b9d6f2'
" let MySecondary = '#f1ffc4'

" Cantamelon
" let MyBlack = '#184a45'
" let MyFore = '#b0b8b4'
" let MyDullFore = '#858B87'
" let MyDullerFore = '#656A67'
" let MyDullestFore = '#434644'
" let MySecondary = '#fc766a'

" Horse d'oeuvres
" let MyBlack = '#553d56'
" let MyFore = '#a4bef3'
" let MyDullFore = '#a4bef3'
" let MyDullerFore = '#a4bef3'
" let MyDullestFore = '#a4bef3'
" let MySecondary = '#857885'

" Fruits
" let MyBlack = '#2e2836'
" let MyFore = '#b6d094'
" let MyDullFore = '#87996C'
" let MyDullerFore = '#616E4E'
" let MyDullestFore = '#3A4130'
" let MySecondary = '#D65667'

" Drink
" let MyBlack = '#102e4a'
" let MyFore = '#a682ff'
" let MyDullFore = '#a682ff'
" let MyDullerFore = '#a682ff'
" let MyDullestFore = '#a682ff'
" let MySecondary = '#55c1ff'

" Tea Green
" let MyBlack = '#611c35'
" let MyFore = '#d7e8ba'
" let MyDullFore = '#d7e8ba'
" let MyDullerFore = '#d7e8ba'
" let MyDullestFore = '#d7e8ba'
" let MySecondary = '#ffa630'

" Frostberry
" let MyBlack = '#571032'
" let MyFore = '#d1f3de'
" let MyDullFore = '#d1f3de'
" let MyDullerFore = '#d1f3de'
" let MyDullestFore = '#d1f3de'
" let MySecondary = '#b07289'

" Dustbuckle
" let MyBlack = '#1d3c45'
" let MyFore = '#fff1e1'
" let MyDullFore = '#fff1e1'
" let MyDullerFore = '#fff1e1'
" let MyDullestFore = '#fff1e1'
" let MySecondary = '#d2601a'

" Booweeu
" let MyBlack = '#271F30'
" let MyFore = '#8dffcd'
" let MyDullFore = '#8dffcd'
" let MyDullerFore = '#8dffcd'
" let MyDullestFore = '#8dffcd'
" let MySecondary = '#edd83d'

" Raisin Salsa
" let MyBlack = '#272932'
" let MyFore = '#0CB0B5'
" let MyDullFore = '#0CB0B5'
" let MyDullerFore = '#0CB0B5'
" let MyDullestFore = '#0CB0B5'
" let MySecondary = '#f05d5e'

" Reese's
" let MyBlack = '#350500'
" let MyFore = '#fa4d06'
" let MyDullFore = '#BE3A04'
" let MyDullerFore = '#983007'
" let MyDullestFore = '#752608'
" let MySecondary = '#ffef00'

" Black, Orange and Purple
" let MyBlack = '#0f0602'
" let MyFore = '#ff5500'
" let MyDullFore = '#AB390A'
" let MyDullerFore = '#2E1205'
" let MyDullestFore = '#451904'
" let MySecondary = '#A800FF'

" Black, Orange and Purple
" let MyBlack = '#0f0602'
" let MyFore = '#ff5500'
" let MyDullFore = '#AB390A'
" let MyDullerFore = '#2E1205'
" let MyDullestFore = '#451904'
" let MySecondary = '#A800FF'

" Blue, White and Yellow
" let MyBlack = '#090769'
" let MyFore = '#B5B5B5'
" let MyDullFore = '#7B7B7B'
" let MyDullerFore = '#545454'
" let MyDullestFore = '#2F2F2F'
" let MySecondary = '#ffb900'

" execute 'highlight Cursor guibg=' . MyFore . ' guifg=' . MyBlack
execute 'highlight ColorColumn guibg=' . MyDullestFore
execute 'highlight CocFloating guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CocErrorFloat guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CocWarningFloat guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CocInfoFloat guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CocHintFloat guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CocWarningHighlight guifg=' . MyFore
execute 'highlight CocUnusedHighlight guibg=' . MyBlack
execute 'highlight normal guifg=' . MyFore . ' guibg=' . MyBlack
execute 'highlight linenr guifg=' . MyFore
execute 'highlight cursorlinenr guifg=' . MyFore
execute 'highlight folded guibg=' . MyBlack . ' guifg=' . MyFore
execute 'highlight foldcolumn guibg=' . MyBlack . ' guifg=' . MyFore
execute 'highlight signcolumn guibg=' . MyBlack . ' guifg=' . MyFore
execute 'highlight statuslinenc guibg=' . MyFore . ' guifg=' . MyDullestFore
execute 'highlight statusline guifg=' . MyDullFore . ' guibg=' . MyBlack
execute 'highlight search guifg=' . MyBlack . ' guibg=' . MySecondary
execute 'highlight nontext guifg=' . MyFore . ' guibg=' . MyBlack
execute 'highlight visual guifg=' . MyBlack . ' guibg=' . MySecondary
execute 'highlight PmenuSel guibg=' . MySecondary . ' guifg=' . MyBlack
execute 'highlight Pmenu guibg=' . MyFore . ' guifg=' . MyBlack
execute 'highlight PmenuSbar guibg=' . MyFore . ' guifg=' . MyFore
execute 'highlight PmenuThumb guibg=' . MySecondary . ' guifg=' . MySecondary
execute 'highlight VertSplit guifg=' . MyDullestFore . ' guibg=' . MyFore
execute 'highlight MatchParen guibg=' . MySecondary . ' guifg=' . MyBlack
execute 'highlight Directory guifg=' . MyFore
execute 'highlight MoreMsg guifg=' . MyFore
execute 'highlight ModeMsg guifg=' . MyFore
execute 'highlight WarningMsg guifg=' . MyFore
execute 'highlight Question guifg=' . MyFore
execute 'highlight Title guifg=' . MyFore
execute 'highlight ErrorMsg guifg=' . MyFore . ' guibg=' . MyBlack
execute 'highlight cursorline guibg=' . MyFore . ' guifg=' . MyBlack
" autocmd WinEnter * if &buftype == 'quickfix' | highlight cursorline guibg=#ff5500 guifg=#0f0602 | setlocal cursorline | endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['bg', 'PmenuSel'],
  \ 'fg+':     ['bg', 'Normal', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['bg', 'PmenuSel'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }

" nnoremap <c-e> 5<c-e>
" nnoremap <c-y> 5<c-y>
