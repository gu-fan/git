" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8 fdls=0 :
"""""""""""""""""""""""""""""""""""""""""""""""""
"Vimrc Setting Index "{{{
"1.General_Settings
"  1.1.guifonts_color_and_term
"  1.2.Misc_Settings
"2.AutoCmd_Group
"3.Commands_And_Abbreviations
"4.Key_Mapping_General
"  4.1.Leader_Mapping
"  4.2.Window_control_mapping
"  4.3.move_around_mapping
"  4.4.Edit_and_formatting
"  4.5.win_behave_settings
"5.Plugins_settings
"6.Function_And_Key_Mapping
"  6.1.vimwiki_works
"7.Other_Stuffs "}}}
"  By: Rykka10(at)gmail.com
"  Last Change: 2011-04-27 23:01
" "Tough time Goes , Tough People Stay. "
"""""""""""""""""""""""""""""""""""""""""""""""""

" 1.General_Settings{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
"Bundle 'lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/calendar-vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
"testing
Bundle 'wincent/Command-T'
Bundle 'sjl/gundo.vim'
Bundle 'hrp/EnhancedCommentify'
Bundle 'tomtom/checksyntax_vim'
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'
Bundle 'tpope/vim-surround'
"{{{
"Bundle 'MarcWeber/snipmate.vim'
"Install dependencies:
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
"Install:
Bundle "git://github.com/garbas/snipmate.vim.git"
"}}}
"Bundle 'rykka/colorizer'
Bundle 'lilydjwg/csspretty.vim'
"" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"Bundle 'vimwiki'

Bundle 'jQuery'

Bundle 'css_color.vim'
Bundle 'matchit.zip'

"colorscheme
Bundle 'molokai'
Bundle 'pyte'
"Bundle 'proton'
"Bundle 'twilight'
"Bundle 'phd'
"Bundle 'nelstrom/vim-mac-classic-theme.git'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'git@github.com:gmarik/ingretu.git'

"" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"}}}
"load all bundles
call pathogen#runtime_append_all_bundles()
"Basic Setting"{{{
set nocompatible
syntax on
filetype plugin indent on

"history
"the browse window's directory
set browsedir=buffer
set history=255
" Tell vim to remember certain things when we exit
set viminfo='100,\"30,:30,s10,%
"Set to auto read when a file is changed from the outside
set autoread
set autowrite
"}}}
"{{{multi_byte
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set fileencoding=utf8
set fileencodings=utf8,gb18030,cp936
set termencoding=utf-8
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
set laststatus=2
set splitbelow splitright
set winminwidth=0 winminheight=0
" minimal screen line that always visible while working

set scrolloff=3
set scrolljump=1

"Do not redraw, when running macros.. lazyredraw
set nolz
set display=lastline "show dialog not completely
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

set showtabline=1
set tabpagemax=15

" Set cmd-mode
set cmdheight=1
set showcmd " show current key in cmd line
if has('wildmenu')
set wildchar=<Tab> wildmenu wildmode=full
    set wildignore=*.o,*.obj,*.bak,*.exe,*.swp
    set cpoptions-=<  "compatible-options"
    set wildcharm=<C-Z> "wildchar inside macro"
endif
if has('arabic')
  set noarabicshape
endif

" }}}
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

" 1.1.guifonts_color_and_term
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ Guifont And Color
if has("gui_running")
    if has ("win32")
        set guifont=Courier_New:h13:cANSI
        "set gfw=Yahei_Mono:h12:cGB2312
    endif
        if has("gui_gtk2")
            set guifont=Monospace\ 12,Fixed\ 12
            set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 12,WenQuanYi\ Zen\ Hei\ 12
    endif

endif
"Call After Colorscheme And Sourcecmd "{{{
fun! Color_Modify()
    "all
    hi search          gui=underline
    hi incsearch       gui=underline
    "hi comment          gui=italic
    if g:colors_name=="molokai" "{{{
        hi Normal          guifg=#b8b8b2 guibg=#111111
        hi NonText         guifg=#AAAAAA guibg=#111111

        hi StatusLine      guifg=#808070 guibg=#080808
        hi StatusLineNC    guifg=#404040 guibg=#080808
        hi VertSplit       guifg=#080808 guibg=#404040 gui=bold

        hi tabline         guifg=#808070 guibg=#111111
        hi tablinesel      guifg=#111111 guibg=#888870 gui=bold,underline
        hi tablinefill     guifg=#111111 guibg=#111111

        hi SignColumn      guifg=#904040 guibg=#080808
        hi FoldColumn      guifg=#555555 guibg=#111111
        hi Folded          guifg=#998775 guibg=#111111
        hi colorcolumn     guibg=#222

        hi title           guifg=#883838
    endif "}}}
    if g:colors_name=="pyte" "{{{
        hi Normal           guibg=#cccccc
        hi colorcolumn      guibg=#aaa
        hi search           guifg=#111111 guibg=#999999 gui=underline
        hi incsearch        guifg=#111111 guibg=#999999 gui=underline
        hi Visual           guibg=#999999
        hi comment          guifg=#778899
        hi Error            guifg=#991111 guibg=#eeddcc
        hi Todo             guifg=#555555               gui=bold
        hi type             guifg=#aa6600
        hi repeat           guifg=#117755

        hi StatusLine       guifg=#111111               gui=bold
        hi tabline          guifg=#808070
        hi tablinesel       guifg=#111111 guibg=#aabbcc
        hi Folded           guifg=#665447 guibg=#aaa
        hi FoldColumn       guifg=#555555 guibg=#aaa
    endif "}}}
    if g:colors_name=="solarized" "{{{
        hi normal           guifg=#626262 guibg=#CFCBC9
        hi folded           guibg=#DEDAD8 gui=underline
        hi colorcolumn      guibg=#DEDAD8
        hi foldcolumn       guibg=#DEDAD8
    endif "}}}
endfun "}}}
"colorscheme
if has("gui_running") 
    "let $colorscheme_n="desert"
    "let $colorscheme_n="molokai"
    "let $colorscheme_n="pyte"
    let $colorscheme_n="solarized"
    colorscheme $colorscheme_n
    call Color_Modify()
else
    let $colorscheme_n="desert"
    colorscheme $colorscheme_n
endif

"menu
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
     "Always show file types in menu
    let do_syntax_sel_menu=1
endif
"statusline
set statusline=[%03l,%02c,%P]%<%F\%=[%1*%M%R%*%W%Y,%{&enc},%{&ff}][%oB,%bb]
hi User1 ctermfg=red guibg=#111111 guifg=red gui=bold,underline
"}}}
"Term Color "{{{
if has("gui_running")
else
  set ambiwidth=single
  " 防止退出时终端乱码
  " 这里两者都需要。只前者标题会重复，只后者会乱码
  set t_fs=(B
  set t_IE=(B
  if &term =~ "256color"
    " 在不同模式下使用不同颜色的光标
    "set cursorline
    "colorscheme pink_lily
    if &term =~ "xterm"
      silent !echo -ne "\e]12;HotPink\007"
      let &t_SI="\e]12;RoyalBlue1\007"
      let &t_EI="\e]12;HotPink\007"
      autocmd VimLeave * :!echo -ne "\e]12;green\007"
    endif
  else
    " 在Linux文本终端下非插入模式显示块状光标
    if &term == "linux"
       set t_ve+=[?6c
       autocmd InsertEnter * set t_ve-=[?6c
       autocmd InsertLeave * set t_ve+=[?6c
       autocmd VimLeave * set t_ve-=[?6c
    endif
  endif
endif "}}}

" 1.2.Misc_Settin
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{"Misc Editing Options
"use space to perform tab
set expandtab tabstop=8  smarttab
set softtabstop=4 shiftwidth=4
set shiftround              " rounds indent to a multiple of shiftwidth

set smartindent
set autoindent
set copyindent              " copy the previous indentation on autoindenting

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
set wrapscan

set comments=n:>,fb:-,fb:*
set formatoptions+=1orn2mMq
set formatlistpat="^\s*[(\d)*#-]\+[\]:.)}\t ]\s*"
"set fo-=r         " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

"Have the mouse enabled all the time:
"set mouse=a
set mousemodel=popup
" visual mode"
set virtualedit=block

"Change buffer - without saving
set hidden
set bufhidden=hide
"set switchbuf=useopen,usetab
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
set directory=.,~/.vim_backups/

"set tags=./tags;$HOME
"set showfulltag             " Show more information while completing tags.
set cscopetag               " When using :tag, <C-]>, or "vim -t", try cscope:
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

" 2.AutoCmd_Group{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
aug vimrc_GuiEnter "{{{
    au! vimrc_GuiEnter
    au GUIENTER * cd ~/Documents/vim
    "au GUIENTER * e ~/Documents/vimwiki/Todo/TodoToday.vwk
    "au GUIENTER *.vwk set filetype=vimwiki
    "au GUIEnter * VimwikiIndex
    au GuiEnter * set t_vb=
    au GUIENTER * winpos 131 0
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
"au! SourceCmd,bufwritepost *.vimrc call Color_Modify()
"au! colorscheme * call Color_Modify()
aug END

fun! Vimwiki_color() "{{{
if g:colors_name=="molokai"
hi VimwikiHeader1 guifg=#D0D090 gui=bold
hi VimwikiHeader2 guifg=#9BC97E gui=bold
hi VimwikiHeader3 guifg=#4FB16F gui=bold
hi VimwikiHeader4 guifg=#4E83AE gui=bold
hi VimwikiHeader5 guifg=#8889BA gui=bold
hi VimwikiHeader6 guifg=#A365B7 gui=bold

hi VimwikiLIst guifg=#bb9
elseif g:colors_name=="solarized"

endif
syn match VimwikishortTimeStamp /<\d\d\d\d-\d\d\d\d>/
syn match VimwikiminTimeStamp /\d\d\d\d_\d\d\d\d/
syn match VimwikiTimeStamp /<\d\d\d\d-\d\d\d\d>/
hi def link VimwikishortTimeStamp VimwikiTimeStamp
hi def link VimwikiminTimeStamp VimwikiTimeStamp
hi def link VimwikiTimeStamp SpecialComment
hi VimwikiTimeStamp guifg=#777777 gui=bold

let rxListBullet = '^\s*\zs\%(\*\|-\|#\)\ze\s'
"let rxListNumber = '^\s*\zs\%(\d\+[\.)]\)\+\s'
execute 'syntax match VimwikiList /'.rxListBullet.'/'
"execute 'syntax match VimwikiList /'.rxListNumber.'/'
syn match vimwiki_rx_list_num /^\s*\%(\d\+\.\)\+\ze\s/
"hi vimwiki_rx_list guifg=#8c8 gui=bold
hi default link vimwiki_rx_list_num VimwikiLIst


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

" 3.Commands_And_Abbreviations {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ Commands
"command! -nargs=* Htag helptags $VIMRUNTIME/doc <args>
command! -nargs=* Htag call pathogen#helptags() <args>
command! -nargs=* Papp call pathogen#runtime_append_all_bundles(<args>) <args>


command! -nargs=0 Wsu exec "w !sudo tee % "
command! -nargs=0 Gsu exec "!gksu gvim '%:p' "

command! Delete call delete(expand('%'))
command! -range=% ClsXML <line1>,<line2>!tidy -utf8 -iq -xml
command! -range=% ClsHTML <line1>,<line2>!tidy -utf8 -iq -omit -w 0
command! -range=% Thtml <line1>,<line2>!tidy -utf8 -iq -f 'errs.txt' -m

command! Ch7 !chmod 755 '%:p'
command! Ch6 !chmod 644 '%:p'
command! Gcc !gcc `pkg-config --cflags --libs gtk+-2.0` '%:p'

" The K stroke
set keywordprg=":help"
cabbrev H h
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
inorea --> &rarr;
inorea <-- &larr;
iab stime <<C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>>
iab ttime <C-R>=strftime("%y%m%d_%H%M")<CR>
iab dtime <C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>
iab ftime <C-R>=strftime("%y-%m-%d_%H.%M.%S.txt")<CR>
"}}}
" 4.Key_Mapping_General{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
" F1-F12 "{{{
" TODO make F1~F12 The plugin key which have cmd win 
" F1 help / docs
" F2 Search /replace
" F3 Buffers 
" F4 Filedir XXX dont use m-F4
" F5 RUN /COMPILE
" F6 TAGLIST
" F7 UNDO 
" F8 OPEN FOLDER / TERMINAL
" F9 
" F10
" F11
" F12 Save session

nmap <F1> :h <C-R>=expand("<cword>")<CR><CR>
"map <F1> :call Split_if("")<CR><Plug>VimwikiIndex
nmap <s-F1> :!man <C-R>=expand("<cword>")<CR> <CR>
nmap <c-f1> :FufHelp<C-R>=expand("<cword>")<CR><CR>

nmap <F2> :FufLine <CR>
map <c-F2> :Ack <C-R>=expand("<cword>")<CR>
vnoremap <c-F2> "sy<esc><c-l>:Ack <c-r>s
" replace word under cursor
nmap <s-F2> :%s/<C-R><C-W>//gc<Left><Left><Left>
" replace selection
vnoremap <s-F2> "sy<esc><c-l>:%s/<c-r>s//g<Left><Left>
"vnoremap <C-C> "+y

map <silent> <F3> :FufBuffer<CR>
map <s-F3> :Unite buffer<CR>
"noremap <F4> :NERDTreeToggle "expand('%:p:h')"<CR>
noremap <F4> :FufFile<CR>
map <s-F4> :Unite file bookmark<CR>


"FIXME ugly: 
" should be F5 -> run file
" S-F5 -> sudo file /chmod /compile
" v_F5 -> yank and run range 
nmap <silent> <F5> :call Exe_cur_script("file","norm")<CR>
vmap <silent> <F5> :call Exe_cur_script("visual","norm")<CR>
nmap <silent> <c-F5> :call Exe_cur_script("file","sudo")<CR>
vmap <silent> <c-F5> :call Exe_cur_script("visual","sudo")<CR>
nmap <silent> <s-F5> :call Exe_cur_script("line","norm")<CR>
nmap <silent> <c-s-F5> :call Exe_cur_script("line","sudo")<CR>
function! Exe_cur_script(range,priv) "{{{
   " TODO mac /win /linux check (kde,gnome ,)
   " define the cmd by user
   " TODO Pluginize: a cmd window to choose :sudo/norm
   " choose visual/line , file
   " debug mode 
   " compile chmod make
    if expand("%") != ""
        "w!
        "FIXME wrong if no syntax
        "if !exists("b:current_syntax")   "don't need the & prefix
            "echom " can not  execute current file (%) "
            "return 0
        "endif

        let browser = "firefox"
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

        if exists("b:current_syntax")
        let syn=b:current_syntax
        if syn=="python" "{{{
            exec "!".pri."python -d ".rng." 2>&1 | tee /tmp/.runtmp"
            "exec "!".pri."python -d ".rng." 2 3 4 5"
        elsei syn=~'^\(vim\|vba\)$'
            if a:range=="file"
                exec "so ".expand('%:p')
            elseif a:range=="line"
                exec rng
            endif
        elsei syn=~'html'
            exec "!".browser.' "'.rng.'"'
        elsei syn =~'^\(sh\|expect\|bash\)$'
            if has("unix")

                "exec "!".pri."gnome-terminal -e "."'".pri."sh -c ".rng."'"
                if a:range=="file"
                    if stridx(getfperm(rng), 'x') != 2
                        call system("chmod +x ".shellescape(rng))
                    endif
                    exec "!".pri."gnome-terminal -e "."'".pri."bash ".rng."'"
                else
                    "exec "!".pri."gnome-terminal -e "."'".pri."sh -c ".rng."'"
                    exec "!".pri."gnome-terminal -x ".rng
                endif
            elseif has("win32") || has("win64")
                exec "!".pri."cmd -e".rng
            endif
        else
            "setl binary
            if has("unix") | exec "!gnome-open ".pri.rng
            else | exec "!".pri.rng | endif
        endif "}}}
        else
            "setl binary
               if has("unix") | exec "!gnome-open ".pri.rng
               else | exec "!".pri.rng | endif
        endif

    endif
endf "}}}
"map <silent> <c-F5> :execute "split .tmp"<CR>
"run current line

map <F6> :TagbarToggle<CR>

map <F7> :GundoToggle<CR>

map <silent><F8> :call Start_File_explore()<CR>
map <silent><s-F8> :call Start_terminal()<CR>
fun! Start_File_explore()
    if expand("%:p:h") != ""
        if has("win32")
            exec "!start explorer '%:p:h'"
        else
            exec "!nautilus '%:p:h'"
        endif
    endif
endf
fun! Start_terminal()
    if has("win32")
        exec "!start cmd '%:p:h'"
    else
        exec "!gnome-terminal --working-directory='%:p:h'"
    endif
endf

"session save /load
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

" 4.1.Leader_Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
"Mapleader "{{{
let mapleader = " "
let maplocalleader = ","
"let maplocalleader = "\\"

nnoremap ; :
noremap q: <nop>

" Nop mapping
nnoremap s z
nnoremap S z
nnoremap c <Nop>
nnoremap C <Nop>

"}}}
"Edit .vimrc and other files <leader>XX"{{{
map <silent><leader>vv :call Split_if("") \| e ~/.vimrc<CR>
map <leader>vd :e ~/.vim/ <CR>
map <silent><leader>vb :call Split_if("") \| e ~/.bashrc<CR>
map <silent><leader>vp :call Split_if("") \| e ~/.pentadactylrc<CR>

"map <silent><leader>ww :call Split_if("") \| VimwikiIndex<CR>
"map <silent><leader>WW :call Split_if("") \| VimwikiIndex<CR>

"map <leader>vc :call Split_if("") \| e ~/$colorscheme_n.vim<CR>
"map <leader>VC :call Split_if("") \| e ~/.vim/colors/$colorscheme_n.vim<CR>

"map <leader>vs :call Split_if("") \| exec "VimShell" <CR>
"map <leader>VS :call Split_if("") \| exec "VimShell" <CR>

"map <leader>vf :call Split_if("") \| exe "VimFiler" <CR><esc>
"map <leader>VF :Splif \| exe "VimFiler" <CR><esc>

"reloading of the .vimrc
map <leader>vr :so ~/.vimrc<CR>
"map <leader>RR :so ~/.vimrc<CR>
"map <leader>rr :so ~/.vimrc<CR>
map <leader>rr :nohl \|redr<CR>

map <Leader>tn :call Split_if("t")<CR>

map <leader>rf :FufMruFile<CR>
map <leader>re <c-^>
"map <leader>
"check current file to decide if split or not
command! -nargs=* Splif call Split_if(<q-args>)
fun! Split_if(...) "{{{
    if expand('%')==""
        return
    endif
    if a:0
        if a:1 =="v"
            exe "win 159 100"
            exe "vsplit"
        elseif a:1=="t"
            exe "tabnew"
        elseif a:1=="s"
            exe "split"
        elseif a:1==""
            return
        endif
    else
        return
    endif
endfun
"}}}
"}}}
" Toggle Diff Mode "{{{
map <silent> <leader>dd :call Toggle_diff()<CR>
map <silent> <leader>DD :call Toggle_diff()<CR>
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

map <silent> <leader>do :DiffOrig<CR>
command! DiffOrig win 151 100 | vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis

"}}}
"Toggle Folding And Foldmethod "{{{
"noremap <silent> <leader> zA
nnoremap <silent> <leader><leader> @=(foldlevel('.')?'za':'')<CR>
nnoremap <silent> <leader>zz @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>ZZ @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>aa @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>AA @=(&foldlevel?'zM':'zR')<CR>
"nnoremap f za
"nnoremap F zA
"vnoremap <leader><leader> zf
map <silent><leader>fm :if &foldmethod == 'marker'  <bar>
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
            \ endif <CR>
"}}}
"Misc Option Toggle "{{{

set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
"set listchars=tab:\|-,trail:-,extends:>,precedes:<
map <Leader>li :set list! list?<CR>
map <silent><leader>nn :if  &nu \| setl rnu \| elseif &rnu \| setl nornu
            \ \| else \| setl nu\| endif <CR>
map <leader>wr :set wrap! wrap?<CR>
"map <leader>nn set nu! nu?<CR>
"map <leader>nr :set rnu! rnu?<CR>
map <leader>sp :set spell!<CR>
    \<bar>:echo "Spell check: ".strpart("OFFON", 3 * &spell, 3)<CR>

no <silent><m-1> :if &go=~#'m'\|se go-=m\|else\|se go+=m\|endif<CR>
no <silent><m-2> :if &go=~#'r'\|se go-=r\|else\|se go+=r\|endif<CR>

" copy filename
map <silent> <leader>cl :let @+=expand('%').':'.line('.')<CR>
map <silent> <leader>cf :let @+=expand('%:p')<CR>
" copy path
map <silent> <leader>cp :let @+=expand('%:p:h')<CR>

"Keymapping Of Gtd
map<silent> <Leader>ntd :TinyTodo<CR>
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
"Syntax Quick Set "{{{
"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
nmap <leader>111 :set ft=vim<CR>
nmap <leader>112 :set ft=vimwiki<CR>
nmap <leader>113 :set ft=sh<CR>

nmap <leader>121 :set ft=html.php<CR>
nmap <leader>122 :set ft=css<CR>
nmap <leader>123 :set ft=javascript<CR>
nmap <leader>124 :set ft=php.html<CR>

nmap <leader>131 :set ft=cpp<CR>
nmap <leader>132 :set ft=python<CR>

nmap <leader>`` :filetype detect \| syntax enable \| call Color_Modify() <CR>
"nmap <leader>`` :filetype detect \| syntax enable \| so $MYVIMRC<CR>

"use menu syntax
nmap <leader>11  :emenu Syntax.
"nnoremap <silent> <leader>1 :nohl<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
"}}}

" 4.2.Window_control_mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
"Window Mapping  <C-W> "{{{
nmap <c-w>1 <c-w>_
nmap <c-w><c-a> <c-w>_
nmap <c-w>2 <c-w>=
nmap <c-w><c-z> <c-w>=
"nmap <c-w><c-w> <c-w>=<c-w>w
"nmap <c-w>3 z0<CR>


"buffer and window navigation
nmap <c-w><c-w> :call Nav_buff_win("next")<cr>
nmap <c-w><c-e> :call Nav_buff_win("prev")<cr>
nmap <c-w><c-b> :call Nav_buff_win("list")<cr>
fun! Nav_buff_win(act)
    if a:act=="next"
    	exe winnr('$')==1 ? "bnext" : "normal \<c-w>w"
    endif
    if a:act=="prev"
    	exe winnr('$')==1 ? "bprevious" : "normal \<c-w>W"
    endif
    if a:act=="list"
    	exe winnr('$')<=4 ? "Fufbuffer" : "Unite window "
    endif
endfun


"dont close last window , use :q or 
nmap <silent> <c-w><c-q> :call Check_winnr(-2)\|hid<CR>
nmap <silent> <c-w><c-x><c-x> :qall<CR>
"buffer in current window
nmap <c-w><c-d> :bd<CR>
nmap <c-w><c-u> :bun<CR>
nnoremap <C-w><c-n> :bnext<CR>
nnoremap <C-w>n :bnext<CR>
nnoremap <C-w><c-p> :bprevious<CR>
nnoremap <C-w>p :bprevious<CR>
"}}}
"Window Width(Columns) Configure"{{{
nmap <silent> <c-w><c-v> :call Check_winnr(0)\|vne<CR>
nmap <silent> <c-w><c-h> :call Check_winnr(2)<CR><c-w>H
nmap <silent> <c-w><c-l> :call Check_winnr(2)<CR><c-w>L

"nmap <silent> <c-w><c-s> :call Check_winnr(-1)\|new<CR>
"nmap <silent> <c-w><c-s> :sp<CR>
nmap <silent> <c-w><c-j> :call Check_winnr(-2)<CR><c-w>J
nmap <silent> <c-w><c-k> :call Check_winnr(-2)<CR><c-w>K


nmap <silent> <c-w><c-t> :call Check_winnr(-2)<CR><c-w>T

fun! Check_winnr(num) "{{{
    let col =78
    " if plus sign, set to >= if minus, set to <=
    if a:num>=0
        " if winnr>= num set column
        if winnr("$")>=a:num
            if &co!=col*2 | let &co=col*2 | endif
        endif
    elseif a:num<0
        " if winnr<= abs(num) set column
        if winnr("$")<=abs(a:num)
            if &co!=col | let &co=col | endif
        endif
    "elseif a:num==0
        " set column anyway
        "if &co!=col | let &co=col | endif
    endif
endfun "}}}
"}}}

" 4.3.move_around_mapping
"""""""""""""""""""""""""""""""""""""""""""""""""
" <M-X> Moving "{{{
noremap <silent> <m-a> <home>
noremap <silent> <m-z> <end>
noremap <silent> <m-k> <up>
noremap <silent> <m-j> <down>
"noremap <silent> <m-s-k> 5<up>
"noremap <silent> <m-s-j> 5<down>
noremap <silent> <m-h> <left>
noremap <silent> <m-l> <right>
noremap <silent> <m-w> w
noremap <silent> <m-b> b

inoremap <silent> <m-w> <c-right>
inoremap <silent> <m-b> <c-left>
inoremap <silent> <m-j> <down>
inoremap <silent> <m-k> <up>
"inoremap <silent> <m-s-k> 5<up>
"inoremap <silent> <m-s-j> 5<down>
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
"Easy Moving Modify "{{{

" <s-j> <s-k>
noremap J 5j
noremap K 5k
noremap <c-j> J
noremap <c-k> K


" just one space on the line, preserving indent
"nmap <Up>   gk
nnoremap k      gk
"vmap <Up>   gk
vnoremap k      gk
"nmap <Down> gj
nnoremap j      gj
"vmap <Down> gj
vnoremap j      gj

" <s-h> <s-l>
noremap H B
noremap L W

" i_c-h is <bs> , so:
inoremap <c-l> <del>

"quick move to last selection
nnoremap `w `<
nnoremap `e `>
"move to last insert position
nnoremap `i `^
"last change postion
nnoremap `c `.

"jump to the match item
" ]] [[ goto define
" } { goto paragraph
" )( go to sentence
nmap <leader>jj %
"nmap <leader>jk %v%
nmap <leader>jh [[
nmap <leader>jl ]]
nmap <leader>jn {
nmap <leader>jp }

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

nnoremap <S-CR> o<ESC>
nnoremap <c-CR> O<ESC>

if v:version < 703
    nmap <silent> <m-MouseDown> zhzhzh
    nmap <silent> <m-MouseUp> zlzlzl
    vmap <silent> <m-MouseDown> zhzhzh
    vmap <silent> <m-MouseUp> zlzlzl
    map <MouseUp> 3k
    map <MouseDown> 3j
    map <s-MouseUp> 30k
    map <s-MouseDown> 30j
else
    map <m-ScrollWheelDown> <ScrollWheelRight>
    map <m-ScrollWheelUp> <ScrollWheelLeft>
    imap <m-ScrollWheelDown> <ScrollWheelRight>
    imap <m-ScrollWheelUp> <ScrollWheelLeft>
    map <scrollwheelup> 3k
    map <scrollwheeldown> 3j
    map <s-scrollwheelup> 30k
    map <s-scrollwheeldown> 30j
endif


"}}}

" 4.4.Edit_and_formatting
"""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Editing Modify "{{{
" make p in Visual mode replace the selected text with the yank register
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nnoremap Y y$

""Word Capitalize Hotkeys
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
nmap <leader>ul :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
" Capitalize inner word
nmap <leader>uc guiw~w
" UPPERCASE inner word
nmap <leader>uu gUiww
" lowercase inner word
nmap <leader>uw guiww

"trim whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>:let @/=''<CR>

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
"Quick Wrapping "{{{
"visualize selection
nnoremap <leader>sl ^v$
"use the remaped % ^ 'matchit'
nmap <leader>ss %%V%
" viw can do it
"nnoremap <leader>sw gewve
" viW
"nnoremap <leader>sW geWvE
" Note: 
" Action:   V/D 
" Range:    I/A  
" Object:   Wsp/][/()/'`"/<>/{}
"#ffee00
" Use vim-Surround instead
" surrond do this as v_s + "surrond things"
" Imporvement:
" Normal Mode:
"               ds -> delete 
"               dst -> delete <>tag
"               cs -> change
"               cst -> change <>tag
"               ys -> surrond visual select motion
"               yss -> surrond current line without whitespace
" Visual Mode:
"               s
" Visul_block: 
"               s
"TODO put it in a function or use bundles
"  viw s"
"nnoremap <Leader>e" ciw"<C-r>""<ESC>
"vnoremap <Leader>e" c"<C-r>""<ESC>`[
"nnoremap <Leader>e' ciw'<C-r>"'<ESC>
"vnoremap <Leader>e' c'<C-r>"'<ESC>`[
" viw s>
"nnoremap <Leader>e< ciw<<C-r>"><ESC>
"vnoremap <Leader>e< c<<C-r>"><ESC>`[

"nnoremap <Leader>e` ciw`<C-r>"`<ESC>
"vnoremap <Leader>e` c`<C-r>"`<ESC>`[
"nnoremap <Leader>e8 ciw*<C-r>"*<ESC>
"vnoremap <Leader>e8 c*<C-r>"*<ESC>`[
"nnoremap <Leader>e9 ciw(<C-r>")<ESC>
"vnoremap <Leader>e9 c(<C-r>")<ESC>`[
"nnoremap <Leader>e- ciw_<C-r>"_<ESC>
"vnoremap <Leader>e- c_<C-r>"_<ESC>`[

"viw s]
"nnoremap <Leader>e[ ciw[<C-r>"]<ESC>
"vnoremap <Leader>e[ c[<C-r>"]<ESC>`[
"nnoremap <Leader>e{ ciw{<C-r>"}<ESC>
"vnoremap <Leader>e{ c{<C-r>"}<ESC>`[
nnoremap <Leader>e} ciw{{{<C-r>"}}}<ESC>
vnoremap <Leader>e} c{{{<C-r>"}}}<ESC>`[
nnoremap <Leader>e] ciw[[<C-r>"]]<ESC>
vnoremap <Leader>e] c[[<C-r>"]]<ESC>`[

"viw s<div id=....
"nnoremap <leader>ed ciw<div id=""><C-r>"</div><ESC>
"vnoremap <Leader>ed c<div id=""><C-r>"</div><ESC>`[
"nnoremap <leader>ea ciw<a href="" ><C-r>"</a><ESC>
"vnoremap <Leader>ea c<a href="" ><C-r>"</a><ESC>`[
"nnoremap <leader>ei ciw<img href="" ><C-r>"</img><ESC>
"vnoremap <Leader>ei c<img href="" ><C-r>"</img><ESC>`[
"php
"nnoremap <leader>ep ciw<?php <C-r>" ?><ESC>
"vnoremap <Leader>ep c<?php <C-r>" ?><ESC>`[
"" html comment
nnoremap <leader>e! ciw<!-- <C-r>" --><ESC>
vnoremap <Leader>e! c<!-- <C-r>" --><ESC>`[
"}}}
"Formating "{{{
"alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

"make vimwiki list
nnoremap <leader>l1 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1* /&e\|nohl<CR>
nnoremap <leader>l2 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1# /&e\|nohl<CR>
nnoremap <leader>l3 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1- /&e\|nohl<CR>
nnoremap <leader>l4 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\11. /&e\|nohl<CR>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

"将当前行以下转换为文本
map <M-r><M-r> <ESC>gqap
"段落后添加空行
map <M-r><M-q> <ESC>:.,$s/\([。！？”—）]\)$/\1\r/g<CR>
"quick format current sentence
map <M-r><M-f> <ESC>gqap

"}}}

" 4.5.win_behave_settings (yank and pasting)
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ Behave Win And Menu
if has('gui_running')
    behave mswin
    source $VIMRUNTIME/mswin.vim
endif "}}}
"{{{ Win_behav Mapping
vnoremap <c-d> "+x
vmap <C-X> "+x  " often no cut contentat all
vmap <C-m-X> "+x  " often no cut contentat all
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <c-v>       "+gp
map <S-Insert>  "+gp
imap <C-v>      "+gp
imap <S-Insert> "+gp
cmap <C-v>      <C-R>+
cmap <S-Insert> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

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

nmap <c-s> :update<CR>
imap <c-s> <esc>:update<CR>a
"}}}

"5.Plugins_settings{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ Command-T
nnoremap <leader>uu :GundoToggle<CR>
"map <leader>ff :FufFile<CR>
map <leader>ff :CommandT<CR>
map <leader>tb :CommandTBuffer<CR>
let g:CommandTMaxHeight=3
"let g:CommandTMatchWindowAtTop=1
"}}}
"NERD Commenter" "{{{
map CC <plug>NERDCommenterToggle
map cc <plug>NERDCommenterToggle
map ca <plug>NERDCommenterAltDelims
map ci <plug>NERDCommenterInInsert
map cp <plug>NERDCommenterAppend
map cA <plug>NERDCommenterAppend
map cs <plug>NERDCommenterSexy
let g:NERDCreateDefaultMappings=0
"}}}
" Enhcommentify "{{{
" use it because it have block syntax comment
map <leader>ce  <Plug>Traditional
map ce  <Plug>Traditional
map cf  <Plug>FirstLine
map cm  <Plug>Comment
let g:EnhCommentifyUserBindings = 'yes'
"let g:EnhCommentifyFirstLineMode='Yes'
"let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyUseSyntax = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyBindInInsert = 'No'
"let g:EnhCommentifyMultiPartBlocks = 'Yes'
"let g:EnhCommentifyCommentsOp = 'Yes'
"let g:EnhCommentifyAlignRight = 'Yes'
let g:EnhCommentifyUseBlockIndent = 'Yes'
"}}}
"{{{GUNDO
let gundo_preview_bottom = 1
let  g:gundo_width=30
let g:gundo_right = 1
"}}}
"Unite Settings "{{{
"noremap <leader>ww :Unite file bookmark<CR>
noremap <m-w><m-w> :Unite file bookmark<CR>
noremap <m-W><m-W> :Unite file bookmark<CR>
noremap <m-w><m-t> :Unite tab window<CR>
noremap <m-w><m-b> :Unite buffer<CR>
noremap <m-w><m-r> :Unite file_mru directory_mru<CR>
noremap <m-w><m-e> :Unite register<CR>
noremap <m-w><m-s> :Unite source<CR>
noremap <m-w><m-i> :Unite session<CR>
noremap <m-w><m-c> :Unite colorscheme<CR>

let g:unite_winheight=5

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
"Neocomplcache Settings "{{{
map <leader>nt :NeoComplCacheToggle<CR>
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
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" "use <c-q><tab> to insert tabs"
"inoremap <expr><TAB> pumvisible() ? "\<c-n>" : <SID>check_back_space() ?
            \ "\<TAB>" : "\<C-x>\<c-u><c-p><c-n>"

"inoremap <expr><s-TAB> pumvisible() ? "\<c-p>" : <SID>check_back_space() ?
            \ "\<s-TAB>" : "\<C-x>\<c-u><c-p><c-n>"

function! s:check_back_space()
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction

aug omni_compl "{{{
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
let g:neocomplcache_text_mode_filetypes = {"vimwiki":1,"vim":1}
let g:neocomplcache_disable_caching_file_path_pattern="fuf"
"}}}
"Zencoding Settings  "{{{
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
 "}}}
"Vimwiki Settings "{{{
map <Leader>ww <Plug>VimwikiIndex

let wiki_1 = {}
    let wiki_1.path = '~/Documents/vimwiki'
    let wiki_1.ext = '.vwk'
    let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp','sh':'sh'}

let g:vimwiki_list = [wiki_1]

let g:vimwiki_menu = ""
"let g:vimwiki_global_ext= 0
let g:vimwiki_browsers=['firefox']
"let g:vimwiki_html_header_numbering = 2
let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,zip,rar,7z,gz
                        \,py,sh
                        \,js,css,html,php
                        \,vim,vba'
let g:vimwiki_conceallevel=3


let g:vimwiki_use_mouse =1
let g:vimwiki_fold_lists=1
let g:vimwiki_folding=0

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
let g:vimwiki_rxListNumber = '^\s*\%(\d\+[\.)]\)\+\s'
function! MyVimwikiFoldText() "{{{
  let line = substitute(getline(v:foldstart), '\t',
        \ repeat(' ', &tabstop), 'g')
  " TODO add some g:variable to control the align width
  let line = strpart(line,0,19)
  if strlen(line) <19
      let line .= repeat(" ",19-strlen(line))
  endif
  "echom v:foldstart
  "let sum = 0
  "echom "begin:".v:foldstart." end:".v:foldend
  let lnum = &foldmethod=="indent" ? v:foldstart : v:foldstart+1
  "let lnum=v:foldstart+1 "igonre the firstline
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
        " FIXME the prio number should in rx form
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

fun! s:vimwiki_my_settings() "{{{

    setlocal fdm=indent
    "setlocal foldexpr=Myfoldlevel(v:lnum)
    setlocal foldexpr=VimwikiFoldLevel(v:lnum)
    setlocal foldtext=MyVimwikiFoldText()
    "will cause internal error with \zs duplicated
    "let g:vimwiki_rxListNumber = '^\s*\zs\%(\d\+[\.)]\)\+\ze\s'
    if g:vimwiki_hl_cb_checked
    execute 'syntax match VimwikiCheckBoxDone /'.
            \ g:vimwiki_rxListBullet.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
            \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    execute 'syntax match VimwikiCheckBoxDone /'.
            \ g:vimwiki_rxListNumber.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
            \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    endif

    map <buffer><leader>wl <Plug>VimwikiToggleListItem
    map <buffer><leader>wa <Plug>VimwikiTabMakeDiaryNote
    map <buffer><leader>wg <Plug>VimwikiGenerateLinks
    map <buffer><Leader>wr <Plug>VimwikiRenameLink
    map <buffer><Leader>wd <Plug>VimwikiDeleteLink

    map <buffer><m-backspace> <Plug>VimwikiGoBackLink

    map <buffer><Leader>w2  :Vimwiki2HTML<CR>
    map <buffer><Leader>w2a :VimwikiAll2HTML<CR>

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


    inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
    "tab with 2 space sts sw
    set shiftwidth=2 softtabstop=2
endfun "}}}

aug vimwiki_myset "{{{
au! vimwiki_myset
"au winenter,bufenter,BufRead,bufNew *.vwk setlocal foldtext=MyVimwikiFoldText()
"au FileType vimwiki setlocal foldtext=MyVimwikiFoldText()
autocmd FileType vimwiki call s:vimwiki_my_settings()
aug END

"normal buffer mapping
inoremap <expr> <rightmouse><leftmouse> "\<c-o><c-i>"
noremap <expr> <rightmouse><leftmouse> "\<c-o>"
inoremap <expr> <m-Home> "\<c-o><c-o>"
noremap <expr> <m-Home> "\<c-o>"
inoremap <expr> <m-End> "\<c-o><c-i>"
noremap <expr> <m-End> "\<c-i>"
"}}}

"}}}
"Fuzzyfinder "{{{
map <c-\> :FufLine<CR>
map <silent> <C-]> :FufBufferTagWithCursorWord<CR>
let g:fuf_modesDisable = [ 'mrucmd', ]
map <leader>h :FufHelp<CR>
"}}}
"Misc Plugins Settings "{{{
"   syntax/vim.vim 默认会高亮 s:[a-z] 这样的函数名为错误
let g:vimsyn_noerror = 1
nmap <leader>ca :CalendarH<CR>

map <leader>tt :TagbarToggle<CR>
let g:tagbar_compact = 1

"let g:vimshell_prompt = $USER."> "
"let g:NERDTreeChDirMode=2
"noremap <m-w><m-w> :NERDTreeToggle "expand('%:p:h')"<CR>
"}}}

"6.Function_And_Key_Mapping{{{1
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
"function! ConditionalPairMap(open, close)
  "let line = getline('.')
  "let col = col('.')
  "if col < col('$') || stridx(line, a:close, col + 1) != -1
    "return a:open
  "else
    "return a:open . a:close . repeat("\<left>", len(a:close))
  "endif
"endf

"inoremap <expr> ( ConditionalPairMap('(', ')')
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap <expr> { ConditionalPairMap('{', '}')
"inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
"inoremap <expr> [ ConditionalPairMap('[', ']')
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"}}}
"colorpicker   取得光标处的匹配 {{{
function! Lilydjwg_get_pattern_at_cursor(pat)
  let col = col('.') - 1
  let line = getline('.')
  let ebeg = -1
  let cont = match(line, a:pat, 0)
  while (ebeg >= 0 || (0 <= cont) && (cont <= col))
    let contn = matchend(line, a:pat, cont)
    if (cont <= col) && (col < contn)
      let ebeg = match(line, a:pat, cont)
      let elen = contn - ebeg
      break
    else
      let cont = match(line, a:pat, contn)
    endif
  endwhile
  if ebeg >= 0
    return strpart(line, ebeg, elen)
  else
    return ""
  endif
endfunction
"}}}
" 使用 colorpicker 程序获取颜色值(hex/rgba) {{{
function! Lilydjwg_colorpicker()
  if exists("g:last_color")
    let color = substitute(system("colorpicker ".shellescape(g:last_color)), '\n', '', '')
  else
    let color = substitute(system("colorpicker"), '\n', '', '')
  endif
  if v:shell_error == 1
    return ''
  elseif v:shell_error == 2
    " g:last_color 值不对
    unlet g:last_color
    return Lilydjwg_colorpicker()
  else
    let g:last_color = color
    return color
  endif
endfunction "}}}
" 更改光标下的颜色值(hex/rgba/rgb) {{{
function! Lilydjwg_changeColor()
  let color = Lilydjwg_get_pattern_at_cursor('\v\#[[:xdigit:]]{6}(\D|$)@=|<rgba\((\d{1,3},\s*){3}[.0-9]+\)|<rgb\((\d{1,3},\s*){2}\d{1,3}\)')
  if color == ""
    echohl WarningMsg
    echo "No color string found."
    echohl NONE
    return
  endif
  let g:last_color = color
  call Lilydjwg_colorpicker()
  exe 'normal! eF'.color[0]
  call setline('.', substitute(getline('.'), '\%'.col('.').'c\V'.color, g:last_color, ''))
endfunction
nmap <m-c> :call Lilydjwg_changeColor()<CR>
nmap cac :call Lilydjwg_changeColor()<CR>
inoremap <M-c> <C-R>=Lilydjwg_colorpicker()<CR>
"}}}
" 6.1.vimwiki_works
" TODO pluginize
"""""""""""""""""""""""""""""""""""""""""""""""""
"{{{Set Prio Of Vimwiki Todo-Item
" TODO set the prio [+-]/d as list_item
nmap <leader>33 :call Ask_Prio("begin","min")<CR>
nmap <leader>pp :call Ask_Prio("begin","min")<CR>
fun! Check_Valid()
    let line = getline('.')
    let rx_bul_item = g:vimwiki_rxListBullet let rx_num_list = g:vimwiki_rxListNumber let rx_lst_item = '\('. rx_bul_item . '\|' . rx_num_list . '\)'
    if line !~ rx_lst_item
        echoe "Error: Can not set a none-list-line."
        return 0
    else
        return 1
    endif

endfun

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

fun! Ask_Prio(...)
    if Check_Valid()
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
"}}} end of set Prio
" 
"{{{Auto List Item with number sequence
inoremap <expr> <C-CR>  "\<CR>".AutoListItem(line('.'))
noremap <silent><m-n>  :call Sub_num('.')<CR>
inoremap <expr> <C-Kenter>  "\<CR>".AutoListItem(line('.'))
noremap <m-F12>  :call Prev_list_item(line('.'))<CR>
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
"FIXME havenot finished
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
"map <leader>ae :call Auto_TimeStamp('.','long')<CR>
"map <leader>dt :call Del_TimeStamp('.')<CR>
"map <leader>db :call Del_TodoBox('.')<CR>
"map <silent> <leader>ec <plug>VimwikiToggleListItem
            \:call Toggle_TimeStamp('.')<CR>

map <silent><leader>ee :call Toggle_checkbox_Timestamp()<CR>

fun! Toggle_checkbox_Timestamp()
    let line = getline('.')
    if line =~ '\s\[X\]\s'
    	let checkbox_state = 2
    elseif line =~ '\s\[.\]\s'
        let checkbox_state = 1
    else
    	let checkbox_state = 0
    endif
    if checkbox_state==0
            exec "VimwikiToggleListItem"
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

fun! Toggle_TimeStamp(range)
    let lnum=line(a:range)
    let rx_CheckBox_Done = '\[X\]'
    let line = getline(lnum)
    if line =~ rx_CheckBox_Done
        call Auto_TimeStamp(a:range,"min")
    else
        call Del_TimeStamp(a:range)
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
    " TODO
    " let rx_utf_timestamp='!\(\w\|\.\)'
    " !0-9a-zA-Z_. : <11-04-11 17:20> -> !b4bgj
    " C-Q U :  <11-04-11 17:20> -> printf("%x",1104111720) -> �

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
" 打开 snippets 文件[[[2
function! Lilydjwg_snippets(ft)
  if a:ft == ''
    exe 'tabe '.g:snippets_dir.&ft.'.snippets'
  else
    exe 'tabe '.g:snippets_dir.a:ft.'.snippets'
  endif
endfunction
map <leader>se :call Lilydjwg_snippets('')<cr>
" cscope setting  "{{{
if has("cscope") && executable("cscope")
  " 设置 [[[2
  set csto=1
  set cst
  set cscopequickfix=s-,c-,d-,i-,t-,e-

  " add any database in current directory
  function! Lilydjwg_csadd()
    set nocsverb
    if filereadable(expand('%:h:p') . "/cscope.out")
      exe 'cs add ' . expand('%:h:p') . '/cscope.out'
    elseif filereadable(expand('%:h:p') . "/../cscope.out")
      exe 'cs add ' . expand('%:h:p') . '/../cscope.out'
    elseif filereadable("cscope.out")
      cs add cscope.out
    endif
    set csverb
  endfunction

  autocmd BufRead *.c,*.cpp,*.h call Lilydjwg_csadd()

  "" 映射 [[[2
  "" 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
  "nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
  "" 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
  "nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
  "" 查找本函数调用的函数
  "nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
  "" 查找调用本函数的函数
  "nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
  "" 查找指定的字符串
  ""nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
  "" 查找egrep模式，相当于egrep功能，但查找速度快多了
  "nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
  "" 查找并打开文件，类似vim的find功能
  "nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
  "" 查找包含本文件的文件
  "nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "" 生成新的数据库
  "nmap csn :lcd %:p:h<CR>:!my_cscope<CR>
  "" 自己来输入命令
  "nmap cs<Space> :cs find
endif
"nmap <S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> "}}}
