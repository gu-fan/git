" vim:tw=0 et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8 fdls=0:
"""""""""""""""""""""""""""""""""""""""""""""""""
"Index (Use # to go around )
"1.General_Settings
"  1.1.fonts_color_and_folding
"  1.2.Misc_Settings
"2.AutoCmd_Group
"3.Commands_And_Abbreviations
"4.Key_Mapping_General
"  4.1.Leader_Mapping
"  4.2.Window_control_mapping
"  4.3.moving_mapping
"  4.4.win_behave_settings
"  4.5.edit_and_format 
"5.Plugins_And_Key_Mapping
"6.Function_And_Key_Mapping
"  6.1.vimwiki_works
"7.Other_Stuffs
"
"By: Rykka10(at)gmail.com
"Last Change: 2011-04-23 22:15
"
" "Tough time Goes , Tough People Stay. "
"
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.General_Settings
"""""""""""""""""""""""""""""""""""""""""""""""""

"load all bundles
call pathogen#runtime_append_all_bundles()


"Basic setting"{{{
set nocompatible
syntax on
filetype plugin indent on

"history
"the browse window's directory
set browsedir=buffer
set history=20 
" Tell vim to remember certain things when we exit
set viminfo='100,\"30,:30,s10,%
"Set to auto read when a file is changed from the outside
set autoread
set autowriteall
"}}}

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

"default:"filnxtToO"
"A No Swap exist warning message
set shortmess+=As
"set shortmess-=O
set visualbell
set t_vb=
"set confirm                 " Y-N-C prompt if closing with unsaved changes.
set noconfirm
"set report=0                " : commands always print changed line count.

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

"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.1.fonts_color_and_folding
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ guifont and color
if has("gui_running")
    if has ("win32")
        set guifont=Courier_New:h13:cANSI
        "set gfw=Yahei_Mono:h12:cGB2312
    endif
        if has("gui_gtk2")
            set guifont=DejaVu\ Sans\ Mono\ 13,Fixed\ 13
            set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13
    endif

endif

"call after colorscheme and sourcecmd "{{{
fun! Norm_hack()
"molokai hack and add
if g:colors_name=="molokai"
    hi Normal          guifg=#d8d8d2 guibg=#111111
    hi NonText         guifg=#AAAAAA guibg=#111111

    hi StatusLine      guifg=#808070 guibg=#080808
    hi StatusLineNC    guifg=#404040 guibg=#080808
    hi VertSplit       guifg=#080808 guibg=#404040 gui=bold

    hi tabline         guifg=#808070 guibg=#111111
    hi tablinesel      guifg=#111111 guibg=#808070 gui=bold
    hi tablinefill     guifg=#111111 guibg=#111111

    hi SignColumn      guifg=#904040 guibg=#080808
    hi FoldColumn      guifg=#555555 guibg=#111111
    hi Folded          guifg=#665447 guibg=#000000
    hi colorcolumn     guibg=#666666
    
    hi title           guifg=#883838 
    hi search          guibg=#111111 guifg=#999999 gui=underline
    hi incsearch       guibg=#111111 guifg=#999999 gui=underline
endif
endfun "}}}

"guicolor
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " Always show file types in menu
    let do_syntax_sel_menu=1
    "let $colorscheme_n="desert"
    let $colorscheme_n="molokai"
    colorscheme $colorscheme_n
    call Norm_hack()
else
    let $colorscheme_n="desert"
    colorscheme $colorscheme_n
endif

"set statusline=%<[%2*%n%*\>%P:%l,%c]%f\%=[%1*%M%R%*%W%Y,%{&enc}][%oB,%bA]
set statusline=[%03l,%02c,%P]%<%F\%=[%1*%M%R%*%W%Y,%{&enc},%{&ff}][%oB,%bb]
"set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)
  "hi StatusLine      guifg=#808070 guibg=#080808
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red guifg=red guibg=#111111 gui=bold,underline
hi User1 ctermfg=red guibg=#111111 guifg=red gui=bold,underline
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

"folding "{{{
set foldenable
set foldmethod=marker
set foldcolumn=1
set foldlevel=2
set foldlevelstart=1
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
set foldminlines=1
"set foldclose=all

" I want foldmarkers to be applied with space before a comment.
nnoremap <silent> zf :set opfunc=MyFoldMarker<CR>g@
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

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.2.Misc_Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{"Misc Editing Options
"use space to perform tab
set expandtab tabstop=8  smarttab
set softtabstop=4 shiftwidth=4
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
"set mouse=a
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
"set completeopt=menu,preview
set completeopt+=preview
"the c-x c-f file name completing  remove the "="
set isfname-==
"set iskeyword+=-
"set iskeyword+=.
"set iskeyword+=#
set pumheight=10             " Keep a small completion window
" backup
if !isdirectory(expand('~/.vim_backups'))
  call mkdir(expand('~/.vim_backups'))
endif
set backup
set backupdir=~/.vim_backups/
set directory=~/.vim_backups/,.

"set showfulltag             " Show more information while completing tags.
"set cscopetag               " When using :tag, <C-]>, or "vim -t", try cscope:
"set cscopetagorder=0        " try ":cscope find g foo" and then ":tselect foo"

""}}}

"VIM73 "{{{
if v:version >= 703
    set colorcolumn=70

    if !isdirectory(expand('~/.vim_undo'))
      call mkdir(expand('~/.vim_undo'))
    endif
    set undofile
    set undodir=~/.vim_undo/


    " always SHOW conceal text
    set conceallevel=3

    " conceal text in the cursor line in the modes
    " n Normal v Visual i Insert c Command
    set concealcursor=ncv
    "syntax match Entity "\[" conceal cchar=[
    "syntax match Entity "\]" conceal cchar=]
    hi Conceal guifg=fg guibg=black
endif "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 2.AutoCmd_Group
"""""""""""""""""""""""""""""""""""""""""""""""""
aug vimrc_GuiEnter "{{{
    au! vimrc_GuiEnter
    au GUIENTER * cd ~/Documents/vim
    "au GUIENTER * e ~/Documents/vimwiki/Todo/TodoToday.vwk
    "au GUIENTER *.vwk set filetype=vimwiki
    "au GUIEnter * VimwikiIndex
    au GuiEnter * set t_vb=
    au GUIENTER * winpos 501 0
    au Guienter * winsize 80 100
aug END

aug vimrc_Buffer
    au! vimrc_Buffer

    "will cause conflict with help files
    "au BufRead,BufNewFile *.txt set filetype=vimwiki

    au BufEnter * silent! lcd %:p:h:gs/ /\\ /
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
    au BufRead,BufNewFile *.vim,.vimrc set filetype=vim
    "au BufReadPost,BufNewFile *.vwk filetype detect
    "au BufRead,BufNewFile *.vwk syntax enable
    "au BufRead,BufNewFile *.vwk source $MYVIMRC
    "auto go to last position when open file
aug END "}}}

aug vimrc_edit "{{{
    au! vimrc_edit
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    autocmd! bufwritepost $colorscheme_n source ~/.vimrc
aug END "}}}

aug Filetypes "{{{
    au! Filetypes
    "au FileType text,vimwiki setlocal tw=76
    "endif
aug END "}}}

aug htmls "{{{
    au! htmls
    " Autoclose tags on html, xml, etc
    au FileType php,html,xhtml,xml imap <buffer> <C-m-b> </<C-X><C-O>
    au Filetype php,html,xhtml,xml set shiftwidth=2 softtabstop=2
    au Filetype php,html,xhtml,xml set foldmethod=indent
aug END "}}}

aug vimrc_auto_mkdir  " {{{
  autocmd! vimrc_auto_mkdir
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  "
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  "
augroup END  " }}}

aug some_color "{{{
au! some_color
"au! FileType vimwiki call filetype detect
au! FileType vimwiki call Vimwiki_color()
"au! Guienter,winenter *.vwk filetype detect
"au! Guienter,winenter *.vwk call Vimwiki_color()

"au! SourceCmd,bufwritepost *.vimrc filetype detect
"au! SourceCmd,bufwritepost *.vimrc syntax enable
"au! SourceCmd,bufwritepost *.vimrc call Norm_hack()
"au! colorscheme * call Norm_hack()
aug END

fun! Vimwiki_color() "{{{
hi VimwikiHeader1 guifg=#D0D090 gui=bold
hi VimwikiHeader2 guifg=#9BC97E gui=bold
hi VimwikiHeader3 guifg=#4FB16F gui=bold
hi VimwikiHeader4 guifg=#4E83AE gui=bold
hi VimwikiHeader5 guifg=#8889BA gui=bold
hi VimwikiHeader6 guifg=#A365B7 gui=bold

syn match VimwikishortTimeStamp /<\d\d\d\d-\d\d\d\d>/
syn match VimwikiminTimeStamp /\d\d\d\d_\d\d\d\d/
syn match VimwikiTimeStamp /<\d\d\d\d-\d\d\d\d>/
hi def link VimwikishortTimeStamp VimwikiTimeStamp
hi def link VimwikiminTimeStamp VimwikiTimeStamp
hi def link VimwikiTimeStamp SpecialComment
hi VimwikiTimeStamp guifg=#777777 guibg=#111111 gui=bold

let rxListBullet = '^\s*\zs\%(\*\|-\|#\)\ze\s'
"let rxListNumber = '^\s*\zs\%(\d\+[\.)]\)\+\s'
execute 'syntax match VimwikiList /'.rxListBullet.'/'
"execute 'syntax match VimwikiList /'.rxListNumber.'/'
syn match vimwiki_rx_list_num /^\s*\%(\d\+\.\)\+\ze\s/
"hi vimwiki_rx_list guifg=#8c8 gui=bold
hi VimwikiLIst guifg=#bb9 
hi default link vimwiki_rx_list_num VimwikiLIst

"syn match Vimwiki_Prio9 /\[\*9\]/
"syn match Vimwiki_Prio8 /\[\*8\]/
"syn match Vimwiki_Prio7 /\[\*7\]/
"syn match Vimwiki_Prio6 /\[\*6\]/
"syn match Vimwiki_Prio5 /\[\*5\]/
"syn match Vimwiki_Prio4 /\[\*4\]/
"syn match Vimwiki_Prio3 /\[\*3\]/
"syn match Vimwiki_Prio2 /\[\*2\]/
"syn match Vimwiki_Prio1 /\[\*1\]/
"syn match Vimwiki_Prio0 /.*\[\*0\].*/

syn match Vimwiki_Prio9 /\[+9\]/
syn match Vimwiki_Prio8 /\[+8\]/
syn match Vimwiki_Prio7 /\[+7\]/
syn match Vimwiki_Prio6 /\[+6\]/
syn match Vimwiki_Prio5 /\[+5\]/
syn match Vimwiki_Prio4 /\[+4\]/
syn match Vimwiki_Prio3 /\[+3\]/
syn match Vimwiki_Prio2 /\[+2\]/
syn match Vimwiki_Prio1 /\[+1\]/
syn match Vimwiki_Prio0 /.*\[+0\].*/

"can't match because the list item used all the \s 
"so use \@<= instead
"syn match Vimwiki_Prio9 /\s\zs=+9\ze\s/

syn match Vimwiki_Prio9 /\s\@<=+9\s/
syn match Vimwiki_Prio8 /\s\@<=+8\s/ 
syn match Vimwiki_Prio7 /\s\@<=+7\s/ 
syn match Vimwiki_Prio6 /\s\@<=+6\s/ 
syn match Vimwiki_Prio5 /\s\@<=+5\s/ 
syn match Vimwiki_Prio4 /\s\@<=+4\s/ 
syn match Vimwiki_Prio3 /\s\@<=+3\s/ 
syn match Vimwiki_Prio2 /\s\@<=+2\s/ 
syn match Vimwiki_Prio1 /\s\@<=+1\s/ 
syn match Vimwiki_Prio0 /.*\s+0\s.*/

syn match Vimwiki_minus9 /\s\@<=-9\s/
syn match Vimwiki_minus8 /\s\@<=-8\s/
syn match Vimwiki_minus7 /\s\@<=-7\s/
syn match Vimwiki_minus6 /\s\@<=-6\s/
syn match Vimwiki_minus5 /\s\@<=-5\s/
syn match Vimwiki_minus4 /\s\@<=-4\s/
syn match Vimwiki_minus3 /\s\@<=-3\s/
syn match Vimwiki_minus2 /\s\@<=-2\s/
syn match Vimwiki_minus1 /\s\@<=-1\s/
syn match Vimwiki_minus0 /.*\s-0\s.*/

syn match Vimwiki_minus9 /\[-9\]/
syn match Vimwiki_minus8 /\[-8\]/
syn match Vimwiki_minus7 /\[-7\]/
syn match Vimwiki_minus6 /\[-6\]/
syn match Vimwiki_minus5 /\[-5\]/
syn match Vimwiki_minus4 /\[-4\]/
syn match Vimwiki_minus3 /\[-3\]/
syn match Vimwiki_minus2 /\[-2\]/
syn match Vimwiki_minus1 /\[-1\]/
syn match Vimwiki_minus0 /.*\[-0\].*/

hi Vimwiki_Prio9 guifg=#BF4040 gui=bold
hi Vimwiki_Prio8 guifg=#BF6040 gui=bold
hi Vimwiki_Prio7 guifg=#BF8040 gui=bold
hi Vimwiki_Prio6 guifg=#BF9F40 gui=bold
hi Vimwiki_Prio5 guifg=#BFBF40 gui=bold
hi Vimwiki_Prio4 guifg=#9FBF40 gui=bold
hi Vimwiki_Prio3 guifg=#80BF40 gui=bold
hi Vimwiki_Prio2 guifg=#60BF40 gui=bold
hi Vimwiki_Prio1 guifg=#40BF40 gui=bold
hi Vimwiki_Prio0 guifg=#404040 gui=bold

hi Vimwiki_minus0 guifg=#404060 gui=bold
hi Vimwiki_minus1 guifg=#40BF9F gui=bold
hi Vimwiki_minus2 guifg=#40BFBF gui=bold
hi Vimwiki_minus3 guifg=#409FBF gui=bold
hi Vimwiki_minus4 guifg=#4080BF gui=bold
hi Vimwiki_minus5 guifg=#4060BF gui=bold
hi Vimwiki_minus6 guifg=#4040BF gui=bold
hi Vimwiki_minus7 guifg=#6040BF gui=bold
hi Vimwiki_minus8 guifg=#8040BF gui=bold
hi Vimwiki_minus9 guifg=#9F40BF gui=bold
endfun "}}}

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 3.Commands_And_Abbreviations (editing mapping)
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{help items
"command! -nargs=* Htag helptags $VIMRUNTIME/doc <args>
command! -nargs=* Htag call pathogen#helptags() <args>
command! -nargs=* Papp call pathogen#runtime_append_all_bundles(<args>) <args>

cabbrev H h
set keywordprg=":help"
"}}}

"{{{ insert abbrevation
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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 4_Key_Mapping_General
"""""""""""""""""""""""""""""""""""""""""""""""""
" F1-F12 "{{{
map <F1> :call Split_if("")<cr><Plug>VimwikiIndex
map <c-F1> :Vimwiki2HTML<cr>
map <c-m-F1> :VimwikiAll2HTML<cr>
map <s-F1> :VimwikiGenerateLinks<CR>

map <F2> :Ack <C-R><C-W>
" replace word under cursor
nmap <s-F2> :%s/<C-R><C-W>//gc<Left><Left><Left>
" replace selection 
vnoremap <s-F2> "sy<esc><c-l>:%s/<c-r>s//g<Left><Left>
"vnoremap <C-C> "+y

map <silent> <F3> :Unite buffer<CR>
noremap <F4> :NERDTreeToggle "expand('%:p:h')"<cr>
"map <F4> :NERDTreeToggle<CR>
"map <F4> :Unite file bookmark -vertical -winwidth=40 -no-quit <cr>

"command! -nargs=0 CHMOD call pathogen#helptags() <args>ommand 
command! -nargs=0 CHMOD !chmod 777 %
nnoremap <silent> <F5> :call Exe_cur_script("file","norm")<Cr>
vnoremap <silent> <F5> :call Exe_cur_script("visual","norm")<Cr>
nnoremap <silent> <c-F5> :call Exe_cur_script("file","sudo")<Cr>
vnoremap <silent> <c-F5> :call Exe_cur_script("visual","sudo")<Cr>
nnoremap <silent> <s-F5> :call Exe_cur_script("line","norm")<Cr>
nnoremap <silent> <c-s-F5> :call Exe_cur_script("line","sudo")<Cr>
function! Exe_cur_script(range,priv) "{{{
    if expand("%") != ""
        "w!
        if !exists("b:current_syntax")   "don't need the & prefix
            echom "current file  % can not be executed"
            return 0
        endif

        let syn=b:current_syntax
        let browser = "google-chrome"
        "let pri=""
        "let rng=getline('.')
        if a:range=="file"
            let rng=expand('%:p')
        elsei a:range=="line"
            let rng=getline('.')
        elsei a:range=="visual"
            let firstLine = line("'<")
            let lastLine = line("'>")
            let rng_list=getline(firstLine,lastLine)
            let rng=getline('.')
            for item in rng_list
                let rng .= item." && "
            endfo
        endif

        if a:priv=="sudo"
            let pri="sudo "
        elseif a:priv=="norm"
            let pri=""
        endif

        if syn=="python"
            exec "!".pri."python -d ".rng." 2>&1 | tee /tmp/.runtmp"
            "exec "!".pri."python -d ".rng." 2 3 4 5"
        elsei syn=~'^\(vim\|vba\)$'
            if a:range=="file"
                exec "so ".expand('%:p')
            elseif a:range=="line"
                exec getline('.')
            endif
        elsei syn=~'html'
            exec "!".browser.' "'.rng.'"'
        elsei syn =~'^\(sh\|expect\|bash\)$'
            if has("unix")
                "exec "!".pri."gnome-terminal -e "."'".pri."sh -c ".rng."'"
                if a:range=="file"
                    exec "!".pri."gnome-terminal -e "."'".pri."bash ".rng."'"
                else 
                    "exec "!".pri."gnome-terminal -e "."'".pri."sh -c ".rng."'"
                    exec "!".pri."gnome-terminal -x ".rng
                endif
            elseif has("win32") || has("win64")
                exec "!".pri."cmd -e".rng
            endif
        elsei
            exec "!".pri.rng
        endif

    endif
endf "}}}
"map <silent> <c-F5> :execute "split .tmp"<Cr>
"run current line

map <F6> :TagbarToggle<CR>


map <F7> :!gnome-open <cfile><cr>

map <silent> <F8> :call Start_File_explore()<cr>
fun! Start_File_explore()
    if expand("%:p:h") != ""
        if has("win32")
            exec "!start explorer '%:p:h'"
        else
            exec "!nautilus '%:p:h'"
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

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 4.1.Leader_Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
"mapleader "{{{
let mapleader = " "
let maplocalleader = ","
"let maplocalleader = "\\"

nnoremap ; :
noremap q: <nop>

" Nop mapping
nmap s <Nop>
nmap S <Nop>

command! -nargs=0 WSU exec "w !sudo tee % "
command! -nargs=0 GSU exec "!gksu gvim % "
"}}}

"Fast editing of .vimrc and other plugin"{{{
map <silent><leader>vv :call Split_if("") \| e ~/.vimrc<cr>
map <silent><leader>VV :call Split_if("") \| e ~/.vimrc<cr>
map <silent><leader>vb :call Split_if("") \| e ~/.bashrc<cr>
map <silent><leader>VB :call Split_if("") \| e ~/.bashrc<cr>

map <silent><leader>ww :call Split_if("") \| VimwikiIndex<cr>
map <silent><leader>WW :call Split_if("") \| VimwikiIndex<cr>

map <leader>vc :call Split_if("") \| e ~/.vim/colors/$colorscheme_n.vim<cr>
map <leader>VC :call Split_if("") \| e ~/.vim/colors/$colorscheme_n.vim<cr>

map <leader>vs :call Split_if("") \| exec "VimShell" <cr>
map <leader>VS :call Split_if("") \| exec "VimShell" <cr>

map <leader>vf :call Split_if("") \| exe "VimFiler" <cr><esc>
map <leader>VF :call Split_if("") \| exe "VimFiler" <cr><esc>


map <Leader>tt :call Split_if("") \| e ~/Documents/vimwiki/Todo/TodoToday.vwk<cr>

map <Leader>tn :call Split_if("t")<cr>

"reloading of the .vimrc
map <leader>vr :so ~/.vimrc<cr>
map <leader>vR :so ~/.vimrc<cr>
map <leader>rr :so ~/.vimrc<cr>
map <leader>RR :so ~/.vimrc<cr>
"check current file to decide if split or not
fun! Split_if(str)
    if expand('%')!=""
        if a:str =="v"
            exe "win 159 100"
            exe "vsplit"
        elseif a:str=="t"
            exe "tabnew"
        else
            exe "split"
        endif
    endif
endfun
"}}}

"diff mapping "{{{
map <silent> <leader>dd :call Toggle_diff()<cr>
map <silent> <leader>DD :call Toggle_diff()<cr>
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
command! DiffOrig win 151 100 | vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

"}}}

"folding "{{{
"noremap <silent> <leader> zA
nnoremap <silent> <leader><leader> @=(foldlevel('.')?'za':'')<CR>
nnoremap <silent> <leader>zz @=(&foldlevel?'zM':'zR')<cr>
nnoremap <silent> <leader>zz @=(&foldlevel?'zM':'zR')<cr>
nnoremap <silent> <leader>aa @=(&foldlevel?'zM':'zR')<cr>
nnoremap <silent> <leader>AA @=(&foldlevel?'zM':'zR')<cr>
nnoremap f za
nnoremap F zA
"vnoremap <leader><leader> zf
map <silent><leader>ff :if &foldmethod == 'marker'  <bar>
            \ set foldmethod=indent   <bar>
            \ echo "set fdm=indent" <bar>
            \ elseif &foldmethod=='indent'   <bar>
            \ set foldmethod=syntax  <bar>
            \ echo "set fdm=syntax" <bar>
            \ elseif &foldmethod=='syntax'   <bar>
            \ set foldmethod=expr  <bar>
            \ echo "set fdm=expr" <bar>
            \ elseif &foldmethod=='expr'   <bar>
            \ set foldmethod=marker  <bar>
            \ echo "set fdm=marker" <bar>
            \ endif <cr>
"}}}

"misc option toggle "{{{
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
"set listchars=tab:\|-,trail:-,extends:>,precedes:<
map <Leader>li :set list! list?<CR>
map <leader>nn :set nu! nu?<cr>
map <leader>nn :set nu! nu?<cr>
map <leader>nr :set rnu! rnu?<cr>

no <silent><m-1> :if &go=~#'m'\|se go-=m\|else\|se go+=m\|endif<CR>
no <silent><m-2> :if &go=~#'r'\|se go-=r\|else\|se go+=r\|endif<CR>


"keymapping of gtd
map<silent> <Leader>ttd :TinyTodo<cr>
command! -nargs=* TinyTodo call TinyTodo()<args>
fun! TinyTodo()
    if expand('%') != ""
      exec '!gvim "+winp 1400 150" "+win 37 25"
         \"+se fdc=0" "+se stl=" "+se nosc"
         \"~/Documents/vimwiki/Todo/TodoTiny.vwk"'
    else
      exec "winp 1400 150 \| win 37 25 \| se nosc fdc=0 stl= "
      exec "e ~/Documents/vimwiki/Todo/TodoTiny.vwk"
  endif
endfun "}}}

"syntax "{{{
"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
nmap <leader>112 :set ft=vim<cr>
nmap <leader>113 :set ft=vimwiki<cr>
nmap <leader>114 :set ft=sh<cr>

nmap <leader>121 :set ft=html.php<cr>
nmap <leader>122 :set ft=css<cr>
nmap <leader>123 :set ft=javascript<cr>
nmap <leader>124 :set ft=php.html<cr>

nmap <leader>131 :set ft=cpp<cr>
nmap <leader>132 :set ft=python<cr>


nmap <leader>11 :filetype detect \| syntax enable \| so $MYVIMRC<cr>
nmap <leader>`` :filetype detect \| syntax enable \| so $MYVIMRC<cr>

nnoremap <silent> <leader>1 :nohl<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 4.2.Window_control_mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
"window mapping "{{{
"fast delete buf
nmap <c-w>1 <c-w>_
nmap <c-w><c-a> <c-w>_
nmap <c-w>2 <c-w>=
nmap <c-w><c-e> <c-w>=
"nmap <c-w><c-w> <c-w>=<c-w>w
nmap <c-w><c-w> <c-w>w
nmap <c-w>3 z0<cr>
nmap <c-w><c-z> z0<cr>
nmap <c-w><c-w> <c-w>w
"}}}

"window width(columns) configure"{{{
nmap <silent> <c-w><c-v> :call Check_winnr(0,159)\|vne<cr>
nmap <silent> <c-w><c-h> :call Check_winnr(2,159)<cr><c-w>H
nmap <silent> <c-w><c-l> :call Check_winnr(2,159)<cr><c-w>L

"nmap <silent> <c-w><c-s> :call Check_winnr(-1,75)\|new<cr>
nmap <silent> <c-w><c-s> :sp<cr>
nmap <silent> <c-w><c-j> :call Check_winnr(-2,78)<cr><c-w>J
nmap <silent> <c-w><c-k> :call Check_winnr(-2,78)<cr><c-w>K

nmap <silent> <c-w><c-q> :call Check_winnr(-2,78)\|q<cr>
nmap <silent> <leader>q  :call Check_winnr(-2,78)\|q<cr>

nmap <silent> <c-w><c-t> :call Check_winnr(-2,78)<cr><c-w>T

fun! Check_winnr(num,col)
    " check the plus and minus sign
    " if plus, set to >=
    " if minus, set to <=
    if a:num>0
        " if winnr>= num set column
        if winnr("$")>=a:num
            if &co!=a:col
                let &co=a:col
            endif
        endif
    elseif a:num<0
        " if winnr<= abs(num) set column
        if winnr("$")<=abs(a:num)
            if &co!=a:col
                let &co=a:col
            endif
        end
    elseif a:num==0
        " set column anyway
    	if &co!=a:col
            let &co=a:col
        endif
    endif
endfun "}}}


"""""""""""""""""""""""""""""""""""""""""""""""""
" 4.3.moving_mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
" <m-x> moving "{{{
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

"}}}

"quick and easy moving  "{{{
" just one space on the line, preserving indent
"nmap <Up>   gk
nmap k      gk
"vmap <Up>   gk
vmap k      gk
"nmap <Down> gj
nmap j      gj
"vmap <Down> gj
vmap j      gj


"quick move to last selection
nmap `w `<
nmap `e `>
"move to last insert position
nmap `i `^
"last change postion
nmap `c `.

"jump to the match item
nmap <leader>go %
nmap <leader>gg %

map <c-Tab> gt
map <C-S-Tab> gT

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 4.4.win_behave_settings (yank and pasting)
"""""""""""""""""""""""""""""""""""""""""""""""""
"win behave "{{{
"{{{ behave win and menu 
if has('gui_running')
    behave mswin
    source $VIMRUNTIME/mswin.vim
endif "}}}

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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 4.5.edit_and_format
"""""""""""""""""""""""""""""""""""""""""""""""""
" easy editing "{{{
" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nmap Y y$

""Word Capitalize Hotkeys
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g<cr>\.
" Capitalize inner word
nmap <M-c> guiw~w
" UPPERCASE inner word
nmap <M-u> gUiww
" lowercase inner word
nmap <M-l> guiww

nnoremap <leader>sc :%s/\s\+$//<CR>:let @/=''<CR>


vnoremap > >gv
vnoremap < <gv

nnoremap <leader>31 yyPVr=jyypVr=
nnoremap <leader>32 yyPVr*jyypVr*
nnoremap <leader>33 yypVr=
nnoremap <leader>34 yypVr-
nnoremap <leader>35 yypVr^
nnoremap <leader>36 yypVr"
nnoremap __ "zyy"zp<c-v>$r-
nnoremap ++ "zyy"zp<c-v>$r=
"}}}

"quick wrapping "{{{
"
nnoremap <leader>vl ^v$

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
vnoremap <Leader><a c<a href="" ><C-r>"</a><ESC>`[ "}}}

"formating "{{{
" Quick alignment of text 
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>


"make vim list
nnoremap <leader>l1 :s/^\(\s*\)[*#-]\s/\1* /&e\|nohl<cr>
nnoremap <leader>l2 :s/^\(\s*\)[*#-]\s/\1# /&e\|nohl<cr>
nnoremap <leader>l3 :s/^\(\s*\)[*#-]\s/\1- /&e\|nohl<cr>>>

"formatting
" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

"将当前行以下转换为文本
map <M-r><M-r> <ESC>gqap

"段落后添加空行
map <M-r><M-q> <ESC>:.,$s/\([。！？”—）]\)$/\1\r/g<cr>

"quick format current sentence
map <M-r><M-f> <ESC>gqap 

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""
"5.Plugins_And_Key_Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>al :CalendarH<cr>

"let g:vimshell_prompt = $USER."> "
let g:NERDTreeChDirMode=2
"noremap <m-w><m-w> :NERDTreeToggle "expand('%:p:h')"<cr>
"unite settins "{{{
"noremap <leader>ww :Unite file bookmark<cr> 
noremap <m-w><m-w> :Unite tab window<cr>
noremap <m-w><m-f> :Unite file bookmark<cr>
noremap <m-w><m-b> :Unite buffer<cr>
noremap <m-w><m-r> :Unite file_mru directory_mru<cr>
noremap <m-w><m-e> :Unite register<cr>
noremap <m-w><m-s> :Unite source<cr>
noremap <m-w><m-i> :Unite session<cr>
noremap <m-w><m-c> :Unite colorscheme<cr>

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

aug vimrc_Unite "{{{
  au! vimrc_Unite
autocmd FileType unite call s:unite_my_settings()
aug END

function! s:unite_my_settings() 
" Overwrite settings.
nmap <buffer> <ESC>                         <Plug>(unite_exit)
imap <buffer> jj                            <Plug>(unite_insert_leave)
nmap <buffer><expr><silent> <2-leftmouse>   unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
nmap <buffer><expr><silent> <c-e>           unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
nmap <buffer> <CR>                          <Plug>(unite_do_default_action)
" Start insert.
"let g:unite_enable_start_insert = 1
endfunction "}}}

"}}}

"neocomplcache settings "{{{
map <leader>nt :NeoComplCacheToggle<cr>
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


inoremap <expr><TAB> pumvisible() ? "\<c-n>" : <SID>check_back_space() ?
            \ "\<TAB>" : "\<C-x>\<c-u><c-p><c-n>"

inoremap <expr><s-TAB> pumvisible() ? "\<c-p>" : <SID>check_back_space() ?
            \ "\<s-TAB>" : "\<C-x>\<c-u><c-p><c-n>"
function! s:check_back_space()
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction

let g:neocomplcache_text_mode_filetypes = {"vimwiki":1,"vim":1}

aug omni_compl
  au! omni_compl
    " Enable omni completion.
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

"}}}

"zencoding settings "{{{ "{{{
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
"}}} "}}}

"NERD Commenter" "{{{
map CC <leader>c<space>
map cc <leader>c<space>
let NERDShutUp=1
"}}}

"vimwiki settings "{{{

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
let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,zip,rar,7z,gz
                        \,py,sh
                        \,js,css,html,php
                        \,vim,vba'

let g:vimwiki_conceallevel=3

function! MyVimwikiFoldText() "{{{
  let line = substitute(getline(v:foldstart), '\t', 
        \ repeat(' ', &tabstop), 'g')
  let line = strpart(line,0,19)
  if strlen(line) <19
      let line .= repeat(" ",19-strlen(line))
  endif
  "echom v:foldstart
  "let sum = 0
  "echom "begin:".v:foldstart." end:".v:foldend
  let lnum=v:foldstart+1 "igonre the firstline
  let total_range = v:foldend-v:foldstart
  let white_lines=0
  let sum = 0
  let u_sum=0  "unchecked_sum ,the checked item count as 0
    while lnum <= v:foldend 
    let _line=getline(lnum)
    if _line=~ '\s[+-]\d\s'
        "\%(\) doesn't use count as sub 
        let rx_bul_item = '^\s*\%(\*\|-\|#\)'
        let rx_num_list = '^\s*\%(\d\+[\.)]\)\+'
        let rx_lst_item = '\%('. rx_bul_item . '\|' . rx_num_list . '\)'
        let rx_checkbox = '\[.\?\]'
        let rx_list = rx_lst_item.'\%(\s*'.rx_checkbox.'\)\='.'\s*'
        let _num = str2nr(substitute(_line,rx_list.'\([+-]\d\)\s.*$','\1',''))
        "let _num = str2nr(substitute(_line,'\s*\([+-]\d\)\s.*','\1',''))
        "if _line =~ '\s\[X\]\s' 
            "let _uncheck = 0
        "else 
            "let _uncheck = _num
        "endif 
       let _uncheck= (_line=~'\s\[X\]\s') ? 0 : _num
    else 
        if _line =~ '^\s*$' |  let white_lines +=1 |  endif
        let _num =0
        let _uncheck = 0
    endif
    " exclude the white line
    "let white_lines += (_line=~'^\s*$')?1:0
    let sum += _num
    let u_sum+=_uncheck
    let lnum += 1
    endwhile 


    let range = total_range - white_lines
    if strlen(range)<4 |let range=repeat(" ",4-strlen(range)).range  | endif
    if strlen(sum)<4   |let sum = repeat(" ",4-strlen(sum)).sum      | endif
    if strlen(u_sum)<4 |let u_sum = repeat(" ",4-strlen(u_sum)).u_sum| endif

    return line.'|A'.range.'|S'.sum."|U".u_sum."|"
endfunction "}}}

let g:vimwiki_fold_lists=0
let g:vimwiki_folding=0

aug vimwiki_myset "{{{
au! vimwiki_myset
"au winenter,bufenter,BufRead,bufNew *.vwk setlocal foldtext=MyVimwikiFoldText()
"au FileType vimwiki setlocal foldtext=MyVimwikiFoldText()
autocmd FileType vimwiki call s:vimwiki_my_settings()
aug END

"function! MyFoldText() "{{{
  "let line = substitute(getline(v:foldstart), '\t', 
        "\ repeat(' ', &tabstop), 'g')
  "let lnum=v:foldstart
  "let sum = 0
  "echo v:foldstart
  "while lnum <= v:foldend
      ""let _line = getline(lnum)
      "let _num = substitute(getline(lnum),'*\s\([+-]\d\)\s*','\1','')
      "let sum +=str2nr(_num)
      "lnum=lnum+1
  "endwhile
  "return line.' ['.(v:foldend - v:foldstart).']'.'[sum:'.sum.']'
"endfunction "}}}

"setlocal fdm=expr
"setlocal foldexpr=VimwikiFoldLevel(v:lnum)
"setlocal foldtext=MyFoldText()

fun! s:vimwiki_my_settings()

setlocal fdm=expr
setlocal foldexpr=VimwikiFoldLevel(v:lnum)
setlocal foldtext=MyVimwikiFoldText()
    "will cause internal error with \zs duplicated
    "let g:vimwiki_rxListNumber = '^\s*\zs\%(\d\+[\.)]\)\+\ze\s'
    let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
    let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'
    if g:vimwiki_hl_cb_checked
    execute 'syntax match VimwikiCheckBoxDone /'.
            \ g:vimwiki_rxListBullet.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
            \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    execute 'syntax match VimwikiCheckBoxDone /'.
            \ g:vimwiki_rxListNumber.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
            \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    endif

    map <buffer><leader>er <Plug>VimwikiToggleListItem
    map <buffer><leader>da <Plug>VimwikiTabMakeDiaryNote
    map <buffer><leader>gl <Plug>VimwikiGenerateLinks
    map <buffer><m-backspace> <Plug>VimwikiGoBackLink
    map <Leader>wr <Plug>VimwikiRenameLink
    "map <Leader>wd <Plug>VimwikiDeleteLink

    "nnoremap <silent><buffer> <2-LeftMouse> :VimwikiFollowLink<CR>k
    nnoremap <silent><buffer> <S-2-LeftMouse> <LeftMouse>:VimwikiSplitLink<CR>
    nnoremap <silent><buffer> <C-2-LeftMouse> <LeftMouse>:VimwikiVSplitLink<CR>
    "map <M-RightMouse> <Plug>VimwikiGoBackWord
    map <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    imap <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    map <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    imap <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    inoremap <buffer><expr> <m-End> "\<c-o><c-i>"
    noremap <buffer><expr> <m-End> "\<c-i>"
    "nmap <silent><buffer> <TAB> <Plug>VimwikiNextLink
    inoremap <expr> <buffer> <Tab> vimwiki_tbl#kbd_tab()
    
    
inoremap <expr><TAB> pumvisible() ? "\<c-n>" : <SID>check_back_space() ?
            \ "\<TAB>" : "\<C-x>\<c-u><c-p><c-n>"
    "tab with 2 space
    "sts sw
    set shiftwidth=2 softtabstop=2
endfun

"normal buffer mapping
inoremap <expr> <rightmouse><leftmouse> "\<c-o><c-i>"
noremap <expr> <rightmouse><leftmouse> "\<c-o>"
inoremap <expr> <m-Home> "\<c-o><c-o>"
noremap <expr> <m-Home> "\<c-o>"
inoremap <expr> <m-End> "\<c-o><c-i>"
noremap <expr> <m-End> "\<c-i>"
"}}}

"}}}

"map <silent><2-LeftMouse> :if &ft!="vimwiki" \|  exe "tag ". expand("<cword>")  \|  else \| VimwikiFollowLink \| endif <cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""
"6.Function_And_Key_Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
"LastUpdate check "{{{
" Check no more than 30 lines from start for 'Last Change:' and update it with
" the current datetime.
function! LastChangeUpdate() 
    for linenr in range(1, min([30, line('$')]))
        let line = getline(linenr)
        if line =~ 'Last Change:'
        let line = substitute(line, 'Last Change:.*$',
                    \ 'Last Change: '.strftime("%Y-%m-%d %H:%M"), '')
        call setline(linenr, line)
        break
        endif
    endfor
endfunction 
command! -nargs=* LastChangeUpdate call LastChangeUpdate() <args>
"}}}

"ACK "{{{
command! -nargs=* -complete=file Ack call Ack(<q-args>)
function! Ack(args)
  let grepprg_bak=&grepprg
  set grepprg=ack-grep\ -a\ -H\ --nocolor\ --nogroup
  execute "silent! grep " . a:args
  botright copen
  let &grepprg=grepprg_bak
endfunction
"}}}

"{{{ # * visual search
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
endfun "}}}

"{{{ ConditionalPairMap
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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" 6.1.vimwiki_works
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{set Prio of vimwiki todo-item
nmap <leader>33 :call Ask_Prio("begin","min")<cr>
nmap <leader>ss :call Ask_Prio("begin","min")<cr>
nmap <leader>pp :call Ask_Prio("begin","min")<cr>
nmap <leader>bb :call Ask_Prio("begin","min")<cr>
nmap <leader>st :%s/\[\*/[+/<cr>
nmap <leader>sp :%s/\[+\(\d\)\]/+\1/<cr>
nmap <leader>si :%s/\[-\(\d\)\]/-\1/<cr>
nmap <leader>sm :%s/<\(\d\d\d\d\)-\(\d\d\d\d\)>/\1_\2/<cr>
"nmap <leader>bb :call Ask_Prio()<cr>
"let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
"let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'
fun! Check_Valid()
    let line = getline('.')
    let rx_bul_item = g:vimwiki_rxListBullet
    let rx_num_list = g:vimwiki_rxListNumber
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'
    if line !~ rx_lst_item
        echoe "Error: Can not set a none-list-line."
        return 0
    else
        return 1
    endif

endfun
map <leader>55 :call Set_Prio(5,"begin","min")<cr>
map <leader>50 :call Set_Prio(10,"begin","min")<cr>

fun! Set_Prio(val,...) "{{{
    if !Check_Valid()
        return
    endif
    let line = getline('.')
    "let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
    "let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'
    let rx_bul_item = '^\s*\%(\*\|-\|#\)'
    let rx_num_list = '^\s*\%(\d\+[\.)]\)\+'
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'
    let rx_CheckBox = '\[.\?\]'
    let rx_list = rx_lst_item.'\(\s*'.rx_CheckBox.'\)\='.'\ze\s*'

    let rx_Prio_normal = '\[[+-]\d\]'
    let rx_Prio_min = '[+-]\d'
    let rx_Prio = '\s\('.rx_Prio_normal.'\|'.rx_Prio_min.'\)\s'

    if a:0 >1 && a:2 == "min"
    	if a:val>=0
            let v= "+".a:val
        else 
            let v= a:val
        endif
    else 
    	if a:val<0
            let v="[".a:val."]"
        else
            let v = "[+".a:val."]"
        endif
    endif 

    if a:val == 10
        let m = substitute(line,rx_Prio," ","")
        call setline('.', m)
        return
    endif

    if a:0 && a:1=="begin"
        if line !~ rx_Prio
            let m = substitute(line,rx_list,"& ".v."","")
        else
            let m = substitute(line,rx_Prio," ".v." ","")
        endif
    else
        if line !~ rx_Prio
            let m = line." ".v." "
        else
            let m = substitute(line,rx_Prio,v." ","")
        endif
    endif 

    call setline('.',m)
    
endf "}}}

map <leader>53 :call Ask_Prio("begin","min")<cr>
fun! Ask_Prio(...)
    if Check_Valid()
            "if has("gui_running")
            let val = input("Set Priority Number,can use '`' as '-' 
                        \\n(-9~9 ,10 to delete):")
            while val > 10 || val <= -10 || val !~ '^[`-]\=\d\+$' 
            	if val ==''
            	    echom "Nothing changed ,exit with null input."
            	    return 
                endif

                echohl errormsg
                echomsg "Invalid input."
                echohl normal

                let val = input("Set Priority Number,can use '`' as '-' 
                            \\n(-9~9 ,10 to delete):")
            endwhile
        "else 
            "let val = inputdialog("Set Priority Number\n(0~9,-1 to delete):")
            "while val > 9 || val < -1 || val !~ '\d' 
                    "if val ==''
                  "return 
                "endif
                "let val = inputdialog("Invalid input.
                            "\ Input Priority Number\n(0~9 ,-1 to delete):)")
            "endwhile
        "endif
        let val = substitute(val,'`','-','')
        if a:0 && a:1 == "begin"
            if a:0 >1 && a:2 =="min"
                call Set_Prio(float2nr(str2nr(val)),"begin","min")
            else
                call Set_Prio(float2nr(str2nr(val)),"begin")
            endif
        else
            call Set_Prio(float2nr(str2nr(val)))
        endif
    endif
endfun
"fun! Ask_Prio_begin()
    "if Check_Valid()
        "let val = input("Input Priority Number(0~9,-1 to delete):")
        "while val > 9 || val < -1 || val !~ '\d'
            "let val = input("Invalid input.
                        "\ Input Priority Number(0~9 ,-1 to delete):)")
        "endwhile
        "call Set_Prio_begin(float2nr(str2nr(val)))
    "endif
"endfun
"}}} end of set Prio

"{{{Auto List Item with number sequence
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

"Auto Timestamp "{{{
map <leader>ae :call Auto_TimeStamp('.','long')<cr>
map <leader>dt :call Del_TimeStamp('.')<cr>
map <leader>db :call Del_TodoBox('.')<cr>
map <silent> <leader>ec <plug>VimwikiToggleListItem
            \:call Toggle_TimeStamp_CBD('.')<cr>

map <silent><leader>ee :call Toggle_checkbox_Timestamp()<cr>

fun! Toggle_checkbox_Timestamp()
    let line = getline('.')
    if line =~ '\s\[X\]\s'
    	let checkbox_state = 2
    elseif line =~ '\s\[.\]\s'
        let checkbox_state = 1
    else 
    	let checkbox_state = 0
    endif 
    "echo checkbox_state."state"
    if checkbox_state==0
            exec "VimwikiToggleListItem"
        "call Toggle_TimeStamp_CBD('.')
        "call Auto_TimeStamp('.',"short")
    elseif checkbox_state==1
        exec "VimwikiToggleListItem"
        call Auto_TimeStamp('.',"min")
    elseif checkbox_state==2
        call Del_TimeStamp('.')
        call Del_TodoBox('.')
    endif
endfun
fun! Del_TimeStamp(range)
    let lnum=line(a:range)
    let line = getline(lnum)
    let rx_longstamp = '<\d\d-\d\d-\d\d \d\d:\d\d>'
    let rx_shortstamp='<\d\d\d\d-\d\d\d\d>'
    let rx_minstamp='\d\d\d\d_\d\d\d\d'
    let rx_minstamp2='#\d\d\d\d\d\d\d\d'
    let rx_timestamp='\('.rx_longstamp.'\|'.rx_shortstamp.'\|'.rx_minstamp.'\)'
    let newline = substitute(line,rx_timestamp.'\s','','')
    call setline(lnum,newline)
endfun

fun! Del_TodoBox(range)
    let lnum=line(a:range)
    let line = getline(lnum)
    let rx_CheckBox = '\[.\]'
    let newline = substitute(line,rx_CheckBox.'\s','','')
    call setline(lnum,newline)
endfun

"fun! Toggle_TimeStamp_with_CheckBox_Done(range)
fun! Toggle_TimeStamp_CBD(range)
    let lnum=line(a:range)
    let rx_CheckBox_Done = '\[X\]'
    let line = getline(lnum)
    if line =~ rx_CheckBox_Done
        call Auto_TimeStamp(a:range,"min")
    else
        call Del_TimeStamp(a:range)
        "call Del_TodoBox(a:range)
    endif
endfun
fun! Auto_TimeStamp(range,type)
    let rx_bul_item = '^\s*\%(\*\|-\|#\)\s'
    let rx_num_list = '^\s*\%(\d\+\.\)\+\s'
    let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'

    let rx_CheckBox = '\[.\?\]'

    let rx_Prio_normal = '\[[+-]\d\]'
    let rx_Prio_min = '[+-]\d'
    let rx_Prio = '\('. rx_Prio_normal . '\|' . rx_Prio_min . '\)'

    let rx_longstamp = '<\d\d-\d\d-\d\d \d\d:\d\d>'
    let rx_shortstamp='<\d\d\d\d-\d\d\d\d>'
    let rx_minstamp='\d\d\d\d_\d\d\d\d'
    let rx_timestamp='\('.rx_longstamp.'\|'.rx_shortstamp.'\|'.rx_minstamp.'\)'
    "let rx_utf_timestamp='!\(\w\|\.\)'
    " !0-9a-zA-Z_. : <11-04-11 17:20> -> !b4bgj
    " C-Q U :  <11-04-11 17:20> -> printf("%x",1104111720) -> ������

    let rx_list_no_timestamp = rx_lst_item.'\('.rx_CheckBox.'\s\)\?'.'\('.rx_Prio.'\s\)\?'
    let rx_list_timestamp = rx_list_no_timestamp.rx_timestamp


    let lnum=line(a:range)
    let line = getline(lnum)
    if a:type =="short"
        let cur_timestamp = '<'.strftime("%m%d-%H%M").'>'
    elseif a:type=="min"
        let cur_timestamp = strftime("%m%d_%H%M")
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
"
"command! -nargs=* -complete=file Ack call Ack(<q-args>)
command! -nargs=1  RXM call RX_match_test("<args>")
function! RX_match_test(arg)
    "echoe matchstr(getline('.'),escape(a:arg,'\'))
    echoe matchstr(getline('.'),a:arg)
endfun
