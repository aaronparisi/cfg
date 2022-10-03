call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-gitbranch' "exposes fn I use to put git branch in statusline
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-commentary'
Plug 'takac/vim-hardtime'
Plug 'othree/xml.vim'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
Plug 'ap/vim-css-color' "highlight hex codes with their color
Plug 'tpope/vim-endwise' "auto-complete if, do, def, etc
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
Plug 'xolox/vim-misc' "I think I installed this so the lua plugin would work?
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
Plug 'Quramy/vim-js-pretty-template' " html template string syntax highlighting
call plug#end()

set timeoutlen=1000
set ttimeoutlen=5

set number relativenumber

set laststatus=2

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,.*.css'

set showtabline=0

" function! LightlineLineinfo() abort
"   if winwidth(0) < 86
"     return ''
"   endif

"   let l:current_line = printf('%-3s', line('.'))
"   let l:max_line = printf('%-3s', line('$'))
"   let l:lineinfo = l:current_line . '/' . l:max_line
"   return l:lineinfo
" endfunction

set noshowmode

set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent
set breakindentopt=sbr,min:5

let &showbreak=''
set backspace=indent,eol

let mapleader = ","

set wildmenu
" set wildoptions=pum
set wildmode=list
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

set iskeyword-=_

hi clear CursorLine
set cursorlineopt=number
set cursorline

set belloff=insertmode,spell
set visualbell
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

set matchpairs+=<:>


let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0

" nnoremap <c-p> :FZF<CR>

nnoremap <leader>s :source ~/.vimrc<CR>

nnoremap ; :
nnoremap : ;

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak
set wrapscan

let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_SR = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

inoremap jfj <Esc>:w<CR>

let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 250
let g:hardtime_default_on=1

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
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

autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
" autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
" autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

autocmd FileType help nnoremap <buffer> s /\*\d\+\.\d\+\*<CR>zt:noh<CR>
autocmd FileType help nnoremap <buffer> S ?\*\d\+\.\d\+\*<CR>zt:noh<CR>

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

syntax off
set background=dark
" set termguicolors
" let ayucolor="dark"
" colorscheme ayu
colorscheme default

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\|
set statusline+=\ %f
set statusline+=%m%r%h%w%q
set statusline+=%=
set statusline+=%{gitbranch#name()}\ 
set statusline+=\ [%l/%L]\ 

" highlight User1 ctermbg=12 ctermfg=black
" highlight User2 ctermbg=white ctermfg=black

let MyBlack = 'black'
let MyWhite = 'white'
let MyAccent = 'yellow'

execute 'highlight normal ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight folded ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cursorlinenr ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=underline'
execute 'highlight cursorline ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=none'
execute 'highlight linenr ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cursearch ctermbg=' . MyAccent . ' ctermfg=' . MyBlack
execute 'highlight search ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenu ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenusel ctermbg=' . MyAccent.  ' ctermfg=' . MyBlack
execute 'highlight visual ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight vertsplit ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight endofbuffer ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cocunusedhighlight ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight matchparen ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight statusline ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight statuslinenc ctermbg=' . MyBlack . ' ctermfg=8'
execute 'highlight cocerrorfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocwarningfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocinfofloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cochintfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight errormsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight warningmsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight specialkey ctermbg=0 ctermfg=8'
execute 'highlight nontext ctermbg=0 ctermfg=8'

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis

set nocdh
