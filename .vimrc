call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-gitbranch' "exposes fn I use to put git branch in statusline
Plug 'tpope/vim-commentary' "to comment lines with gc
Plug 'takac/vim-hardtime'
Plug 'othree/xml.vim'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
Plug 'tpope/vim-endwise' "auto-complete if, do, def, etc
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
call plug#end()

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --hidden\ --case-sensitive\ --ignore-vcs\ --glob\ '!.git'\ --glob\ '!node_modules'
endif

set timeoutlen=1000
set ttimeoutlen=5

set number relativenumber

set laststatus=2

let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,.*.css'

set showtabline=0
set noshowmode

set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent showbreak=...

set backspace=indent,eol

let mapleader = ","

set wildmenu
set wildoptions=pum
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/node_modules/*
set wildignore+=tags
set wildignore+=*.tar.*

set iskeyword-=_
set iskeyword-=-

hi clear CursorLine
set cursorlineopt=number
set cursorline

set belloff=insertmode,spell
set visualbell
set showcmd
set ignorecase

set fillchars=foldopen:-,foldclose:+,foldsep:\|,fold:\ ,vert:\|,diff:-

set signcolumn=no
set diffopt+=foldcolumn:0

set foldmethod=expr
set foldexpr=GetFoldLevel(v:lnum)
set foldenable
set foldlevel=0
set foldcolumn=0
set foldminlines=0
function! GetIndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction
function! PrevNonBlankLine(lnum)
  let current = a:lnum - 1

  while current > 0
    if getline(current) =~? '\v\S'
      return current
    endif

    let current -= 1
  endwhile

  return -2
endfunction
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1
  endwhile

  return -2
endfunction
function! GetFoldLevel(lnum)
  let prev_indent = GetIndentLevel(PrevNonBlankLine(a:lnum))
  let this_indent = GetIndentLevel(a:lnum)
  let next_indent = GetIndentLevel(NextNonBlankLine(a:lnum))

  if getline(a:lnum) =~? '\v^\s*$'
    if prev_indent == 0 || next_indent == 0
      return '0'
    endif
    return '-1'
  endif

  if this_indent < prev_indent && this_indent >= next_indent
    return this_indent + 1
  elseif this_indent == next_indent || this_indent > next_indent
    return this_indent
  elseif this_indent < next_indent
    return '>' . next_indent
  endif
endfunction
function! MyFoldText()
  let ftext = " --><-- "
  let endtext = trim(getline(v:foldend))
  if strchars(endtext) > 20
    let endtext = slice(endtext, 0, 20) . "~"
  endif
  return getline(v:foldstart) . ftext
endfunction
set foldtext=MyFoldText()

set matchpairs+=<:>

let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0

nnoremap <leader>s :source ~/.vimrc<CR>

nnoremap ; :
nnoremap : ;

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak
set wrapscan

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

inoremap jfj <Esc>:w<CR>

let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_timeout = 1000
let g:hardtime_default_on=1
let g:hardtime_ignore_quickfix=1
let g:hardtime_maxcount = 2

set formatoptions-=cro
set formatoptions+=j
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel

set scrolloff=2

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

autocmd FileType help nnoremap <buffer> s /\*\d\+\.\d\+\*<CR>zt:noh<CR>
autocmd FileType help nnoremap <buffer> S ?\*\d\+\.\d\+\*<CR>zt:noh<CR>

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
nnoremap [f [z
nnoremap ]f ]z

set report=0
set display+=lastline

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
colorscheme default

set statusline=
set statusline+=\ %f
set statusline+=%m%r%h%w%q
set statusline+=%=
set statusline+=%{gitbranch#name()}\ 
set statusline+=\ [%l/%L]\ 

let MyBlack = 'black'
let MyWhite = 'white'
let MyAccent = 'yellow'

execute 'highlight normal ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight folded ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cursorlinenr ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=underline'
execute 'highlight quickfixline ctermbg=' . MyWhite . ' ctermfg=' . MyBlack . ' cterm=none'
execute 'highlight cursorline ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=underline'
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
execute 'highlight statusline ctermbg=' . MyBlack . ' ctermfg=7'
execute 'highlight statuslinenc ctermbg=' . MyBlack . ' ctermfg=8'
execute 'highlight cocerrorfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocwarningfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocinfofloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cochintfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight errormsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight warningmsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight specialkey ctermbg=0 ctermfg=8'
execute 'highlight nontext ctermbg=0 ctermfg=' . MyWhite
execute 'highlight incsearch ctermbg=' . MyBlack . ' ctermfg=' . MyAccent
execute 'highlight diffadd ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight diffchange ctermbg=' . MyAccent . ' ctermfg=' . MyBlack
execute 'highlight diffdelete ctermbg=' . '1' . ' ctermfg=' . MyBlack
execute 'highlight difftext ctermbg=' . MyAccent . ' ctermfg=' . MyBlack
execute 'highlight colorcolumn ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight foldcolumn ctermbg=' . MyWhite . ' ctermfg=' . MyBlack

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
autocmd FilterWritePre * if &diff | setlocal wrap | endif
autocmd VimEnter * if &diff | execute 'windo set wrap' | endif
