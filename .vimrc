" vim:tw=0 et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8 :
"""""""""""""""""""""""""""""""""""""""""""""""""
"Index (Use # to go around )
"1.General_Settings
"  1.1.Colorscheme_and_fonts
"2.AutoCmd_Group
"3.Commands_And_Abbreviations
"4.Key_Mapping_General
"  4.1.Leader_Mapping
"  4.2.win_behave_settings
"  4.3.Input_And_Moving
"5.Plugins_And_Key_Mapping
"6.Function_And_Key_Mapping
"8.Other_Stuffs
"By: Rykka10(at)gmail.com
"Last Change: 2011-04-11 16:02
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.General_Settings
"""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#runtime_append_all_bundles()
"{{{ behavewin
if has('gui_running')
    behave mswin
    source $VIMRUNTIME/mswin.vim
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " Always show file types in menu
    let do_syntax_sel_menu=1
else
    " Do not increase the windows width in taglist
    let Tlist_Inc_Winwidth=0
endif "}}}

"{{{multi_byte
set encoding=utf-8
set fileencoding=utf8
set fileencodings=utf8,gb18030,cp936
set termencoding=utf-8
set formatoptions+=qr2
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1

if has("multi_byte")
    "language messages zh_CN.utf-8
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
endif
"}}}


set nocompatible
syntax on

filetype plugin indent on



"history
"the browse window's directory
set browsedir=buffer
" Tell vim to remember certain things when we exit
set viminfo='100,\"30,:20,s10,%
"Set to NOT auto read when a file is changed from the outside
set noautoread

"{{{ui setting
set ruler "column and line number even no status line
set nonumber

set modeline
set cmdheight=1
set laststatus=2
set splitbelow splitright
set winminwidth=0 winminheight=0
" minimal screen line that always visible while working
set scrolloff=3
set scrolljump=1
map <scrollwheelup> 3k
map <scrollwheeldown> 3j
map <s-scrollwheelup> 30k
map <s-scrollwheeldown> 30j
"Do not redraw, when running macros.. lazyredraw
set nolz
set display=lastline "show dialog not completely
set showcmd " show current key in cmd line
set guioptions=gt
set guioptions-=m
set guioptions-=T
"set cuc	"cursorcolumn
set nocursorline

"swap file
"set noswapfile
"A No Swap message
"filnxtToO
set shortmess+=As
"set shortmess-=O
set visualbell
set t_vb=
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.

set winaltkeys=no

" Set cmd-mode
if has('wildmenu')
set wildchar=<Tab> wildmenu wildmode=full
    set wildignore=*.o,*.obj,*.bak,*.exe,*.swp
    set cpoptions-=<  "compatible-options"
    set wildcharm=<C-Z> "wildchar inside macro"
endif

set showtabline=1
set tabpagemax=15
" end of UI }}}
set foldenable
set foldmethod=marker
set foldcolumn=1
"set foldlevel=3
set foldlevelstart=2
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
set foldminlines=1
"set foldclose=all


" I want foldmarkers to be applied with space before a comment.
noremap <silent> zf :set opfunc=MyFoldMarker<CR>g@
vnoremap <silent> zf :<C-U>call MyFoldMarker(visualmode(), 1)<CR>
vnoremap <silent> <leader><leader> :<C-U>call MyFoldMarker(visualmode(), 1)<CR>

function! s:set_fold_markers(lnum_st, lnum_end) "{{{
  let markers = split(&foldmarker, ",")

  function! s:set_line(ln, marker) 
    let cmnt = substitute(&commentstring, "%s", a:marker, "")
    let line = getline(a:ln)
    if line =~ '^\s*$'
      let space = ''
    else
      let space = ' '
    endif
    let line = substitute(line, '\s*$', space, '').cmnt
    call setline(a:ln, line)
  endfunction 

  call s:set_line(a:lnum_st, markers[0])
  call s:set_line(a:lnum_end, markers[1])
endfunction "}}}

function! MyFoldMarker(type, ...) "{{{
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    call s:set_fold_markers("'<", "'>")
  elseif a:type == 'line'
    call s:set_fold_markers("'[", "']")
  elseif a:type == 'block'
  endif

  let &selection = sel_save
  let @@ = reg_save
endfunction "}}}



set showfulltag             " Show more information while completing tags.
set cscopetag               " When using :tag, <C-]>, or "vim -t", try cscope:
set cscopetagorder=0        " try ":cscope find g foo" and then ":tselect foo"

"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.1.Colorscheme_and_fonts
"""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
if has("gui_running")
    if has ("win32")
        set guifont=Courier_New:h13:cANSI
        "set gfw=Yahei_Mono:h12:cGB2312
    endif
        if has("gui_gtk2")
            set guifont=DejaVu\ Sans\ Mono\ 13,Fixed\ 13
            set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13
    endif

    "let $colorscheme_n="desert"
    let $colorscheme_n="molokai"
        colorscheme $colorscheme_n
else
    let	$colorscheme_n="desert"
    colorscheme $colorscheme_n
endif

"set statusline=%<[%2*%n%*\>%P:%l,%c]%f\%=[%1*%M%R%*%W%Y,%{&enc}][%oB,%bA]
set statusline=[%03l,%02c,%P]%<%f\%=[%1*%M%R%*%W%Y,%{&enc}][%oB,%bb]
"set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)

hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red guifg=red guibg=black gui=bold
"hi User2 guifg=gray guibg=black gui=bold

"func! CapsLockStatus()
  "let xs = system('xset q')
  "let mask = matchstr(xs, 'LED mask:\s*\zs\d\+')
  "return ((mask % 2) == 0) ? 'off' : 'on'
"endfunction
"fun! SetCapsLock()
    "set statusline=%<[%2*%n%*:%l,%c]%f\%=%{CapsLockStatus()}[%1*%M%R%*%W%Y,%{&enc}][%oB,%LL,%P]
"endfun

"aug status
    "au!
    ""au! cursorholdI * exe "let &ro = &ro"
    ""au! cursormoved * exe "let &ro = &ro"
    ""au! cursormovedi * exe "let &ro = &ro"
    ""au! InsertEnter * exe "let &ro = &ro"
"aug END
""}}}

"{{{"Editing
"use space to perform tab
set expandtab tabstop=8 shiftwidth=4 smarttab
set softtabstop=4
set shiftround              " rounds indent to a multiple of shiftwidth

set smartindent
set autoindent
set copyindent		" copy the previous indentation on autoindenting

set wrap
set linebreak

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
                
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

"search options
set hlsearch
set incsearch
set ignorecase
set smartcase

set comments=n:>,fb:-,fb:*
set formatoptions+=1orn2mM
set formatlistpat="^\s*[(\d)*#-]\+[\]:.)}\t ]\s*"
set fileformat=unix
set fileformats=unix,dos

"Have the mouse enabled all the time:
set mouse=a
set mousemodel=popup
" visual mode"
set virtualedit=block

"Change buffer - without saving
set hidden
set bufhidden=hide
set switchbuf=useopen

set spelllang=en
set nospell

if has('unnamedplus')
    set clipboard+=unnamedplus "All system
else
    set clipboard+=unnamed "System clipboard
endif


"auto complete with omni
"set ofu=syntaxcomplete#Complete
"set completeopt=menu,preview,longest
"set iskeyword+=.
"the c-x c-f file name completing  remove the "="
set isfname-==
set pumheight=10             " Keep a small completion window
" backup
if !isdirectory(expand('~/.vim_backups'))
  call mkdir(expand('~/.vim_backups'))
endif
set backup
set backupdir=~/.vim_backups/
set directory=~/.vim_backups/,.
""}}}

"VIM73
if v:version >= 703
    set colorcolumn=76

    if !isdirectory(expand('~/.vim_undo'))
      call mkdir(expand('~/.vim_undo'))
    endif
    set undofile
    set undodir=~/.vim_undo/

    " conceal text in the cursor line in the modes
    " n Normal v Visual i Insert c Command
    set concealcursor=nc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2.AutoCmd_Group
"""""""""""""""""""""""""""""""""""""""""""""""""""""
aug vimrc_GuiEnter
    au!
    au GUIENTER * cd ~/Documents/vim
    "au GUIENTER * e /home/meofi/Documents/vimwiki/Todo/TodoToday.vwk
    "au GUIENTER *.vwk set filetype=vimwiki
    "au GUIEnter * VimwikiIndex
    au GuiEnter * set t_vb=
    au GUIENTER * winpos 501 0
    au Guienter * winsize 80 100
aug END

aug vimrc_Buffer
    au!
    au BufEnter * silent! lcd %:p:h:gs/ /\\ /
    au BufRead,BufNewFile *.txt set syntax=vimwiki
    au BufRead,BufNewFile *.vim,.vimrc set filetype=vim
    "au BufRead,BufNewFile *.vwk set filetype=vimwiki
    "au BufRead,BufNewFile,WinEnter *.vwk syntax enable
    "auto go to last position when open file
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
aug END

aug vimrc_edit
    au!
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    autocmd! bufwritepost $colorscheme_n source ~/.vimrc
    autocmd! bufwritepost *.vimrc syntax on
aug END

aug vimrc_File
    au!
    " Autoclose tags on html, xml, etc
    au FileType html,xhtml,xml imap <buffer> <C-m-b> </<C-X><C-O>
    au FileType text,vimwiki setlocal tw=76
    "endif
aug END

augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " 
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " 
augroup END  " }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3.Commands_And_Abbreviations (editing mapping)
""""""""""""""""""""""""""""""""""""""""""""""""""""

"command! -nargs=* Htag helptags $VIMRUNTIME/doc <args>
command! -nargs=* Htag call pathogen#helptags() <args>
command! -nargs=* Papp call pathogen#runtime_append_all_bundles(<args>) <args>

cabbrev H h
set keywordprg=":help"

iab teh the
iab tihs this
iab thsi this
iab tath that
iab taht that

iab todo: TODO:
iab done: DONE:
iab fixme: FIXME:
iab fixed: FIXED:

iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor


inorea mdash &nbsp;&mdash;
inorea nbsp &nbsp;
inorea <<< &lt;
inorea >>> &gt;

iab stime <<C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>>
iab dtime <C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>
iab ftime <C-R>=strftime("%y-%m-%d_%H.%M.%S.txt")<CR>

nnoremap <leader>31 yyPVr=jyypVr=
nnoremap <leader>32 yyPVr*jyypVr*
nnoremap <leader>33 yypVr=
nnoremap <leader>34 yypVr-
nnoremap <leader>35 yypVr^
nnoremap <leader>36 yypVr"
nnoremap __ "zyy"zp<c-v>$r-
nnoremap ++ "zyy"zp<c-v>$r=
""""""""""""""""""""""""""""""""""""""""""""""""
" 4_Key_Mapping_General
""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :call Split_if("")<cr><Plug>VimwikiIndex
map <c-F1> :Vimwiki2HTML<cr>
map <c-m-F1> :VimwikiAll2HTML<cr>
map <s-F1> :VimwikiGenerateLinks<CR>

map <F2> :Ack <C-R><C-W>
" replace word under cursor
map <s-F2> :%s/\<<C-R><C-W>\>//gc<Left><Left><Left>

map <silent> <F3> :Unite buffer<CR>

"map <F4> :NERDTree<CR>
map <F4> :Unite file bookmark -vertical -winwidth=40 -no-quit <cr>

map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
map <silent> <F5> :call Run_cur_script()<Cr>
function! Run_cur_script() "{{{
    if expand("%") != ""
        w!
        if exists("b:current_syntax")   "don't need the & prefix
            if has("unix")
            let chrome_exe = "google-chrome"
                if b:current_syntax=="python"
                    execute "!python -d % 2>&1 | tee .tmp"

                elseif b:current_syntax=="vim"
                    execute "so %"
                elseif b:current_syntax=="html"
                    \|| b:current_syntax=="xhtml"
                    execute "!".chrome_exe.' "'."%:p".'"'
                elseif b:current_syntax=="sh"
                    execute "!gnome-terminal -e ./%"
                elseif
                    execute "silent !"."%"
                endif
            endif

            if has("win32")

                if b:current_syntax=="python"
                    execute "!python2.6 %"


                elseif b:current_syntax=="vim"
                    execute "so %"
                elseif b:current_syntax=="html"
                    \|| b:current_syntax=="xhtml"
                    execute "!".chrome_exe.' "'."%:p".'"'
                endif
            endif
        endif
    else
        echo "Running but Not a file."
        return 0
    endif
endf "}}}
"map <silent> <c-F5> :execute "split .tmp"<Cr>
"run current line
map <s-F5> :call Exe_line()<cr>
func! Exe_line()
    if has('win32')
       exe "!start cmd ".getline('.')
    else
       exe "!gnome-terminal -x ".getline('.')
    endif
endfun

map <silent><c-F5> :call Vim_line()<cr>
func! Vim_line()
       exe getline('.')
       echo getline('.')
endfun

map <F6> :TagbarToggle<CR>

map <F7> :!gnome-open <cfile><cr>

map <silent> <F8> :call Start_File_explore()<cr>
fun! Start_File_explore()
    if expand("%:p:h") != ""
        if has("win32")
            !start explorer.ex
        else
            !nautilus '%:p:h'
        endif
    endif
endf

map <c-F8> :call Start_terminal()<CR>
fun! Start_terminal()
    if has("win32")
    !start cmd '%'
    else
    !gnome-teminal -x '%'
    endif
endf

map <F9> :set spell!<CR>
    \<bar>:echo "Spell check: ".strpart("OFFON", 3 * &spell, 3)<CR>

map <F10> :set wrap! wrap?<CR>

nmap <F12> :call SaveSession()<CR>
nmap <s-F12> :1,$bd <bar> so ~/.vim/sessions/
set sessionoptions=buffers,curdir,help,tabpages,winsize,resize
function! SaveSession()
  wall
    let ses = strftime("%y-%m-%d_%H:%M")
    try
        exe "mksession! "."~/.vim/sessions/".ses
        echomsg "mks success! session file : ".ses
    catch /^Vim\%((\a\+)\)\=:/
        echoe "mks failure! error: " .v:exception
    endtry
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4.1.Leader_Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
let mapleader = " "
let maplocalleader = "\\"

nnoremap ; :

cmap w!! w !sudo tee % >/dev/null

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>sc :%s/\s\+$//<CR>:let @/=''<CR>

";st reloading of the .vimrc
map <leader>vr :so ~/.vimrc<cr>
map <leader>vR :so ~/.vimrc<cr>
map <leader>rr :so ~/.vimrc<cr>
map <leader>RR :so ~/.vimrc<cr>

"Fast editing of .vimrc
map <silent><leader>vv :call Split_if("") \| e ~/.vimrc<cr>
map <silent><leader>VV :call Split_if("") \| e ~/.vimrc<cr>

map <leader>vc :call Split_if("") \| e ~/.vim/colors/$colorscheme_n.vim<cr>
map <leader>VC :call Split_if("") \| e ~/.vim/colors/$colorscheme_n.vim<cr>

map <leader>vs :call Split_if("") \| exec "VimShell" <cr>
map <leader>VS :call Split_if("") \| exec "VimShell" <cr>

map <leader>vf :call Split_if("") \| exe "VimFiler" <cr><esc>
map <leader>VF :call Split_if("") \| exe "VimFiler" <cr><esc>


map <Leader>tt :call Split_if("") \| e /home/meofi/Documents/vimwiki/Todo/TodoToday.vwk<cr>

map <Leader>tn :call Split_if("t")<cr>


"diff mapping
map <silent> <leader>df :call Toggle_diff()<cr>
map <silent> <leader>DF :call Toggle_diff()<cr>
"can't use it in the map due to some weird reason.
fun! Toggle_diff()
    if &diff
        diffoff
        set foldmethod=marker
        set foldcolumn=1
        echo "diffmode Off"
    else
        diffthis
        echohl WarningMsg | echo "diffmode On" | echohl None
    endif
endfun
set diffopt=filler,vertical,foldcolumn:1
map <silent> <leader>do :DiffOrig<cr>
command! DiffOrig win 140 100 | vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


"fold with space
nnoremap <silent> <leader><leader> @=(foldlevel('.')?'za':'j')<CR>
"vnoremap <leader><leader> zf
nnoremap <leader>2 za
vnoremap <leader>2 za
nnoremap <leader>3 zR
vnoremap <leader>3 zR
nnoremap <leader>4 zM
vnoremap <leader>4 zM
map <silent><leader>ff :if &foldmethod == 'marker'  <Bar>
            \ set foldmethod=indent   <Bar>
            \ echo "set fdm=indent" <bar>
            \ else  <Bar>
            \ set foldmethod=marker  <Bar>
            \ echo "set fdm=marker" <BAR>
            \ endif <cr>



"window mapping
"fast delete buf
nmap <c-w><c-e> :bd!<cr>:bp<cr>
nmap <c-w>1 <c-w>_
nmap <c-w>2 <c-w>=
nmap <c-w>3 z0<cr>
nmap <c-w><c-v> :win 140 100 \| vs <cr>
nmap <c-w><c-q> :win 80 100 \| q <cr>
nnoremap <leader>q :q<CR>


match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

"formatting
" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap
"7.3 v and C-Q with relative number toggle
"noremap <C-Q>  <esc>:set rnu<cr> <C-Q>
"vnoremap <C-Q> <C-Q> <esc>:set nu<cr>
"noremap v :set rnu<cr><esc>v
"vnoremap v v<esc>:set nu<cr>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>


"make vim list
nnoremap <leader>l1 :s/^\(\s*\)[*#-]\s/\1* /&e\|nohl<cr>
nnoremap <leader>l2 :s/^\(\s*\)[*#-]\s/\1# /&e\|nohl<cr>
nnoremap <leader>l3 :s/^\(\s*\)[*#-]\s/\1- /&e\|nohl<cr>>>


" }}}
" Nop mapping
nmap s <Nop>
nmap S <Nop>

noremap <silent> <m-a> <home>
noremap <silent> <m-z> <end>
noremap <silent> <m-k> <up>
noremap <silent> <m-j> <down>
noremap <silent> <m-h> <left>
noremap <silent> <m-l> <right>
noremap <silent> <m-w> w
noremap <silent> <m-b> b

inoremap <silent> <m-w> <c-right>
inoremap <silent> <m-b> <c-left>
inoremap <silent> <m-j> <down>
inoremap <silent> <m-k> <up>
inoremap <silent> <m-h> <left>
inoremap <silent> <m-l> <right>
inoremap <silent> <m-a> <Home>
inoremap <silent> <m-z> <end>
"cmd line moving
cnoremap <m-a> <Home>
cnoremap <m-z> <end>
cnoremap <m-l> <Right>
cnoremap <m-h> <left>
cnoremap <m-w> <c-right>
cnoremap <m-b> <c-left>
cnoremap <m-j> <up>
cnoremap <m-k> <down>



"mouse hotkey
"map <M-Leftmouse> <Plug>Vimwikifollowword
"map <M-RightMouse> <Plug>VimwikiGoBackWord
map <expr> <rightmouse><leftmouse> &ft=="vimwiki" ? "<Plug>VimwikiGoBackLink" :
            \ "\<esc><c-o>"
imap <expr> <rightmouse><leftmouse> &ft=="vimwiki" ? "<Plug>VimwikiGoBackLink" :
            \ "\<c-o><c-o>"
map <expr> <m-Home> &ft=="vimwiki" ? "<Plug>VimwikiGoBackLink" :
            \ "\<esc><c-o>"
imap <expr> <m-Home> &ft=="vimwiki" ? "<Plug>VimwikiGoBackLink" :
            \ "\<c-o><c-o>"

"inoremap <expr> <2-leftmouse> "\<c-o><c-i>"
"noremap <expr> <2-leftmouse> "\<c-i>"

inoremap <expr> <m-End> "\<c-o><c-i>"
noremap <expr> <m-End> "\<c-i>"


"将当前行以下转换为文本
map <M-r><M-r> <ESC>gqap

"段落后添加空行
map <M-r><M-q> <ESC>:.,$s/\([。！？”—）]\)$/\1\r/g<cr>

"quick format current sentence
map <M-r><M-f> <ESC>gqap

"imap <silent> <buffer> . .<C-X><C-O>

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>`11 :set ft=vim<cr>
map <leader>`12 :set ft=vimwiki<cr>
map <leader>`13 :set ft=sh<cr>
map <leader>`14 :set ft=ini<cr>

map <leader>`21 :set ft=html.php<cr>
map <leader>`22 :set ft=css<cr>
map <leader>`23 :set ft=javascript<cr>
map <leader>`24 :set ft=php.html<cr>

map <leader>`31 :set ft=cpp<cr>
map <leader>`32 :set ft=python<cr>

map <leader>`` :filetype detect \| syntax enable<cr>

nnoremap <silent> <leader>11 :nohl<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"4.2.win_behave_settings (yank and pasting)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <c-d> "+x
vmap <C-X> "+x  " often no cut contentat all
vmap <C-m-X> "+x  " often no cut contentat all
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <c-v>       "+gp
map <S-Insert>		"+gp
imap <C-V>              "+gp
imap <S-Insert>		"+gp
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
vnoremap <C-Z> <esc>

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

nmap <c-s> :update<cr>
imap <c-s> <esc>:update<cr>a

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nmap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"4.3.Input_And_Moving
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Word Capitalize Hotkeys
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g<cr>\.

" Capitalize inner word
map <M-c> guiw~w
" UPPERCASE inner word
map <M-u> gUiww
" lowercase inner word
map <M-l> guiww
" just one space on the line, preserving indent
"nmap <Up>   gk
nmap k      gk
"vmap <Up>   gk
vmap k      gk
"nmap <Down> gj
nmap j      gj
"vmap <Down> gj
vmap j      gj

vnoremap > >gv
vnoremap < <gv

map <c-Tab> gt
map <C-S-Tab> gT

nnoremap <Leader>"" ciw"<C-r>""<ESC>
vnoremap <Leader>"" c"<C-r>""<ESC>
nnoremap <Leader>'' ciw'<C-r>"'<ESC>
vnoremap <Leader>'' c'<C-r>"'<ESC>
nnoremap <Leader>99 ciw(<C-r>")<ESC>
vnoremap <Leader>99 c(<C-r>")<ESC>`[
nnoremap <Leader><< ciw<<C-r>"><ESC>
vnoremap <Leader><< c<<C-r>"><ESC>`[
nnoremap <Leader>>> ciw<<C-r>"><ESC>
vnoremap <Leader>>> c<<C-r>"><ESC>`[
nnoremap <Leader>1` ciw`<C-r>"`<ESC>
vnoremap <Leader>1` c`<C-r>"`<ESC>`[
nnoremap <Leader>88 ciw*<C-r>"*<ESC>
vnoremap <Leader>88 c*<C-r>"*<ESC>`[
nnoremap <Leader>-- ciw_<C-r>"_<ESC>
vnoremap <Leader>-- c_<C-r>"_<ESC>`[


nnoremap <Leader>[[ ciw[[<C-r>"]]<ESC>
vnoremap <Leader>[[ c[[<C-r>"]]<ESC>`[
nnoremap <Leader>{{ ciw{{<C-r>"}}<ESC>
vnoremap <Leader>{{ c{{<C-r>"}}<ESC>`[

nnoremap <Leader>{} ciW{{{<C-r>"}}}<ESC>
vnoremap <Leader>{} c{{{<C-r>"}}}<ESC>`[
nnoremap <Leader>[] ciW[[<C-r>"]]<ESC>
vnoremap <Leader>[] c[[<C-r>"]]<ESC>`[

nnoremap <leader><b ciw<b><C-r>"</b><ESC>
vnoremap <Leader><b c<b><C-r>"</b><ESC>`[
nnoremap <leader><a ciw<a href="" ><C-r>"</a><ESC>
vnoremap <Leader><a c<a href="" ><C-r>"</a><ESC>`[


set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
"set listchars=tab:\|-,trail:-,extends:>,precedes:<
map <Leader>li :set list! list?<CR>
map <leader>nn :set nu! nu?<cr>
map <leader>nn :set nu! nu?<cr>
map <leader>nr :set rnu! rnu?<cr>

no <silent><m-1> :if &go=~#'m'\|se go-=m\|else\|se go+=m\|endif<CR>
no <silent><m-2> :if &go=~#'r'\|se go-=r\|else\|se go+=r\|endif<CR>


"keymapping of gtd
map<silent> <Leader>ttd :Tinytodo<cr>
command! -nargs=* Tinytodo call Tinytodo()<args>
fun! Tinytodo()
    if expand('%') != ""
      exec '!gvim "+winp 1400 150" "+win 36 20"
         \"+se fdc=0" "+se stl="
         \"/home/meofi/Documents/vimwiki/Todo/TodoTiny.vwk"'
    else
      exec "winp 1400 150 \| win 36 20 \| se fdc=0 stl="
      exec "e /home/meofi/Documents/vimwiki/Todo/TodoTiny.vwk"
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""
"5.Plugins_And_Key_Mapping
""""""""""""""""""""""""""""""""""""""""""

map <leader>aa :CalendarH<cr>

noremap <leader>ww :Unite file bookmark<cr>
noremap <m-w><m-w> :Unite file bookmark<cr>
noremap <m-w><m-b> :Unite buffer<cr>
noremap <m-w><m-r> :Unite file_mru directory_mru<cr>
noremap <m-w><m-t> :Unite tab window<cr>
noremap <m-w><m-e> :Unite register<cr>
noremap <m-w><m-s> :Unite source<cr>
noremap <m-w><m-i> :Unite session<cr>
noremap <m-w><m-c> :Unite colorscheme<cr>
aug vimrc_Unite
autocmd FileType unite call s:unite_my_settings()
aug END

function! s:unite_my_settings() "{{{
" Overwrite settings.
nmap <buffer> <ESC>      <Plug>(unite_exit)
imap <buffer> jj      <Plug>(unite_insert_leave)
nmap <buffer><expr><silent> <2-leftmouse>   unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
nmap <buffer><expr><silent> <c-e>   unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
nmap <buffer> <CR>      <Plug>(unite_do_default_action)
" Start insert.
"let g:unite_enable_start_insert = 1
endfunction "}}}


let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''


let g:unite_source_file_mru_time_format="(%m-%d %H:%M)"
let g:unite_source_directory_mru_time_format="(%m-%d %H:%M)"
let g:unite_enable_split_vertically=0
"let g:unite_winwidth=30
"let g:unite_winheight=15

"let g:unite_session_path="~/.vim_sessions/"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_auto_delimiter = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
imap <c-j>     <Plug>(neocomplcache_snippets_jump)
smap <c-j>     <Plug>(neocomplcache_snippets_jump)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
    inoremap <expr><cr> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Enable omni completion.
aug omni_compl
    au!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
aug END

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

inoremap <expr><TAB> pumvisible() ? "\<c-n>" : <SID>check_back_space() ?
            \ "\<TAB>" : "\<C-x>\<c-u><c-p><c-n>"

inoremap <expr><s-TAB> pumvisible() ? "\<c-p>" : <SID>check_back_space() ?
            \ "\<s-TAB>" : "\<C-x>\<c-u><c-p><c-n>"
function! s:check_back_space()"{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}


let g:neocomplcache_text_mode_filetypes = {"vimwiki":1,"vim":1}

let g:vimshell_prompt = $USER."> "


"zencoding
let g:user_zen_leader_key = '<c-e>'
"let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
  \    'indentation' : '    '
  \}

let g:user_zen_expandabbr_key = '<c-e>e'    "e
let g:user_zen_expandword_key = '<C-E>E'    "e
    "'user_zen_balancetaginward_key'        "d
    "'user_zen_balancetagoutward_key'       "D
let g:user_zen_next_key='<c-e>n'            "n
let g:user_zen_prev_key='<c-e>p'            "p
    "'user_zen_imagesize_key'               "i
    "'user_zen_togglecomment_key'           "/
    "'user_zen_splitjointag_key'            "j
    "'user_zen_removetag_key'               "k
    "'user_zen_anchorizeurl_key'            "a
    "'user_zen_anchorizesummary_key'        "A

"NERD Commenter"
map CC <leader>c<space>
map cc <leader>c<space>


"vimwiki Hotkeys
map <leader>er <Plug>VimwikiToggleListItem
map <leader>da <Plug>VimwikiTabMakeDiaryNote
map <leader>gl <Plug>VimwikiGenerateLinks
map <m-backspace> <Plug>VimwikiGoBackLink
map <Leader>wrwr <Plug>VimwikiRenameLink
"map <Leader>ww <Plug>VimwikiIndex

 let wiki_1 = {}
    let wiki_1.path = '~/Documents/vimwiki'
    let wiki_1.ext = '.vwk'
    let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp','sh':'sh'}

let g:vimwiki_list = [wiki_1]
let g:vimwiki_use_mouse =1
let g:vimwiki_menu = ""
let g:vimwiki_global_ext= 0
let g:vimwiki_browsers=['google-chrome']
let g:vimwiki_dir_link=''
"let g:vimwiki_html_header_numbering = 2
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,php,zip,rar,7z,html,gz
                        \,py,css,sh'
let g:vimwiki_fold_lists=1
let g:vimwiki_folding=1

" the checkbox list
let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'

"对NERD_commenter的设置
let NERDShutUp=1

"""""""""""""""""""""""""""""""""""""""""""""""""
"6.Function_And_Key_Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""

"check current file to decide if split or not
fun! Split_if(str)
    if expand('%')!=""
        if a:str =="v"
            exe "win 140 100"
            exe "vsplit"
        elseif a:str=="t"
            exe "tabnew"
        else
            exe "split"
        endif
    endif
endfun


" Check no more than 30 lines from start for 'Last Change:' and update it with
" the current datetime.
function! LastChangeUpdate() "{{{
  for linenr in range(1, min([30, line('$')]))
    let line = getline(linenr)
    if line =~ 'Last Change:'
      let line = substitute(line, 'Last Change:.*$',
                  \ 'Last Change: '.strftime("%Y-%m-%d %H:%M"), '')
      call setline(linenr, line)
      break
    endif
  endfor
endfunction "}}}
command! -nargs=* LastChangeUpdate call LastChangeUpdate() <args>


 "{{{set Prio of vimwiki todo-item
nmap <leader>33 :call Set_Prio_begin(3)<cr>
nmap <leader>55 :call Set_Prio_begin(5)<cr>
nmap <leader>pp :call Ask_Prio_begin()<cr>
nmap <leader>bb :call Ask_Prio_begin()<cr>
"let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
"let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'
fun! Check_Valid()
    let line = getline('.')
    let rx_bul_item = g:vimwiki_rxListBullet
    let rx_num_list = g:vimwiki_rxListNumber
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'
    if line !~ rx_lst_item
        echomsg "Error:It's not a list item"
        return 0
    else
        return 1
    endif

endfun
fun! Set_Prio_begin(val)
    if !Check_Valid()
        return
    endif
    let line = getline('.')
    let rx_Prio = '\s\[\*\d\]\s'
    let rx_bul_item = g:vimwiki_rxListBullet
    let rx_num_list = g:vimwiki_rxListNumber
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'
    let rx_CheckBox = '\[.\?\]'
    let rx_list = rx_lst_item.'\('.rx_CheckBox.'\s\)\='
    " the Prio val == -1 ,then delete Prio Sign
    if a:val == -1
        let line = substitute(line,rx_Prio," ","")
        call setline('.', line)
        return
    endif
    let v = "[*".a:val."]"
    "if line !~
    if line !~ rx_Prio
        let m = substitute(line,rx_list,"&".v." ","")
        "echoe "yes".m
        call setline('.', m)
    else
        let m = substitute(line,'\[\*\d\]',v,"")
        "let line = substitute(line,rx_Prio,"","")
        call setline('.', m)
        "call setline('.', line." [*".a:val."]")
        "return  line." [*".a:val."]"
    endif
endfun
fun! Set_Prio(val)
    if !Check_Valid()
        return
    endif
    let line = getline('.')
    let rx_Prio = '\s\[\*\d\]\s*$'
    if a:val == -1
        let line = substitute(line,rx_Prio," ","")
        call setline('.', line)
        return
    endif
    if line !~ rx_Prio
        call setline('.', line." [*".a:val."]")
    else
        let line = substitute(line,rx_Prio,"","")
        call setline('.', line." [*".a:val."]")
        "return  line." [*".a:val."]"
    endif
endf

fun! Ask_Prio()
    if Check_Valid()
        let val = input("Input Priority Number(0~9,-1 to delete):")
        while val > 9 || val < -1 || val !~ '\d'
            let val = input("Invalid input.
                        \ Input Priority Number(0~9 ,-1 to delete):)")
        endwhile
        call Set_Prio(float2nr(str2nr(val)))
    endif
endfun
fun! Ask_Prio_begin()
    if Check_Valid()
        let val = input("Input Priority Number(0~9,-1 to delete):")
        while val > 9 || val < -1 || val !~ '\d'
            let val = input("Invalid input.
                        \ Input Priority Number(0~9 ,-1 to delete):)")
        endwhile
        call Set_Prio_begin(float2nr(str2nr(val)))
    endif
endfun
"}}} end of set Prio


"{{{auto list item
inoremap <expr> <C-CR>  "\<CR>".AutoListItem(line('.'))
noremap <silent><m-n>  :call Sub_num('.')<cr>
inoremap <expr> <C-Kenter>  "\<CR>".AutoListItem(line('.'))
noremap <m-F12>  :call Prev_list_item(line('.'))<cr>
func! AutoListItem(lnum)
      let lnum=a:lnum
      let line=getline(a:lnum)
      if line !~ '^\s*\%(\d\+\.\)\+\s'
          if Prev_list_item(lnum)
              let line=getline(Prev_list_item(lnum))
          else
              return ""
          endif
      endif
      "let lastnum=substitute(lastline,'^\s*\(\d\+\.\)\+\s.*$','\1','')
      let end_num=matchstr(line,'\d\+\.\s')
      "let all_num=substitute(lastline,'^\s*\(\(\d\+\.\)\+\)\s.*$','\1','')
      let all_num=matchstr(line,'\(\d\+\.\)\+')
      "let plus_num=str2nr(substitute(lastnum,'\(\d\+\)\.','\1',''))+1
      let plus_num=str2nr(matchstr(end_num,'\d\+'))+1
      let plus_line=substitute(all_num,'\d\+\.$',plus_num.'.','')
      return plus_line." "
 endfunc

function! Prev_list_item(lnum) "{{{
  let c_lnum = a:lnum - 1
  while c_lnum >= 1
    let line = getline(c_lnum)
    if line =~ '^\s*\%(\d\+\.\)\+\s.*'
      return c_lnum
    endif
    if line =~ '^\s*$'
      return 0
    endif
    let c_lnum -= 1
  endwhile
  return 0
endfunction
fun! Sub_num(range)
    let lnum=line(a:range)
    let line=getline(lnum)
    " check if current line number exist
    " else if prev item -> get prev item
    " get the whole num and last num
    " if last num = 1.  return " can not add to a new sub"
    " let prev num = whole num -last num + (last num -1)
    " let  new num = prev_num + 1.
    " return new num
endfun

"}}}
"}}}

"{{{
map <leader>ae :call Auto_TimeStamp('.','long')<cr>
map <leader>dt :call Del_TimeStamp('.')<cr>
map <leader>db :call Del_TodoBox('.')<cr>
map <silent> <leader>ee <plug>VimwikiToggleListItem
            \:call Toggle_TimeStamp_CBD('.')<cr>

fun! Toggle_CDB_Timestamp()
endfun
fun! Del_TimeStamp(range)
    let lnum=line(a:range)
    let line = getline(lnum)
    let rx_longstamp = '<\d\d-\d\d-\d\d \d\d:\d\d>'
    let rx_shortstamp='<\d\d\d\d-\d\d\d\d>'
    let rx_timestamp='\('.rx_longstamp.'\|'.rx_shortstamp.'\)'
    let newline = substitute(line,rx_timestamp.'\s','','')
    call setline(lnum,newline)
endfun

fun! Del_TodoBox(range)
    let lnum=line(a:range)
    let line = getline(lnum)
    let rx_CheckBox = '\[.\?\]'
    let newline = substitute(line,rx_CheckBox.'\s','','')
    call setline(lnum,newline)
endfun

"fun! Toggle_TimeStamp_with_CheckBox_Done(range)
fun! Toggle_TimeStamp_CBD(range)
    let lnum=line(a:range)
    let rx_CheckBox_Done = '\[X\]'
    let line = getline(lnum)
    if line =~ rx_CheckBox_Done
        "echoe "yes"
        call Auto_TimeStamp(a:range,"short")
    else
        "echoe "no"
        call Del_TimeStamp(a:range)
    endif
endfun
fun! Auto_TimeStamp(range,type)
    let rx_bul_item = '^\s*\%(\*\|-\|#\)\s'
    let rx_num_list = '^\s*\%(\d\+\.\)\+\s'
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'

    let rx_CheckBox = '\[.\?\]'
    let rx_Prio = '\[\*\d\]'
    let rx_longstamp = '<\d\d-\d\d-\d\d \d\d:\d\d>'
    let rx_shortstamp='<\d\d\d\d-\d\d\d\d>'

    let rx_timestamp='\('.rx_longstamp.'\|'.rx_shortstamp.'\)'
    "let rx_utf_timestamp='!\(\w\|\.\)'
    " !0-9a-zA-Z_. : <11-04-11 17:20> -> !b4bgj
    " C-Q U :  <11-04-11 17:20> -> printf("%x",1104111720) -> ������

    let rx_list_no_timestamp = rx_lst_item.'\('.rx_CheckBox.'\s\)\?'.'\('.rx_Prio.'\s\)\?'
    let rx_list_timestamp = rx_list_no_timestamp.rx_timestamp


    let lnum=line(a:range)
    let line = getline(lnum)
    if a:type =="short"
        let cur_timestamp = '<'.strftime("%m%d-%H%M").'>'
    else 
        let cur_timestamp = '<'.strftime("%y-%m-%d %H:%M").'>'
    endif

    if line =~ rx_list_timestamp
        let newline = substitute(line,rx_timestamp,cur_timestamp,'')
    else
        if line !~ rx_list_no_timestamp
            return 0
        endif
        let newline = substitute(line,rx_list_no_timestamp,
                    \'&'.cur_timestamp.' ','')
    endif
    call setline(lnum,newline)
endfun
"}}}


command! -nargs=* -complete=file Ack call Ack(<q-args>)
function! Ack(args)
  let grepprg_bak=&grepprg
  set grepprg=ack-grep\ -a\ -H\ --nocolor\ --nogroup
  execute "silent! grep " . a:args
  botright copen
  let &grepprg=grepprg_bak
endfunction

" <space>ao move current buffer into a new tab.
nnoremap <silent> <leader>to :<C-u>call <SID>move_window_into_tab_page(0)<Cr>
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}



"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> [ ConditionalPairMap('[', ']')
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
