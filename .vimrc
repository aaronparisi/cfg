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
set breakindentopt=sbr,min:5,shift:2

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
" set visualbell
set showcmd
set ignorecase
set foldmethod=indent
set foldenable
set foldlevel=0
set foldcolumn=0
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
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel

set scrolloff=5

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

inoremap <silent><expr> <C-k> coc#refresh()

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
let MySecondary = '#9B6F85'

" lifted
let MyBlack = '#000F2A'
let MyFore = '#50CAAD'
let MyDullFore = '#44AB93'
let MyDullerFore = '#2E6F5F'
let MyDullestFore = '#204A40'
let MySecondary = '#564E4D'

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
execute 'highlight search guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight CurSearch guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight nontext guifg=' . MyFore . ' guibg=' . MyBlack
execute 'highlight visual guifg=' . MyBlack . ' guibg=' . MyFore
execute 'highlight PmenuSel guibg=' . MySecondary . ' guifg=' . MyFore
" execute 'highlight PmenuSel guibg=' . MyBlack . ' guifg=' . MyFore
execute 'highlight Pmenu guibg=' . MyFore . ' guifg=' . MyBlack
execute 'highlight PmenuSbar guibg=' . MyBlack . ' guifg=' . MyBlack
execute 'highlight PmenuThumb guibg=' . MyFore . ' guifg=' . MyFore
execute 'highlight VertSplit guifg=' . MyDullestFore . ' guibg=' . MyFore
execute 'highlight MatchParen guibg=' . MyFore . ' guifg=' . MyBlack
execute 'highlight Directory guifg=' . MyFore
execute 'highlight MoreMsg guifg=' . MyFore
execute 'highlight ModeMsg guifg=' . MyFore
execute 'highlight WarningMsg guifg=' . '#ff5500'
execute 'highlight Question guifg=' . MyFore
execute 'highlight Title guifg=' . MyFore
execute 'highlight ErrorMsg guifg=' . MyFore . ' guibg=' . MyBlack
execute 'highlight cursorline guibg=' . MyFore . ' guifg=' . MyBlack
" execute 'highlight QuickFixLine guifg=' . MyBlack . ' guibg=' . MySecondary
" autocmd WinEnter * if &buftype == 'quickfix' | highlight cursorline guibg=#ff5500 guifg=#0f0602 | setlocal cursorline | endif

" NOTE these may need to be adjusted depending on the color scheme (2 vs 3 color schemes)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'WarningMsg'],
  \ 'fg+':     ['bg', 'Normal'],
  \ 'bg+':     ['bg', 'PMenuSel'],
  \ 'hl+':     ['fg', 'WarningMsg'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }

" nnoremap <c-e> 5<c-e>
" nnoremap <c-y> 5<c-y>

