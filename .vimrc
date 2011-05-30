" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker fenc=utf8 fdls=0 :
"""""""""""""""""""""""""""""""""""""""""""""""""
"vimrc Index "{{{
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
"7.Other_Stuffs 
"  By: Rykka.Krin <Rykka10@gmail.com>
"  Last Change: 2011-05-30
"  "Tough time Goes , Tough People Stay." "}}}
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.General_Settings{{{1
"{{{ Vundle
"load all bundles
call pathogen#runtime_append_all_bundles()

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()
" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Shougo/neocomplcache'
let g:snips_author = 'Rykka.Krin <Rykka.krin@gmail.com>'
Bundle 'Shougo/unite.vim'
Bundle 'tungd/unite-session'
Bundle 'ujihisa/unite-colorscheme'
"Bundle 'Shougo/vimfiler'
"Bundle 'Raimondi/delimitMate'
Bundle 'mattn/calendar-vim'
"{{{ tagbar
Bundle 'majutsushi/tagbar' 
"map <leader>tt :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_width = 30
"}}}
"Zencoding Settings  "{{{
Bundle 'mattn/zencoding-vim'
 "}}}
"{{{ Command-T
Bundle 'wincent/Command-T'
"map <leader>ff :FufFile<CR>
"let g:CommandTMatchWindowAtTop=1
"}}}
"{{{GUNDO
Bundle 'sjl/gundo.vim'
"}}}
Bundle 'tomtom/tcomment_vim'
"map cb :TCommentBlock<cr>
" map ci :TCommentInline<cr>
"map cr :TCommentRight<cr>

"testing
"Bundle 'ujihisa/quickrun'
"Bundle 'tomtom/checksyntax_vim'
"Bundle 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = 'f'


"" vim-scripts repos
"Bundle 'rails.vim'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'jQuery'
Bundle 'lilydjwg/csspretty.vim'
Bundle 'matchit.zip'
Bundle 'kchmck/vim-coffee-script'
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
" lookup
"nmap <unique> <silent> <A-S-L> <Plug>LookupFile
"Note:install by manual
"Bundle 'css_color.vim'
"Bundle 'vimwiki'

set rtp+=~/.vim/vimwiki/
set rtp+=~/.vim/git/ColorV
filetype plugin indent on     " required!

"Bundle 'rykka/colorizer'
aug plugin_Filetype
    autocmd!
    "autocmd Filetype html silent call colorizer#enable()
aug END
"}}}
"Basic Setting"{{{
set nocompatible
syntax on
filetype plugin indent on
"history
"the browse window's directory
set browsedir=buffer
set history=255
" Tell vim to remember certain things when we exit
set viminfo='100,\"30,:30,s10
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
set rulerformat=%15(%c%V\ %p%%%)
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
set foldlevel=99   "don't auto fold 
set foldlevelstart=1
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldclose=
"set foldopen=all
set foldminlines=1
"set foldclose=all

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
"{{{ Guifont And Color
if has("gui_running")
    if has ("win32")
        set guifont=Courier_New:h13:cANSI
        "set gfw=Yahei_Mono:h12:cGB2312
    endif
        if has("gui_gtk2")
            set guifont=Monospace\ 14,Fixed\ 14
            set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 14,WenQuanYi\ Zen\ Hei\ 14
    endif

endif
"Call After Colorscheme And Sourcecmd "{{{

fun! Color_Modify()
    "all
    "hi Search           guifg=NONE guibg=NONE   gui=underline
    "hi IncSearch        guifg=NONE guibg=NONE   gui=underline
    "hi comment          gui=italic
    "hi colorcolumn     ctermbg=5 guibg=#666
    if exists("g:colors_name")
        if g:colors_name=="molokai" "{{{
            hi Normal          guifg=#b8b8b2 guibg=#111111
            hi NonText         guifg=#AAAAAA guibg=#111111

            hi StatusLine      guifg=#808070 guibg=#080808
            hi StatusLineNC    guifg=#404040 guibg=#080808
            hi VertSplit       guifg=#080808 guibg=#404040 gui=bold

            hi tabline         guifg=#808070 guibg=#111111
            hi tablinesel      guifg=#111111 guibg=#888870 gui=bold,underline
            hi tablinefill     guifg=#111111 guibg=#111111

            hi FoldColumn      guifg=#555555 guibg=#111111
            hi Folded          guifg=#998775 guibg=#191919 
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
        if g:colors_name=="kellys" "{{{
            "~/.vim/colors/kellys.vim
            "hi normal           guifg=#999  
            "hi cursor           guifg=#111  guibg=#999
            "hi colorcolumn      guibg=#333
            "hi search           guifg=fg guibg=bg
            "hi incsearch        guifg=fg guibg=bg

            "hi FoldColumn       guifg=#365b64   guibg=#333
            "hi Folded           guifg=#467b94   guibg=#333      gui=none
            "hi StatusLine 	guifg=#2a2b2f	guibg=#999	gui=bold
            "hi StatusLineNC     guifg=#999	guibg=#555	gui=none

            "hi visual           guibg=#3a3b3f   gui=none     
            "hi underlined        guifg=#888

            "hi tabline         guifg=#467b94 guibg=#111111 gui=underline
            "hi tablinesel      guifg=#467b94 guibg=#2a2b2f gui=bold
            "hi tablinefill     guifg=#111111 guibg=#111111

            "hi wildmenu         guifg=#3399ff           gui=bold
            "hi pmenu            guifg=#111 guibg=#789
            
            "hi modemsg          guifg=#fc0
            "hi errormsg         guifg=#d30  guibg=#4a2b2f gui=bold
            "hi error            guifg=#9d0e15 guibg=#4a2b2f gui=bold
            "hi string           guifg=#ccaa77
            
            "hi PreProc          guifg=#997733

            "hi diffAdd          guibg=#262e40
            "hi diffDelete       guifg=#444444 guibg=#402626
            "hi diffChange       guibg=#54524b
            "hi DiffText         guibg=#402626

            "TOD
            " StatusLine Color
            " tabline Color
            " pluginze
            " easy deined color
            " ~/.vim/colors/kellys.vim
        endif "}}}
        if g:colors_name=="solarized" "{{{
            hi normal           guifg=#626262 guibg=#cecece
            hi folded           guibg=#d9d7d6 gui=underline
            hi colorcolumn      guibg=#d9d7d6
            hi foldcolumn       guibg=#d9d7d6
        endif "}}}
    endif
endfun "}}}
"colorscheme
if has("gui_running") 
    "let $colorscheme_n="desert"
    "let $colorscheme_n="molokai"
    "let $colorscheme_n="pyte"
    "let $colorscheme_n="solarized"
    "let $colorscheme_n="clarity"
    let $colorscheme_n="kellys"
    colorscheme $colorscheme_n
    call Color_Modify()
else
    let $colorscheme_n="desert"
    colorscheme $colorscheme_n
endif
map <leader>ct :call Toggle_colorscheme()<cr>
fun! Toggle_colorscheme()
    " TODO change the colorsheme with file in folder
"if     exists("g:colors_name")
    "if g:colors_name=="solarized"
        "colorscheme molokai
        "call Color_Modify()
    "elseif  g:colors_name=="molokai"
        "colorscheme cl
        "set background="light"
        "call Color_Modify()
    "endif
"endif
endf
"menu
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
     "Always show file types in menu
    let do_syntax_sel_menu=1
endif
"statusline
set statusline=%2*%n.%*[%03l,%02c,%P]%<%F%1*%m%r%*\%=[b%b][%W%Y,%{&enc},%{&ff}]
"hi User1 ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE gui=bold,underline
"}}}
"Term Color "{{{
if has("gui_running")
else
  set ambiwidth=single
  hi colorcolumn ctermbg=5 
  " 防止退出时终端乱码
  " 这里两者都需要。只前者标题会重复，只后者会乱码
  set t_fs=(B
  set t_IE=(B
    if &term =~ "xterm"
      silent !echo -ne "\e]12;Grey\007"
      let &t_SI="\e]12;RoyalBlue1\007"
      let &t_EI="\e]12;Grey\007"
      autocmd VimLeave * :!echo -ne "\e]12;green\007"
    endif
endif "}}}

" 1.2.Misc_Settin
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

set nopaste
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
set iskeyword+=_,$,@,% 
set iskeyword-=# 
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
    set colorcolumn=79

    if !isdirectory(expand('~/.vim_undo'))
      call mkdir(expand('~/.vim_undo'))
    endif
    set undofile
    set undodir=~/.vim_undo/


    " always SHOW conceal text
    set conceallevel=3

    " conceal text in the cursor line in the modes
    "n Normal v Visual i Insert c Command
    set concealcursor=ncv
    "syntax match Entity "\[" conceal cchar=[
    "syntax match Entity "\]" conceal cchar=]
    hi Conceal guifg=fg guibg=black
endif "}}}

" 2.AutoCmd_Group{{{1
aug vimrc_GuiEnter "{{{
    au! vimrc_GuiEnter
    "au GUIENTER * cd ~/Documents/vim
    "au GUIENTER * e ~/Documents/vimwiki/Todo/TodoToday.vwk
    "au GUIENTER *.vwk set filetype=vimwiki
    "au GUIEnter * VimwikiIndex
    au GuiEnter * set t_vb=
    au GuiEnter * winpos 331 0
    au GuiEnter * winsize 80 100
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
    au FileType snippet setlocal expandtab
    "endif
aug END "}}}
aug htmls "{{{
    au! htmls
    " Autoclose tags on html, xml, etc
    au FileType php,html,xhtml,xml imap <buffer> <C-m-b> </<C-X><C-O>
    au Filetype php,html,xhtml,xml set shiftwidth=4 softtabstop=4
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
aug color_modify "{{{
    au! color_modify
    au! FileType vimwiki call Vimwiki_color()
    au! colorscheme * call Color_Modify()
    au! colorscheme *.vwk call Vimwiki_color()
aug END

fun! Vimwiki_color() "{{{
if exists("g:colors_name")
    if &bg=="dark"
        hi VimwikiHeader1 guifg=#D0D090 gui=bold
        hi VimwikiHeader2 guifg=#9BC97E gui=bold
        hi VimwikiHeader3 guifg=#4FB16F gui=bold
        hi VimwikiHeader4 guifg=#4E83AE gui=bold
        hi VimwikiHeader5 guifg=#8889BA gui=bold
        hi VimwikiHeader6 guifg=#A365B7 gui=bold
        hi VimwikiLIst guifg=#bb9
    else
        hi VimwikiHeader1 guifg=#979730 gui=bold
        hi VimwikiHeader2 guifg=#6D9730 gui=bold
        hi VimwikiHeader3 guifg=#349730 gui=bold
        hi VimwikiHeader4 guifg=#30978F gui=bold
        hi VimwikiHeader5 guifg=#453097 gui=bold
        hi VimwikiHeader6 guifg=#793097 gui=bold
        hi VimwikiLIst guifg=#665
    endif
endif

hi vimwikibold guifg=#aa9

syn match VimwikishortTimeStamp /<\d\d\d\d-\d\d\d\d>/
    "let rx_minstamp='\%(\d\{4}_\d\{4}\|\d\{6}_\d\{4}\|\d\{6}\)'
syn match VimwikiminTimeStamp /\%(\d\{4}_\d\{4}\|\d\{6}_\d\{4}\|\d\{6}\)/
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

" FIXED: 0504_0052  using \@<! and \@! to match with zerowidth;
syn match Vimwiki_Prio9 /\S\@<!\(+9\|\[+9\]\)\S\@!/
syn match Vimwiki_Prio8 /\S\@<!\(+8\|\[+8\]\)\S\@!/
syn match Vimwiki_Prio7 /\S\@<!\(+7\|\[+7\]\)\S\@!/
syn match Vimwiki_Prio6 /\S\@<!\(+6\|\[+6\]\)\S\@!/
syn match Vimwiki_Prio5 /\S\@<!\(+5\|\[+5\]\)\S\@!/
syn match Vimwiki_Prio4 /\S\@<!\(+4\|\[+4\]\)\S\@!/
syn match Vimwiki_Prio3 /\S\@<!\(+3\|\[+3\]\)\S\@!/
syn match Vimwiki_Prio2 /\S\@<!\(+2\|\[+2\]\)\S\@!/
syn match Vimwiki_Prio1 /\S\@<!\(+1\|\[+1\]\)\S\@!/
syn match Vimwiki_Prio0 /\(^\s*\|.*\s\)\(+0\|\[+0\]\)\(\s*$\|\s.*\)/

syn match Vimwiki_minus9 /\S\@<!\(-9\|\[-9\]\)\S\@!/
syn match Vimwiki_minus8 /\S\@<!\(-8\|\[-8\]\)\S\@!/
syn match Vimwiki_minus7 /\S\@<!\(-7\|\[-7\]\)\S\@!/
syn match Vimwiki_minus6 /\S\@<!\(-6\|\[-6\]\)\S\@!/
syn match Vimwiki_minus5 /\S\@<!\(-5\|\[-5\]\)\S\@!/
syn match Vimwiki_minus4 /\S\@<!\(-4\|\[-4\]\)\S\@!/
syn match Vimwiki_minus3 /\S\@<!\(-3\|\[-3\]\)\S\@!/
syn match Vimwiki_minus2 /\S\@<!\(-2\|\[-2\]\)\S\@!/
syn match Vimwiki_minus1 /\S\@<!\(-1\|\[-1\]\)\S\@!/
syn match Vimwiki_minus0 /\(^\s*\|.*\s\)\(-0\|\[-0\]\)\(\s*$\|\s.*\)/

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
iab todo: TODO:
iab done: DONE:
iab fixme: FIXME:
iab fixed: FIXED:
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.
inorea mdash &nbsp;&mdash;
inorea nbsp &nbsp;
inorea <<< &lt;
inorea >>> &gt;
inorea =-> &rarr;
inorea <-= &larr;
iab stime <<C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>>
iab ttime <C-R>=strftime("%y%m%d_%H%M")<CR>
iab dtime <C-R>=strftime("%y-%m-%d %H:%M:%S")<CR>
iab ftime <C-R>=strftime("%y-%m-%d_%H.%M.%S.txt")<CR>
"}}}
" 4.Key_Mapping_General{{{1
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
"nmap <f1> :VimwikiIndex<cr>
"nmap <c-f1> :FufHelp<CR>
nmap <leader>hh :h <C-R>=expand("<cword>")<CR><CR>
nmap <F1> :h <C-R>=expand("<cword>")<CR><CR>
"map <F1> :call Split_if("")<CR><Plug>VimwikiIndex
nmap <s-F1> :!man <C-R>=expand("<cword>")<CR> <CR>

"Find "{{{
"map <s-F2> :FufLine<CR>
map <s-F2> :Ack <C-R>=expand("<cword>")<CR>
vnoremap <s-F2> "sy<c-l>:Ack "<c-r>s"

" replace word under cursor
nmap <F2> :%s/<C-R><C-W>/<C-R><C-W>/gc<Left><Left><Left>
" replace selection
vnoremap <F2> "sy<esc><c-l>:%s/<c-r>s/<c-r>s/gc<Left><Left><Left>
"vnoremap <C-C> "+y
"}}}
"map <silent> <F3> :FufBuffer<CR>
map <F3> :Unite buffer<CR>

"noremap <F4> :NERDTreeToggle "expand('%:p:h')"<CR>
"nmap <F4> :FufFile<CR>
nmap <F4> :CommandT<CR>
map <s-F4> :Explore<CR>

"it have errors ,many
"nmap <silent> <F5> :QuickRun<CR>
"map <silent> <s-F5> :VimShellPop<cr>
nmap <F5> :SCCompileRun<cr>
call SingleCompile#ChooseCompiler('html', 'firefox')

nmap <silent> <s-F5> :call Exe_cur_script("norm")<CR>
vmap <silent> <F5> :call Exe_cur_script("visual")<CR>
"command -range -nargs=1 EXEC calll Exe_cur_script(<args>)
function! Exe_cur_script(mode) "{{{
" TODO mac /win /linux check (kde,gnome ,)
" define the cmd by user
" TODO Pluginize: a cmd window to choose :sudo/norm
" choose visual/line , file
" debug mode
" compile chmod make
if expand("%") == ""
    return -1
endif
"let priv=input("Sudo:s|Normal:n\n")
"if priv=="s"
    "let b_cmd="!sudo "
"elseif priv=="n" 
    "let b_cmd="!"
"else
    "echo   "no correct input"
    "return -1
"endif

let b_cmd="!"
let browser = "firefox "
let term = "gnome-terminal "
let runner="gnome-open "
let win_runner="start "
let err_log=" 2>&1 | tee /tmp/.runtmp"

if a:mode=="norm"
	" FIXME: error of the file name wrapping ?
    let file=" ".expand('%:p').""
elsei a:mode=="visual"
    "let firstLine = line("'<")
    "let lastLine = line("'>")
    "let rng_list=getline(firstLine,lastLine)
    "let rng=""
    let rng=getline('.')
endif
if !exists("b:current_syntax")
    if has("unix") 
        exec b_cmd.runner.file
    else  
        exec b_cmd.file 
    endif
    return 0
endif
if exists("b:current_syntax")
    let syn=b:current_syntax
    if syn=="python" 
        exec b_cmd."python -d ".file.err_log
    elsei syn=~'^vim$'
        if a:mode=="norm"
            exec "so ".file
        elseif a:mode=="visual"
            "for item in rng_list
                "let rng.= item." \| "
            "endfo
            "let rng.="1sleep"
            exec rng
        endif
    elsei syn=~'html'
        exec b_cmd.browser.file
    elsei syn =~'^\(sh\|expect\|bash\)$'
        if a:mode=="norm"
            exec b_cmd.term." -x bash ".file
        else
            "for item in rng_list
                "let rng.= item." && "
            "endfo
            "let rng.= "sleep 1"
            exec b_cmd.term." -x bash -c ".rng
        endif
    elsei syn=~'^bat$'
        exec b_cmd.win_runner."cmd -e".file 
    endif

elsei has("unix") 
    exec b_cmd.runner.file
else  
    exec b_cmd.win_runner.file 
endif

endf "}}}

map <F6> :TagbarToggle<CR>

map <F7> :GundoToggle<CR>

"{{{ start from here
map <silent><F8> :call Start_File_explore()<CR>  
map <silent><s-F8> :call Start_terminal()<CR>
fun! Start_File_explore()
    if expand("%:p:h") != ""
        if has("win32")
            exec "!start explorer '%:p:h'"
        else
            "exec "!gnome-commander -l '%:p:h'"
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
"}}}
"""session save /load "{{{
nmap <s-F12> :call SaveSession()<CR>
"nmap <s-F12> :1,$bd <bar> so ~/.vim/sessions/
nmap <F12> :Unite session<cr>
set sessionoptions=buffers,curdir,help,tabpages,winsize,resize
function! SaveSession()
  wall
    let ses = strftime("%y%m%d_%H%M%S")
    try
        exe "mksession! "."~/.vim/sessions/".ses
        echomsg "mks success! session file : ".ses
    catch /^vim\%((\a\+)\)\=:/
        echoe "mks failure! error: " .v:exception
    endtry
endfunction 
"}}}

"}}}
" 4.1.Leader_Mapping
"Mapleader "{{{
let mapleader = " "
let maplocalleader = ","
"let maplocalleader = "\\"

nnoremap ; :
vnoremap ; <c-c>:
vnoremap : <c-c>:

nnoremap ' .
"noremap q: <nop>
"no ex mode
noremap Q <nop>

vnoremap . <Nop>
vnoremap , <Nop>

nnoremap <leader> <Nop>
vnoremap <leader> <Nop>

"noremap aa <nop> 

" Nop mapping
nmap s %
"vmap s %
nnoremap S <Nop>
nnoremap c <Nop>
nnoremap C <Nop>
nnoremap <m-x> <c-a>
"}}}
"Edit .vimrc and other files <leader>XX"{{{
map <silent><leader>vv :call Split_if("") \| e ~/.vimrc<CR>
" map <silent><leader>vgv :call Split_if("v") \| e ~/Documents/git/.vimrc<CR>
map <silent><leader>vgv :call DiffOrig("~/.vimrc","~/Documents/git/.vimrc")<cr>
map <leader>vd :e ~/.vim/ <CR>
map <silent><leader>vb :call Split_if("") \| e ~/.bashrc<CR>
map <silent><leader>vp :call Split_if("") \| e ~/.pentadactylrc<CR>
map <silent><leader>vc :call Split_if("") \| e ~/.conkyrc<CR>
map <silent><leader>va2 :call Split_if("") \| e ~/.aria2/aria2.conf<CR>
map <silent><leader>vax :call Split_if("") \| e ~/.axelrc<CR>
map <silent><leader>vsp :call Split_if("s",10) \|e ~/Documents/vimwiki/Ref/ShuangPin.vwk<CR>

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
            call ChkWin(0)
            exe "vsplit"
        elseif a:1=="t"
            exe "tabnew"
        elseif a:1=="s"
            exe "to split"
        elseif a:1==""
            return
        endif
    else
        return
    endif

    if exists("a:2")
            "echoe a:2
    	exe "resize ".a:2
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
nmap <leader>da :1,$+1diffget<cr>
map <silent> <leader>do :call DiffOrig()<CR>
command! DiffOrig win 151 100 | vert new | setl bt=nofile | r # | 0d_
            \ | diffthis | setl noma
            \ | wincmd p | diffthis
function! DiffOrig(...)
    if exists("a:1") 
        exec "e ".a:1
    endif
    let syn=&syntax
    call Split_if("v")
    if !exists("a:2")
        enew | setl bt=nofile  | r # | 0d_ 
        exec "set syn=".syn
        setl ro 
    else 
    	exec "e ".a:2 
    endif

    diffthis
    wincmd p | diffthis

endfunction
"}}}
"Toggle Folding And Foldmethod  "{{{
"noremap <silent> <leader> zA
" I want foldmarkers to be applied with space before a comment.
nnoremap <silent> zf :set opfunc=MyFoldMarker<CR>g@
vnoremap <silent> zf :<C-U>call MyFoldMarker(visualmode(), 1)<CR>
vnoremap <silent> <leader><leader> :<C-U>call MyFoldMarker(visualmode(), 1)<CR>zv
"noremap <silent> <2-leftmouse> @=(foldlevel('.')?'za':'<2-leftmouse>')<CR>
nnoremap <silent> <leader><leader> @=(foldlevel('.')?'za':'')<CR>
nnoremap <silent> <leader>zz @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>ZZ @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>aa @=(&foldlevel?'zM':'zR')<CR>
nnoremap <silent> <leader>AA @=(&foldlevel?'zM':'zR')<CR>
"nnoremap f za
"nnoremap F zA
"auto folding
map <silent><leader>fa :if &fcl=="" 
            \\| setl fcl+=all fdo+=all
            \\| exec "normal! zM" 
            \\| echo "auto fold"
            \\| else 
            \\| setl fcl-=all fdo-=all
            \\| echo "no auto fold"
            \\| endif<cr>

map <silent><leader>fm :if &foldmethod == 'marker' 
            \\| setl foldmethod=indent  
            \\| echo "setl fdm=indent"
            \\| elseif &foldmethod=='indent'  
            \\| setl foldmethod=syntax 
            \\| echo "setl fdm=syntax"
            \\| elseif &foldmethod=='syntax'  
            \\| setl foldmethod=expr 
            \\| echo "setl fdm=expr"
            \\| elseif &foldmethod=='expr' 
            \\| setl foldmethod=marker 
            \\| echo "setl fdm=marker"
            \\| endif <CR>
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
map <silent> <leader>cp :let @+=expand('%:p:h')<CR>
"map <silent> <leader>cp :let @+=g:<CR>
"Copy current variables
command! -nargs=1 -complete=var Cvar let @+=<args>

"Keymapping Of Gtd
map<silent> <Leader>ntd :TinyTodo<CR>
command! TinyTodo call TinyTodo()
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
nmap <leader>1vm :set ft=vim<CR>
nmap <leader>1wk :set ft=vimwiki<CR>
nmap <leader>1sh :set ft=sh<CR>

nmap <leader>1ht :set ft=html.php<CR>
nmap <leader>1cs :set ft=css<CR>
nmap <leader>1js :set ft=javascript<CR>
nmap <leader>1ph :set ft=php.html<CR>

nmap <leader>1cp :set ft=cpp<CR>
nmap <leader>1py :set ft=python<CR>

nmap <leader>11 :filetype detect \| syntax enable \| call Color_Modify() <CR>
"nmap <leader>`` :filetype detect \| syntax enable \| so $MYVIMRC<CR>

"use menu syntax
nmap <leader>1me  :emenu Syntax.
"nnoremap <silent> <leader>1 :nohl<CR>
" DONE: 110519 clear all hlsearch without warningmsg
nnoremap <silent> <C-L> :nohl<CR><C-l>:s/^^//e<cr>
"}}}

" 4.2.Window_control_mapping
"Window Mapping  <C-W> "{{{
nmap <C-W>1 <C-W>_
nmap <C-W>2 <C-W>=
nmap <C-W>3 :call ChkWin(-3)<cr>
nmap <C-W>4 :call ChkWin(2)<cr>
"nmap <C-W><C-W> <C-W>=<C-W>w
nmap <C-W>5 :call NavBuff("list")<cr>
"nnoremap <C-e><c-r> :bnext<CR>
"nnoremap <C-e>r :bnext<CR>
"nnoremap <C-e><c-w> :bprevious<CR>
"nnoremap <C-e>w :bprevious<CR>
nnoremap <C-w><c-d> :bnext<CR>
nnoremap <C-w>d :bnext<CR>
nnoremap <C-w><c-f> :bprevious<CR>
nnoremap <C-w>f :bprevious<CR>

"nmap <C-e><C-W> :call NavBuff("next")<cr>
"nmap <C-e><c-e> :call NavBuff("prev")<cr>
"buffer and window navigation
"nmap <C-W><C-W> :call NavBuff("next")<cr>
"nmap <C-W><c-e> :call NavBuff("prev")<cr>
nnoremap <C-W><c-r> <c-^>
nmap <C-W><c-b> :call NavBuff("list")<cr>
nmap <C-W><c-tab> :call NavBuff("list")<cr>
nmap <C-W><tab> :call NavBuff("list")<cr>

fun! NavBuff(act)
    if a:act=="next"
    	exe winnr('$')==1 ? "bnext" : "normal \<C-W>w"
    endif
    if a:act=="prev"
    	exe winnr('$')==1 ? "bprevious" : "normal \<C-W>W"
    endif
    if a:act=="list"
    	exe winnr('$')<=4 ? "CommandTBuffer" : "Unite window "
    endif
endfun

"dont close last window , use :Q OR 
nmap <silent> <C-W><c-q> :call ChkWin(-2)\|hid<CR>
nmap <silent> <C-W>q :call ChkWin(-2)\|hid<CR>
nmap <silent> <C-W><c-x> :call ChkWin(-2)\|q<CR>
nmap <silent> <C-W>x :call ChkWin(-2)\|q<CR>
"buffer in current window
"nmap <C-W><c-d> :call ChkWin(-2)\|:bd<CR>
"delete buffer not window,until the same buffer with window
nmap <C-W><c-e> :bp\|vsp\|bn\|bd<cr>
nmap <C-W>e :bp\|vsp\|bn\|bd<cr>
"nmap <C-W>d :call ChkWin(-2)\|:bd<CR>
nmap <C-W><c-u> :bp\|vsp\|bn\|bun<CR>
nnoremap <C-W><c-n> :bnext<CR>
nnoremap <C-W>n :bnext<CR>
nnoremap <C-W><c-p> :bprevious<CR>
nnoremap <C-W>p :bprevious<CR>
"nav tab
nnoremap <silent> <C-W><c-g> gt
"}}}
"Window Width(Columns) Configure"{{{
nnoremap <silent> <C-W><c-v> :call ChkWin(0)\|vs<cr>gf
"nmap <silent> <C-W><c-s> :call ChkWin(-1)\|new<CR>
nnoremap <silent> <C-W><c-s> :sp<CR>gf
nnoremap <silent> <C-W><c-t> :call ChkWin(-2)<CR><C-W>Tgf

nmap <silent> <C-W><c-h> :call ChkWin(2)<CR><C-W>H
nmap <silent> <C-W><c-l> :call ChkWin(2)<CR><C-W>L
nmap <silent> <C-W><c-j> :call ChkWin(-2)<CR><C-W>J
"nmap <silent> <C-W><c-k> :call ChkWin(-2)<CR><C-W>K

nmap <expr><C-W><c-k> ChkWin(-2)."\<c-w>K"
"command! -bar -nargs=1 Chkwin call ChkWin(<args>)
"command! -bar -nargs=1 ChkCurWin call ChkWin(<args>)
fun! ChkWin(num) "{{{
    let col =80
    " if plus sign, set to >= if minus, set to <=
    if a:num>=0
        " if winnr>= num set column
        if winnr("$")>=a:num
            if &co!=col*2+1 | let &co=col*2+1 | endif
        endif
    elseif a:num<0
        " if winnr<= abs(num) set column
        if winnr("$")<=abs(a:num)
            if &co!=col | let &co=col | endif
        endif
    endif
endfun "}}}


    "}}}
" 4.3.move_around_mapping
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
noremap <silent> <m-e> e
noremap <silent> <m-f> b
noremap <silent> <m-b> b

nnoremap f b
nnoremap F B
inoremap <c-f> <c-o>dw

noremap <c-f> <c-u>
noremap <c-u> <c-f>

inoremap <silent> <m-w> <c-right>
inoremap <silent> <m-e> <c-right>
inoremap <silent> <m-f> <c-left>
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
" jump to next in normal mode
" Rating: 5 
"the snipmate complete
nmap <c-j> a<c-j>
nmap <c-k> a<c-k>
"noremap <leader> 5j
"noremap <c-j> 5j
" just one space on the line, preserving indent
"nmap <Up>   gk
nnoremap k      gk
"visual !select <Up>   gk
xnoremap k      gk
"nmap <Down> gj
nnoremap j      gj
"visual !select map <Down> gj
xnoremap j      gj

" <s-h> <s-l>
nnoremap H B
nnoremap L W

" i_c-h is <bs> , so:
" inoremap <c-l> <del>
noremap <c-h> K

"imap <c-l> <esc><ctrl-l>
"imap <c-h> <esc><ctrl-h>

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

"conflict with plugin vimwiki
"nnoremap <C-Tab> gt
"nnoremap <C-S-Tab> gT 

"add new line
noremap <S-CR> o<ESC>
noremap <S-Kenter> o<ESC>
"join line with line above
nnoremap <c-CR> kJ 
nnoremap <c-Kenter> kJ 
"format line in visual mode
vnoremap <C-CR> gq
vnoremap <C-Kenter> gq

"search selected text and go next
" Rating: 7
" the search backword/forward was wrong side??
vnoremap <c-n> "sy<c-c>?<c-r>s<cr><ctrl-g>
vnoremap / "sy<c-c>/<c-r>s<cr><ctrl-g>
vnoremap ? "sy<c-c>?<c-r>s<cr><ctrl-g>
vnoremap # "sy<c-c>?<c-r>s<cr><ctrl-g>
vnoremap * "sy<c-c>/<c-r>s<cr><ctrl-g>
nnoremap <c-n> n
"search for none exist before / after
vnoremap <leader>/ "sy<c-c>/\(\)\@<!<c-r>s<Home><right><right>
vnoremap <leader>? "sy<c-c>/<c-r>s\(\)\@!<left><left><left><left><left>

"nnoremap # n
"nnoremap * n
"mousewheel go around
if v:version < 703
    nmap <silent> <m-MouseDown> zhzhzh
    nmap <silent> <m-MouseUp> zlzlzl 
    vmap <silent> <m-MouseDown> zhzhzh
    vmap <silent> <m-MouseUp> zlzlzl
    map <MouseUp> 3k
    map <MouseDown> 3j
    map <s-MouseUp> 30k
    map <s-MouseDown> 30j

    "use scroll to indent
    nnoremap <c-MouseDown> >>
    nnoremap <c-MouseUp> <<
    vnoremap <c-MouseDown> >gv
    vnoremap <c-MouseUp> <gv
else
    map <m-ScrollWheelDown> <ScrollWheelRight>
    map <m-ScrollWheelUp> <ScrollWheelLeft>
    imap <m-ScrollWheelDown> <ScrollWheelRight>
    imap <m-ScrollWheelUp> <ScrollWheelLeft>
    map <scrollwheelup> 3k
    map <scrollwheeldown> 3j
    map <s-scrollwheelup> 30k
    map <s-scrollwheeldown> 30j

    "use scroll to indent
    nnoremap <c-scrollwheeldown> >>
    nnoremap <c-scrollwheelup> <<
    vnoremap <c-scrollwheeldown> >gv
    vnoremap <c-scrollwheelup> <gv
endif


"}}}

" 4.4.Edit_and_formatting
" Easy Editing Modify "{{{
" make p in Visual mode replace the selected text with the yank register
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"as D
nnoremap Y y$

"change case <m-s>
nnoremap <m-s>1 gUU
nnoremap <m-s>2 guu
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
nmap <m-s>3 :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
" Capitalize inner word
nmap <m-s>c guiw~w
" UPPERCASE inner word
nmap <m-s>e gUiww
" lowercase inner word
nmap <m-s>w guiww
nmap <m-s><m-s> ~

"trim whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>:let @/=''<CR>

nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

"}}}
"Quick Wrapping "{{{
" text object : i/a  w/s/p/{/</'"`/t/
" iw :inner word ; aw : a word with white space
" //e: last search pattern
"surrond.vim: cs ds ys v_s i_<c-g>s
"visualize selection
nnoremap <leader>sl ^v$
"use the remaped % ^ 'matchit'
nmap <leader>ss vg%e
"vmap v <c-g>
"vmap s <c-g>vgS
nnoremap <Leader>e} ciw{{{<C-r>"}}}<ESC>
vnoremap <Leader>e} c{{{<C-r>"}}}<ESC>`[
nnoremap <Leader>e] ciw[[<C-r>"]]<ESC>
vnoremap <Leader>e] c[[<C-r>"]]<ESC>`[

"php
nnoremap <leader>ep ciw<?php <C-r>" ?><ESC>
vnoremap <Leader>ep c<?php <C-r>" ?><ESC>`[
"" html comment
nnoremap <leader>e! ciw<!-- <C-r>" --><ESC>
vnoremap <Leader>e! c<!-- <C-r>" --><ESC>`[
"}}}

nnoremap <leader>et o" TODO: <esc>
nnoremap <leader>ef o" FIXME: <esc>
nnoremap <leader>ew o" WONTFIX: <esc>
nnoremap <leader>ex o" XXX: <esc>

"Formating "{{{
"alignment of text
nmap <leader>ll :left<CR>
nmap <leader>lr :right<CR>
nmap <leader>lc :center<CR>

"make vimwiki list
nm <leader>l1 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1* /e<CR>
nm <leader>l2 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1# /e<CR>
nm <leader>l3 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\1- /e<CR>
nm <leader>l4 :s/^\(\s*\)\%([*#-]\s\)\=\ze.*/\11. /e<CR><c-l>

nnoremap <leader>l=2 yyPVr=jyypVr=
nnoremap <leader>l*2 yyPVr*jyypVr*
nnoremap <leader>l= yypVr=
nnoremap <leader>l- yypVr-
nnoremap <leader>l^ yypVr^
nnoremap <leader>l" yypVr"
"nnoremap __ "zyy"zp<c-v>$r-
"nnoremap ++ "zyy"zp<c-v>$r=
" Use Q for formatting the current paragraph (or visual selection)
"nmap Q gqap
"vnoremap <C-CR> gq
"段落后添加空行
"map <M-q><M-l> <ESC>:.s/\([.!?"。！？”—）]\)$/\1\r/g<CR>

"}}}

" 4.5.win_behave_settings (yank and pasting)
"{{{ Behave Win And Menu
if has('gui_running')
    behave mswin
    source $VIMRUNTIME/mswin.vim
endif "}}}
"{{{ Win_behav Mapping modify
vnoremap <c-d> "+x
"vnoremap <C-X> "+x
vnoremap <C-m-X> "+x  " often no cut contentat all

"}}}
"open fold while undo /redo "{{{
noremap <C-Z> uzv
inoremap <C-Z> <C-O>u<C-O>zv
"no action in visual mode
vnoremap <C-Z> <esc>
noremap <C-Y> <C-R>zv
inoremap <C-Y> <C-O>U<C-O>zv

" Not "+gP 
map <C-V>		"+gp
map <S-Insert>		"+gp
"}}}
"5.Plugins_settings{{{1
"Unite Settings "{{{
"noremap <leader>ww :Unite file bookmark<CR>
noremap <m-d><m-d> :Unite file bookmark -input=.<CR>
noremap <m-d><m-t> :Unite tab window<CR>
noremap <m-d><m-b> :Unite buffer<CR>
noremap <m-d><m-r> :Unite file_mru directory_mru<CR>
noremap <m-d><m-e> :Unite register<CR>
noremap <m-d><m-s> :Unite source<CR>
noremap <m-d><m-i> :Unite session<CR>
noremap <m-d><m-c> :Unite colorscheme<CR>

let g:unite_winheight=10

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
let g:neocomplcache_enable_smart_case = 0
let g:neocomplcache_enable_ignore_case = 0
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
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
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" TODO add Always Quick Match Option
"let g:neco_always_quick_match=1
let g:neocomplcache_enable_quick_match=1
let g:neocomplcache_quick_match_patterns={'default':'`'}
"let g:neocomplcache_quick_match_patterns={'default':''}
"inoremap <expr><space> pumvisible() ? neocomplcache#smart_close_popup() : "\<space>"
inoremap <expr><space> pumvisible() ? "\<c-n>\<c-p>\<space>" : "\<space>"
"inoremap <expr><space> pumvisible() ? "\<c-n>\<c-p>".
            "\neocomplcache#smart_close_popup() : "\<space>"
let g:neocomplcache_quick_match_table = {
        \'1' : 0, '2' : 1, '3' : 2, '4' : 3, '5' : 4, '6' : 5, '7' : 6, '8' : 7, '9' : 8, '0' : 9,
        \} 
" Plugin key-mappings.
imap <expr><C-k>  pumvisible() ? neocomplcache#smart_close_popup() :   
            \ "\<Plug>(neocomplcache_snippets_expand)"
smap <expr><C-k>  pumvisible() ? neocomplcache#smart_close_popup() :   
            \ "\<Plug>(neocomplcache_snippets_expand)"
imap <expr><c-j>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_jump)"
smap <expr><c-j>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_jump)"

inoremap <expr><C-g>     neocomplcache#undo_completion()

inoremap <expr><CR> pumvisible() ?
            \ neocomplcache#smart_close_popup() : "\<CR>"

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


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
let rx_prio='\%([+-]\d\|\[[+-]\d\]\)'
let rx_num_seq='\%(\d\+[\.)]\)\+'
let g:vimwiki_rxListNumber = '^\s*\%('.rx_prio.'\|'.rx_num_seq.'\)\s'
execute 'syntax match VimwikiList /'.g:vimwiki_rxListBullet.'/'
execute 'syntax match VimwikiList /'.g:vimwiki_rxListNumber.'/'

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
    nmap <silent><buffer> <TAB> <Plug>VimwikiNextLink
    "inoremap <expr> <buffer> <Tab> vimwiki_tbl#kbd_tab()


    inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
    "tab with 2 space sts sw
    setl shiftwidth=2 softtabstop=2
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
"Git "{{{
nmap  <leader>ga :Git add %<cr> 
nmap  <leader>gc :Gcommit<cr> 
nmap  <leader>gd :Gsdiff 
nmap  <leader>gk :Git checkout 
nmap  <leader>gr :Git branch  
nmap  <leader>gp :Git push<cr>

"}}}
"Misc Plugins Settings "{{{
"   syntax/vim.vim 默认会高亮 s:[a-z] 这样的函数名为错误
let g:vimsyn_noerror = 1
"nmap <leader>cah :CalendarH<CR>

"let g:NERDTreeChDirMode=2
"noremap <m-w><m-w> :NERDTreeToggle "expand('%:p:h')"<CR>

let g:ColorV_dynamic_hue=1
let g:ColorV_show_tips=0
let g:ColorV_name_approx=6

let g:user_zen_leader_key = '<c-e>'
"let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
  \    'indentation' : '    '
  \}

let g:user_zen_expandabbr_key = '<c-e>e'    "e
let g:user_zen_expandword_key = '<C-E>E'    "e
    "'user_zen_balancetaginward_key'        "d
    "'user_zen_balancetagoutward_key'       "D
let g:user_zen_next_key='<c-e>j'            "n
let g:user_zen_prev_key='<c-e>k'            "p
    "'user_zen_imagesize_key'               "i
    "'user_zen_togglecomment_key'           "/
    "'user_zen_splitjointag_key'            "j
let g:user_zen_removetag_key='<c-e>d'       "k
    "'user_zen_anchorizeurl_key'            "a
    "'user_zen_anchorizesummary_key'        "A
map <leader>tt :CommandT<CR>
map <leader>ff :CommandT<CR>
map <leader>tf :CommandTFlush<CR>
map <leader>tb :CommandTBuffer<CR>
map <leader>tu :CommandT ../<cr>
let g:CommandTMaxHeight=15
let gundo_preview_bottom = 1
let  g:gundo_width=30
let g:gundo_right = 1
nnoremap <leader>uu :GundoToggle<CR>
noremap <leader>cc :TComment<cr>
"{{{
let g:neocomplcache_snippets_dir="~/.vim/my_snips/snippets_complete/"
map <leader>se :sp\|NeoComplCacheEditSnippets<cr>
map <leader>s- :e ~/.vim/my_snips/snippets_complete/_.snip <cr>
"}}}
"}}}

"6.Function_And_Key_Mapping{{{1
"LastUpdate check "{{{
" Check no more than 30 lines from start for 'Last Change:' and update it with
" the current datetime.
function! LastChangeUpdate()
  for linenr in range(1, min([30, line('$')]))
    let line = getline(linenr)
    let rx_str_upd='\%(Change\|Update\|Updated\|Modify\|Modified\)'
    let rx_str_lupd='\%(Last \)\='.rx_str_upd.':'
    if line =~ rx_str_lupd
      let line = substitute(line, '\('.rx_str_lupd.'\s*\).*$',
                  \ '\1'.strftime("%Y-%m-%d"), '')
      call setline(linenr, line)
      break
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

