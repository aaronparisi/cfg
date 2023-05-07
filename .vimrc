call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-gitbranch' "exposes fn I use to put git branch in statusline
Plug 'tpope/vim-commentary' "to comment lines with gc
Plug 'takac/vim-hardtime'
" Plug 'othree/xml.vim'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
" Plug 'tpope/vim-endwise' "auto-complete if, do, def, etc
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
" Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
call plug#end()

" if executable('rg')
"   set grepprg=rg\ --no-heading\ --vimgrep\ --hidden\ --case-sensitive\ --ignore-vcs\ --glob\ '!.git'\ --glob\ '!node_modules'
" endif

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
set wildmode=longest:list,list
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
set foldopen-=hor

set signcolumn=no
set diffopt+=foldcolumn:0

set foldmethod=expr
set foldexpr=GetFoldLevel(v:lnum)
set foldenable
set foldlevel=9999
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

  if this_indent < prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*}.*$')
    return this_indent + 1
  elseif this_indent < prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*\</.*$')
    return this_indent + 1
  elseif this_indent < prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*endfunction.*$')
    return this_indent + 1
  elseif this_indent < prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*`.*$')
    return this_indent + 1
  elseif this_indent < prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*\).*$')
    return this_indent + 1
  elseif this_indent <= prev_indent && this_indent >= next_indent && (getline(a:lnum) =~? '\v^\s*\].*$')
    return this_indent + 1
  elseif this_indent == next_indent || this_indent > next_indent
    return this_indent
  elseif this_indent < next_indent
    return '>' . next_indent
  endif
endfunction
function! MyFoldText()
  let ftext = " --><--"
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
" nnoremap n nzz
" nnoremap N Nzz

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set wrap linebreak
set nowrapscan

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

inoremap jfj <Esc>:w<ENTER>

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

set nohlsearch
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

command! -nargs=1 -complete=arglist Argedit argedit <args> | argdedupe

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

inoremap <silent><expr> <C-k> coc#refresh()

nnoremap z f
nnoremap Z F
nnoremap f z
nnoremap ff zz
nnoremap [f [z
nnoremap ]f ]z

function! GoToNextLineAtCurrentIndent()
  let l:current_indent = indent('.')
  let l:line_num = line('.') + 1
  while l:line_num <= line('$')
    let l:test_line_indent = indent(l:line_num)
    let l:test_line_content = getline(l:line_num)
    if l:test_line_content !~ '^\s*$' && l:test_line_indent < l:current_indent
      echo 'End of current indent level'
      break
    elseif l:test_line_indent ==# l:current_indent && l:test_line_content !~ '^\s*$' && l:test_line_content !~ '^\s*\}\s*$'
      call cursor(line_num, 1)
      break
    endif
    let l:line_num += 1
  endwhile
endfunction
nnoremap <leader>j :call GoToNextLineAtCurrentIndent()<CR>zz

function GoToPreviousLineAtCurrentIndent()
  let l:current_indent = indent('.')
  let l:line_num = line('.') - 1
  while l:line_num >= 1
    let l:test_line_indent = indent(l:line_num)
    let l:test_line_content = getline(l:line_num)
    if l:test_line_content !~ '^\s*$' && l:test_line_indent < l:current_indent
      echo 'End of current indent level'
      break
    elseif l:test_line_indent ==# l:current_indent && l:test_line_content !~ '^\s*$' && l:test_line_content !~ '^\s*\}\s*$'
      call cursor(line_num, 1)
      break
    endif
    let l:line_num -= 1
  endwhile
endfunction
nnoremap <leader>k :call GoToPreviousLineAtCurrentIndent()<CR>zz

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
let MyWhite = '7'
let MyAccent = 'yellow'

execute 'highlight normal ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight folded ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cursorlinenr ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=underline'
execute 'highlight quickfixline ctermbg=' . MyWhite . ' ctermfg=' . MyBlack . ' cterm=none'
execute 'highlight cursorline ctermbg=' . MyBlack . ' ctermfg=' . MyWhite . ' cterm=underline'
execute 'highlight linenr ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cursearch ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight search ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenu ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenusel ctermbg=' . MyAccent.  ' ctermfg=' . MyBlack
execute 'highlight visual ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight vertsplit ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight endofbuffer ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cocunusedhighlight ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight matchparen ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight statusline ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight statuslinenc ctermbg=' . MyBlack . ' ctermfg=15'
execute 'highlight cocerrorfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocwarningfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cocinfofloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight cochintfloat ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight errormsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight warningmsg ctermbg=1 ctermfg=' . MyBlack
execute 'highlight specialkey ctermbg=0 ctermfg=8'
execute 'highlight nontext ctermbg=0 ctermfg=' . MyWhite
execute 'highlight incsearch ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight diffadd ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight diffchange ctermbg=' . MyAccent . ' ctermfg=' . MyBlack
execute 'highlight diffdelete ctermbg=' . '1' . ' ctermfg=' . MyBlack
execute 'highlight difftext ctermbg=' . MyAccent . ' ctermfg=' . MyBlack
execute 'highlight colorcolumn ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight foldcolumn ctermbg=' . MyWhite . ' ctermfg=' . MyBlack

function! IsDir(ent)
  return a:ent[strchars(a:ent)-1] == '/'
endfunction
function! SortVarLengths(ent1, ent2)
  let len1 = strchars(a:ent1)
  let len2 = strchars(a:ent2)
  let endIdx = len1 - 1
  if len2 < len1
    let endIdx = len2 - 1
  endif
  let curIdx = 0
  while curIdx < endIdx
    if a:ent1[curIdx] < a:ent2[curIdx]
      return -1
      break
    elseif a:ent1[curIdx] > a:ent2[curIdx]
      return 1
      break
    endif
    let curIdx += 1
  endwhile

  return strchars(a:ent1) < strchars(a:ent2) ? -1 : 1
endfunction
function! MySortDirEnts(ent1, ent2)
  if IsDir(a:ent1) && !IsDir(a:ent2)
    return -1
  elseif IsDir(a:ent2) && !IsDir(a:ent1)
    return 1
  elseif IsDir(a:ent1) && IsDir(a:ent2)
    return SortVarLengths(a:ent1, a:ent2)
  endif

  let ext1 = split(a:ent1, '\.')[1]
  let ext2 = split(a:ent2, '\.')[1]
  if ext1 == "html"
    return -1
  else
    return 1
  endif
  " if ext1 < ext2
  "   return -1
  " elseif ext1 > ext2
  "   return 1
  " endif

  " return SortVarLengths(a:ent1, a:ent2)
endfunction
function! MyListDirEnts(A, C, P)
  " return join(sort(getcompletion(a:A, 'file'), 'MySortDirEnts'), "\n")
  " return join(reverse(getcompletion(a:A, 'file')), "\n")
  return join(getcompletion(a:A, 'file'), "\n")
endfunction
command -complete=custom,MyListDirEnts -nargs=1 Medit edit <args>
" command -complete=file -nargs=1 Medit edit <args>

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
autocmd FilterWritePre * if &diff | setlocal wrap | endif
autocmd VimEnter * if &diff | execute 'windo set wrap' | endif
