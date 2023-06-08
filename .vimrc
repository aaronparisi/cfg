call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-gitbranch' "exposes fn I use to put git branch in statusline
Plug 'tpope/vim-commentary' "to comment lines with gc
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-surround' "for surrounding things with parens, etc etc etc
Plug 'neoclide/coc.nvim' "auto-completion, etc etc etc
Plug 'KabbAmine/vCoolor.vim' "modifying color codes via a color picker
Plug 'tpope/vim-abolish' "enhances substition eg repetition for case sensitivity
Plug 'tpope/vim-vinegar' "provides functionality to enhance the use of netrw
Plug 'moll/vim-node'
Plug 'myhere/vim-nodejs-complete'
Plug 'grvcoelho/vim-javascript-snippets'
" Plug 'jiangmiao/auto-pairs' "things like auto {}, '', [], ()"
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let mapleader = ","

set ttimeoutlen=5
set number relativenumber
set laststatus=2
set showtabline=0
set noshowmode
set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set hidden
set breakindent showbreak=...
set backspace=indent,eol
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
set cursorlineopt=both
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
set wrap linebreak
set nowrapscan
set formatoptions-=cro
set formatoptions+=j
set scrolloff=2
set hlsearch
set incsearch
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
set nospell
set report=0
set display+=lastline
set statusline=
set statusline+=\ %f
set statusline+=%m%r%h%w%q
set statusline+=%=
set statusline+=%{gitbranch#name()}\ 
set statusline+=\ [%l/%L]\ 

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

let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_timeout = 1000
let g:hardtime_default_on=1
let g:hardtime_ignore_quickfix=1
let g:hardtime_maxcount = 2

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

inoremap jfj <Esc>:w<ENTER>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
autocmd FileType help setlocal number relativenumber

command! -nargs=1 -complete=arglist Argedit argedit <args> | argdedupe

autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>

autocmd FileType help nnoremap <buffer> s /\*\d\+\.\d\+\*<CR>zt:noh<CR>
autocmd FileType help nnoremap <buffer> S ?\*\d\+\.\d\+\*<CR>zt:noh<CR>

let @/ = ""

inoremap <silent><expr> <C-k> coc#refresh()
nnoremap <Leader>d :CocDiagnostics<Enter>
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <Leader>o :noh<Enter>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap ; :
nnoremap : ;
nnoremap z f
nnoremap Z F
nnoremap f z
nnoremap ff zz
nnoremap [f [z^
nnoremap ]f ]z^
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! GoToNextLineAtCurrentIndent()
  let l:current_indent = indent('.')
  let l:line_num = line('.') + 1
  while l:line_num <= line('$')
    let l:test_line_indent = indent(l:line_num)
    let l:test_line_content = getline(l:line_num)
    if l:test_line_content !~ '^\s*$' && l:test_line_indent < l:current_indent
      echo 'End of current indent level'
      break
    " elseif l:test_line_indent ==# l:current_indent && l:test_line_content !~ '^\s*$' && l:test_line_content !~ '^\s*\}\s*$'
    elseif l:test_line_indent ==# l:current_indent && l:test_line_content =~ '[[:alnum:]]'
      call cursor(line_num, 1)
      break
    endif
    let l:line_num += 1
  endwhile
endfunction
nnoremap <leader>j :call GoToNextLineAtCurrentIndent()<CR>zz^

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
nnoremap <leader>k :call GoToPreviousLineAtCurrentIndent()<CR>zz^

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

syntax on
set background=dark
colorscheme default

let MyBlack = 'black'
let MyWhite = '7'
let MyAccent = 'yellow'

hi clear CursorLine
execute 'highlight normal ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight folded ctermbg=' . MyBlack
execute 'highlight cursorlinenr ctermbg=' . MyBlack ' ctermfg=' . '14' . ' cterm=underline'
execute 'highlight quickfixline cterm=underline'
execute 'highlight cursorline cterm=none'
execute 'highlight linenr ctermbg=' . MyBlack . ' ctermfg=' . '14'
execute 'highlight cursearch ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight search ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenu ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight pmenusel ctermbg=' . MyAccent.  ' ctermfg=' . MyBlack
execute 'highlight visual ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight vertsplit ctermbg=' . MyWhite . ' ctermfg=' . MyBlack
execute 'highlight endofbuffer ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight CocMenuSel cterm=underline'
execute 'highlight cocunusedhighlight ctermbg=' . MyBlack . ' ctermfg=' . MyWhite
execute 'highlight cocerrorhighlight ctermbg=' . MyBlack
execute 'highlight cocwarninghighlight ctermbg=' . MyBlack
execute 'highlight clear error'
execute 'highlight clear helpError'
execute 'highlight clear helpWarning'
execute 'highlight clear helpDeprecated'
execute 'highlight clear todo'
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

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
autocmd FilterWritePre * if &diff | setlocal wrap | endif
autocmd VimEnter * if &diff | execute 'windo set wrap' | endif
