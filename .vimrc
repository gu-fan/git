" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker fdls=0 :
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
"7.Other_Stuffs 
"  By: Rykka.Krin <Rykka10@gmail.com>
"  Last Change: 2011-10-29
"  "Tough time Goes , Tough People Stay." "}}}
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.General_Settings{{{1
"{{{ Vundle
"load all bundles
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/fcitx.vim'
" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-commentary'

Bundle 'Shougo/neocomplcache'
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
Bundle 'scrooloose/nerdtree'
"testing
"Bundle 'ujihisa/quickrun'
"Bundle 'tomtom/checksyntax_vim'
"Bundle 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = 'f'

" Bundle "mileszs/ack.vim"
"" vim-scripts repos
"Bundle 'rails.vim'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'jQuery'
Bundle 'lilydjwg/csspretty.vim'
Bundle 'matchit.zip'
Bundle 'kchmck/vim-coffee-script'
"colorscheme
" Bundle 'molokai'
" Bundle 'pyte'
"Bundle 'proton'
"Bundle 'twilight'
"Bundle 'phd'
"Bundle 'nelstrom/vim-mac-classic-theme.git'
" Bundle 'altercation/vim-colors-solarized'
"Bundle 'git@github.com:gmarik/ingretu.git'

"" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...
" lookup
"nmap <unique> <silent> <A-S-L> <Plug>LookupFile
"Note:install by manual
"Bundle 'css_color.vim'
"Bundle 'vimwiki'

"test
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'fs111/pydoc.vim'

Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/sketch.vim'
" my script
" set rtp+=~/.vim/git/ColorV
if has("unix")
    set rtp+=~/.vim/git/so_that
endif
Bundle 'Rykka/ColorV'
Bundle 'Rykka/vim-galaxy'
if v:version<700
    set rtp+=~/.vim/bundle/ColorV/
    set rtp+=~/.vim/bundle/vim-galaxy/
endif
filetype plugin indent on     " required!

"Bundle 'rykka/colorizer'
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
set viminfo='100,\"30,:30,s10,!
"Set to auto read when a file is changed from the outside
set autoread
set autowrite
"}}}
"{{{multi_byte
" set encoding=utf-8
" set fileencoding=utf8
if has("unix")
    " set fileformat=unix
    set fileformats=unix,dos
    " set fileencoding=utf8
    " set fileencodings=utf8,gb18030,cp936
    set termencoding=utf-8
    set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
    " set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
else
    " set fileformat=dos
    set fileformats=unix,dos
    set termencoding=utf-8
    set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
endif

if has("win32")
    set helplang=cn " help language = cn!
    set langmenu=en_US
    language messages zh_CN.utf-8
endif
if has("multi_byte")
    "language messages zh_CN.utf-8
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8

endif
"}}}
"{{{ui setting
set ruler "column and line number even no status line
set rulerformat=%15(%c%V\ %p%%%)
set nonumber
set noea
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
" if !has("unix") 
set guioptions-=m
" endif
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
    if has ("win32") ||  has ("win64")
        " set guifont=Courier_New:h14:cANSI
        set guifont=Dejavu_Sans_Mono:h13:cANSI
        " set gfw=Yahei\ Mono:h13:cGB2312
        " set gfw=Consolas:h13:cGB2312
        " set gfw=Microsoft_YaHei:h13:cGB2312
        set gfw=Wenquanyi_Micro_Hei_Mono:h13:cANSI
        " set gfw=ÐÂËÎÌå:h13:cGB2312
    elseif has("gui_mac")
        set guifont=Monaco:h13
        " set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13
    elseif has("gui_gtk2") || has("gui_gnome") 
        set guifont=Dejavu\ Sans\ Mono\ 13,Monospace\ 13,Fixed\ 13
        set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13


    endif

endif "}}}
"Call After Colorscheme And Sourcecmd "{{{

fun! Color_Modify() "{{{
    "all
    " hi Search           guifg=NONE guibg=NONE   gui=underline
    " hi IncSearch        guifg=fg   guibg=bg     gui=underline,reverse
    "hi comment          gui=italic
    " hi colorcolumn     ctermbg=5 guibg=#666
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
            hi colorcolumn     guibg=#222222

            hi title           guifg=#883838
        endif "}}}
        if g:colors_name=="pyte" "{{{
            hi Normal           guibg=#cccccc
            hi colorcolumn      guibg=#aaaaaa
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
            hi Folded           guifg=#665447 guibg=#aaaaaa
            hi FoldColumn       guifg=#555555 guibg=#aaaaaa
        endif "}}}
        if g:colors_name=="solarized" "{{{
            hi normal           guifg=#626262 guibg=#cecece
            hi folded           guibg=#d9d7d6 gui=underline
            hi colorcolumn      guibg=#d9d7d6
            hi foldcolumn       guibg=#d9d7d6
        endif "}}}
        if g:colors_name=="buttercream" "{{{
            " hi normal           guifg=#626262 guibg=#cecece
            " hi folded           guibg=#d9d7d6 gui=underline
            hi colorcolumn      guibg=#e5e5c8
            " hi foldcolumn       guibg=#e5e5c8
        endif "}}}
    endif

    " hi User1 guibg=RED      gui=bold,reverse
    " hi User2 guibg=#73bfbf  gui=bold,reverse

    " aug statusline_color "{{{
    "     au!
    "     if version >= 700
    "         au InsertEnter * hi StatusLine guibg=#ccbfa3 gui=bold
    "         au InsertLeave * hi StatusLine guibg=bg gui=reverse,bold
    " 
    "         au InsertEnter * hi User1 guibg=#ccbfa3 gui=bold
    "         au InsertLeave * hi User1 guibg=red gui=bold,reverse
    "         au InsertEnter * hi User2 guibg=#ccbfa3 gui=bold
    "         au InsertLeave * hi User2 guibg=#73bfbf gui=reverse,bold
    " 
    "         " au InsertEnter * hi cursor guifg=#111   guibg=#fc3 gui=bold
    "         " au InsertLeave * hi cursor guifg=#111   guibg=#fc3 gui=bold,reverse
    "     endif
    " aug END "}}}
endfun "}}} 
"}}}
"colorscheme
" if has("gui_running") "{{{
"let $colorscheme_n="desert"
"let $colorscheme_n="molokai"
"let $colorscheme_n="pyte"
"let $colorscheme_n="solarized"
"let $colorscheme_n="clarity"
" let $colorscheme_n="kellys"
let $colorscheme_n="galaxy"
" let $colorscheme_n="termtest"
" let $colorscheme_n="buttercream"
colorscheme $colorscheme_n
call Color_Modify()
" else
" let $colorscheme_n="desert"
" colorscheme $colorscheme_n
" endif "}}}
map <silent><leader>cs :call Toggle_colorscheme()<cr>
fun! Toggle_colorscheme() "{{{
    " DONE 110530  change the colorsheme with list in folder
    let cs_list=[
                \'aiseered       ', 'anotherdark    ', 'autumn         ', 'autumnleaf     ',
                \'bclear         ', 'biogoo         ', 'brookstream    ', 'buttercream    ',
                \'camo           ', 'candycode      ', 'chocolateliquor', 'clarity        ',
                \'desert256      ', 'freya          ', 'fruit          ',
                \'herald         ', 'jellybeans     ', 'kellys         ', 'lucius         ',
                \'molokai        ', 'moria          ', 'rdark          ',
                \'silent         ', 'soso           ', 'tango2         ', 'vc             ',
                \'wombat256      ', 'zenburn        ',
                \]
    let cs_list=[
                \'bclear         ',  'buttercream    ',
                \  'clarity        ',
                \ 'freya          ', 'galaxy          ',
                \ 'jellybeans     ', 'kellys         ',
                \'molokai        ', 'rdark          ',
                \'soso           ',  'vc             ',
                \'zenburn        ',
                \]
    let idx=0
    for cs in cs_list
        if idx<len(cs_list)-1
            let idx+=1
        else  
            let idx=0
        endif
        if cs =~ '^'.g:colors_name.'\s*$'
            exec "colorscheme ".cs_list[idx]
            silent! call Color_Modify()
            redraw
            echo "ColorScheme:" cs_list[idx]
            return
        endif
    endfor
endf "}}}
"menu
if has("gui_running") "{{{
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "Always show file types in menu
    let do_syntax_sel_menu=1
endif "}}}
"statusline
set statusline=%2*%n.%*[%03l,%02c,%P]%<%F%1*%m%r%*\%=[b%b][%W%Y,%{&enc},%{&ff}]
"hi User1 ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE gui=bold,underline
"Term Color "{{{
" if !has("gui_running") "{{{
"     set ambiwidth=single
"     " 防止退出时终端乱码
"     " 这里两者都需要。只前者标题会重复，只后者会乱码
"     set t_fs=(B
"     set t_IE=(B
"     if &term =~ "xterm"
"     	if &background=="light"
"             silent !echo -ne "\e]12;Black\007"
"             let &t_SI="\e]12;Sienna\007"
"             let &t_EI="\e]12;Black\007"
"         else
"             silent !echo -ne "\e]12;Ivory\007"
"             let &t_SI="\e]12;CornflowerBlue\007"
"             let &t_EI="\e]12;Ivory\007"
"         endif
"       autocmd VimLeave * :!echo -ne "\e]12;green\007"
"     endif
" endif "}}}
"}}}


function! s:local_hi() "{{{
    hi link DONE Title
    syn match DONE  /DONE:\?/
endfunction "}}}
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
" set nowrapscan

set comments=n://,fb:-
" set comments=n:>,fb:-,fb:*
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

if has('unnamedplus') "{{{
    set clipboard+=unnamedplus "All system
else
    if has("unix")
        set clipboard+=unnamed "System clipboard
    else
        set clipboard=
    endif
endif "}}}

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
if v:version >= 703 "{{{
    set colorcolumn=79

    if !isdirectory(expand('~/.vim_undo'))
        call mkdir(expand('~/.vim_undo'))
    endif
    set undofile
    set undodir=~/.vim_undo/


    " always SHOW conceal text
    set conceallevel=2

    " conceal text in the cursor line in the modes
    "n Normal v Visual i Insert c Command
    set concealcursor=c
    "syntax match Entity "\[" conceal cchar=[
    "syntax match Entity "\]" conceal cchar=]
    hi Conceal guifg=bg guibg=bg
endif "}}}
"}}}
" 2.AutoCmd_Group{{{1
aug vimrc_GuiEnter "{{{
    au! vimrc_GuiEnter
    au GuiEnter * set t_vb=
    au GuiEnter * winpos 331 0
    au GuiEnter * winsize 80 100
aug END "}}}

aug vimrc_misc "{{{
    au! vimrc_misc
    " au Swapexists * let v:swapchoice='e'
aug END "}}}

aug vimrc_Buffer "{{{
    au! vimrc_Buffer

    "will cause conflict with help files
    "au BufRead,BufNewFile *.txt set filetype=vimwiki

    au BufEnter * silent! lcd %:p:h:gs/ /\\ /
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
    au BufRead,BufNewFile *.vim,.vimrc set filetype=vim
    "  XXX: not run?
    au BufReadPost,BufEnter LearnWords.vwk call FoldWhite()
aug END "}}}
function! FoldWhite() "{{{
    set fdm=expr
    set fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
    set fdt=foldtext()
endfunction "}}}
aug vimrc_edit "{{{
    au! vimrc_edit
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    autocmd! bufwritepost $colorscheme_n source ~/.vimrc
aug END "}}}
function! s:set_with_vimwiki() "{{{
    if empty(&ft)
        set ft=vimwiki
    endif
endfunction "}}}
aug Filetypes "{{{
    au! Filetypes
    "au FileType text,vimwiki setlocal tw=76
    au BufWinEnter *.txt call <SID>set_with_vimwiki()
    " au bufwritepost *.vim,*.txt call Last_update()
    au BufRead,BufNew,BufNewFile *.j set ft=jass
    au FileType snippet setlocal expandtab
    au FileType jass set wrap
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
    " hi def link vimwikibold Title
    syn match VimwikishortTimeStamp /<\d\d\d\d-\d\d\d\d>/
    "let rx_minstamp='\%(\d\{4}_\d\{4}\|\d\{6}_\d\{4}\|\d\{6}\)'
    syn match VimwikiminTimeStamp /\%(\d\{4}_\d\{4}\|\d\{6}_\d\{4}\|\d\{6}\)/
    syn match VimwikiTimeStamp /<\d\d\d\d-\d\d\d\d>/
    hi def link VimwikishortTimeStamp VimwikiTimeStamp
    hi def link VimwikiminTimeStamp VimwikiTimeStamp
    " hi def link VimwikiTimeStamp SpecialComment
    " hi VimwikiTimeStamp guifg=#777777 gui=bold

    let rxListBullet = '^\s*\zs\%(\*\|-\|#\)\ze\s'
    "let rxListNumber = '^\s*\zs\%(\d\+[\.)]\)\+\s'
    execute 'syntax match VimwikiList /'.rxListBullet.'/'
    "execute 'syntax match VimwikiList /'.rxListNumber.'/'
    syn match vimwiki_rx_list_num /^\s*\%(\d\+\.\)\+\ze\s/
    "hi vimwiki_rx_list guifg=#8c8 gui=bold
    hi default link vimwiki_rx_list_num VimwikiLIst

    " FIXED: 0504_0052  using \@<! and \@! to match with zerowidth;
    syn match Vimwiki_Posit9 /\S\@<!\(+9\|\[+9\]\)\S\@!/
    syn match Vimwiki_Posit8 /\S\@<!\(+8\|\[+8\]\)\S\@!/
    syn match Vimwiki_Posit7 /\S\@<!\(+7\|\[+7\]\)\S\@!/
    syn match Vimwiki_Posit6 /\S\@<!\(+6\|\[+6\]\)\S\@!/
    syn match Vimwiki_Posit5 /\S\@<!\(+5\|\[+5\]\)\S\@!/
    syn match Vimwiki_Posit4 /\S\@<!\(+4\|\[+4\]\)\S\@!/
    syn match Vimwiki_Posit3 /\S\@<!\(+3\|\[+3\]\)\S\@!/
    syn match Vimwiki_Posit2 /\S\@<!\(+2\|\[+2\]\)\S\@!/
    syn match Vimwiki_Posit1 /\S\@<!\(+1\|\[+1\]\)\S\@!/
    syn match Vimwiki_Posit0 /\(^\s*\|.*\s\)\(+0\|\[+0\]\)\(\s*$\|\s.*\)/

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
" command! Gcc !gcc '%:p' -o %:t:r.o -lm
command! Gcc !gcc `pkg-config --cflags --libs gtk+-2.0` '%:p' -o %:t:r.o -lm
"library generator
command! Gcoo !gcc `pkg-config --cflags --libs gtk+-2.0`  -c -fpic % -o %:t:r.o
command! Gcso !gcc -shared -lc  -o %:t:r.so  %:t:r.o 
command! Gcsa call Gcso()
nmap <leader>lbb :call Libcall_this("str","","")
nmap <leader>lnn :call Libcall_this("int","","")
function! Libcall_this(type,func,para) "{{{
    let file=expand('%:p:r').".so"
    call Gcso()
    if a:type=="str"
        echo libcall(file,a:func,a:para)
    else
        echo libcallnr(file,a:func,a:para)
    endif
endfunction "}}}
function! Gcso()
    Gcoo
    Gcso
endfunction
command! Gcld !gcc -o %:t:r % -ldl
" command! Gcc !gcc `pkg-config --cflags --libs gtk+-2.0` '%:p' -o %:t.o
" command! Gpp !g++ %:p -o %:t.o

command! Gpp !g++ `pkg-config --cflags --libs gtk+-2.0` -c -fPIC % -o %:t:r.o
command! Gpso !g++ -shared -Wl,-soname,%:t:r.so -o  %:t:r.so  %:t:r.o

" gcc  -c -fpic % -o %:t:r.o
" gcc -shared -lc  -o %:t:r.so  %:t:r.o 
" The K stroke
set keywordprg=":help"
cabbrev H h
"}}}
"{{{ insert abbrevation "{{{
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

"}}} "}}}

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
map <c-F1> :Pydoc <C-R>=expand("<cword>")<CR><CR>
"map <F1> :call Split_if("")<CR><Plug>VimwikiIndex
if has("unix")
    nmap <s-F1> :!man <C-R>=expand("<cword>")<CR> <CR>
endif

"Find "{{{
"map <s-F2> :FufLine<CR>
map <c-F2> :Ack <C-R>=expand("<cword>")<CR>
vnoremap <c-F2> "sy<c-l>:Ack "<c-r>s"

" replace word under cursor
nmap <F2> :<C-\>eRead_visual("sw")<CR><Left><Left><Left>
nmap <s-F2> :<C-\>eRead_visual(".sw")<CR><Left><Left><Left>
vnoremap <s-F2> :<C-\>eRead_visual(".s")<CR><Left><Left>
" replace selection
vnoremap <F2> "sy<esc><c-l>:<C-\>eRead_visual("s")<CR><Left><Left><Left>
" vnoremap <F2> :echo Read_visual_and_change()<cr>
function! Read_visual(...) "{{{
    let ptn_1="[]/~.*^$\\"
    let ptn_2="/&~\\"
    if exists("a:1") && a:1== "s"
        let x=escape(@s,ptn_1)
        let x1=escape(@s,ptn_2)
        return "%s/".x."/".x1."/gc"
    elseif exists("a:1") && a:1== ".s"
        let x=escape(expand('<cword>'),ptn_1)
        let x1=escape(expand('<cword>'),ptn_2)
        return ".,'>s/".x."/".x1."/g"
    elseif exists("a:1") && a:1== ".sw"
        let w=escape(expand('<cword>'),ptn_1)
        let w1=escape(expand('<cword>'),ptn_2)
        return ".s/\\<".w."\\>/".w1."/gc"
    elseif exists("a:1") && a:1== "sw"
        let w=escape(expand('<cword>'),ptn_1)
        let w1=escape(expand('<cword>'),ptn_2)
        return "s/\\<".w."\\>/".w1."/gc"
    elseif exists("a:1") && a:1== "e"
        let x=escape(@s,ptn_1)
        return x
    endif
endfunction "}}}
"vnoremap <C-C> "+y
"}}}
"map <silent> <F3> :FufBuffer<CR>
map <F3> :Unite buffer<CR>
map <c-F3> :next<CR>

"noremap <F4> :NERDTreeToggle "expand('%:p:h')"<CR>
"nmap <F4> :FufFile<CR>
if has("unix")
    nmap <F4> :CommandT<CR>
else
    nmap <F4> :NERDTree %:p:h<CR>
endif
map <S-F4> :Vexplore<CR>

map <C-F4> :Unite file<cr>
"it have errors ,many
"nmap <silent> <F5> :QuickRun<CR>
"map <silent> <s-F5> :VimShellPop<cr>
if has("unix") && has("gui_running")
    nmap <c-F5> :SCCompileRun<cr>
    " call SingleCompile#ChooseCompiler('html', 'firefox')
endif
if has("win32")
    nmap <c-F5> :! @d:\Dev\MSYS\bin\rxvt -tn msys -sl 3000 +sb -fn "Dejavu Sans Mono-18" -fg white -bg black  -sr -e d:\Dev\MSYS\bin\bash.exe --login -i<cr> 
endif
" call SingleCompile#ChooseCompiler('vim', 'source')
" call SingleCompile#SetCompilerTemplate('vim', 'source', 'source', 'source', '', '')
" call SingleCompile#SetOutfile('filetype', 'compiler', 'out_file')
" call SingleCompile#ChooseCompiler('vim', 'source')
nmap <silent> <F5> :call Exe_cur_script("norm")<CR>
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
    "let bang="!sudo "
    "elseif priv=="n" 
    "let bang="!"
    "else
    "echo   "no correct input"
    "return -1
    "endif

    let bang="!"
    if has("unix")
        let browser = "firefox "
        let runner="gnome-open "
        let err_log=" 2>&1 | tee /tmp/.runtmp"
    else
        "add to "~/shortcuts" and $PATH
        let browser ="firefox.lnk "
        let runner="start "
        let err_log=" "
    endif
    let term = "gnome-terminal "

    if a:mode=="norm"
        " FIXME: error of the file name wrapping ?
        let file=" \"".expand('%:p')."\""
    elsei a:mode=="visual"
        "let firstLine = line("'<")
        "let lastLine = line("'>")
        "let rng_list=getline(firstLine,lastLine)
        "let rng=""
        let rng=getline('.')
    endif

    if !exists("b:current_syntax")
        if has("unix") 
            exec bang.runner.file
        else  
            exec bang.file 
        endif
        return 0
    endif
    if exists("b:current_syntax")
        let syn=b:current_syntax
        if syn=="python"
            let v=exists("w:python_version") ?  w:python_version : 2
            if v==2
                exec bang."python -d ".file.err_log
            elseif v==3
                exec bang."python3 -d ".file.err_log
            elseif v==1
                exec bang."pypy -d ".file.err_log
            endif
        elseif syn=="ruby" 
            exec bang."ruby -d ".file.err_log
        elseif syn=="perl" 
            exec bang."perl -D ".file.err_log
        elsei syn=~'^vim$'
            if a:mode=="norm"
                exec "so %"
                " so %
            elseif a:mode=="visual"
                "for item in rng_list
                "let rng.= item." \| "
                "endfo
                "let rng.="1sleep"
                exec rng
            endif
        elsei syn=~'html'
            exec bang.browser.file
        elsei syn =~'^\(sh\|expect\|bash\)$'
            if a:mode=="norm"
                exec bang.term." -x bash ".file
            else
                "for item in rng_list
                "let rng.= item." && "
                "endfo
                "let rng.= "sleep 1"
                exec bang.term." -x bash -c ".rng
            endif
        elsei syn=~'^bat$'
            exec bang.runner."cmd -e".file 
        endif
    else  
        exec bang.runner.file 
    endif

endfunction "}}}

map <F6> :TagbarToggle<CR>
map <c-F6> :cw<CR>

"{{{ start from here
map <silent><F8> :call Start_File_explore()<CR>  
map <silent><s-F8> :call Start_terminal()<CR>
fun! Start_File_explore() "{{{
    if expand("%:p:h") != ""
        if has("win32")
            exec "!start explorer '%:p:h'"
        else
            "exec "!gnome-commander -l '%:p:h'"
            exec "!nautilus '%:p:h'"
        endif
    endif
endf "}}}
fun! Start_terminal() "{{{
    if has("win32")
        exec "!start cmd '%:p:h'"
        " exec "! @d:\Dev\MSYS\bin\rxvt -tn msys -sl 3000 -fn Fixedsys -fg white -bg black -sr -e d:\Dev\MSYS\bin\bash.exe --login -i"

    else
        exec "!xterm -hold -e 'cd %:p:h && /bin/bash' &"
    endif
endf "}}}
"}}}
map <F9> :GundoToggle<CR>
nmap <F10>  :options<CR>
nmap <c-F11> :call ToggleSketch()<CR>
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga
"""session save /load "{{{
nmap <s-F12> :call SaveSession("")<CR>
nmap <c-F12> :call SaveSession("in")<CR>
"nmap <s-F12> :1,$bd <bar> so ~/.vim/sessions/
nmap <F12> :Unite session<cr>
aug sessionload
    au!
    " au sessionloadpost * so ~/.vimrc 
aug END
set sessionoptions=buffers,curdir,help,tabpages,winsize,resize
function! SaveSession(text) "{{{
    wall
    let time=strftime("%y%m%d_%H%M%S")
    if exists("a:text") && a:text=="in"
        let ses=input("Please Input your session name:")
        if empty(ses)
            echo "Invalid Input name. Stopped!" 
            return
        endif
        let ses = time."_".ses
    else
        let ses = time
    endif
    try
        exe "mksession! "."~/.vim/sessions/".ses
        echomsg "mks success! session file : ".ses
    catch /^vim\%((\a\+)\)\=:/
        echoe "mks failure! error: " .v:exception
    endtry
endfunction "}}}
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
" unmap q:
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
map <silent><leader>vdv :call DiffOrig("~/.vimrc","~/Documents/git/.vimrc")<cr>
map <silent><leader>vdw :call DiffOrig("~/.vimrc","/media/sda5/Documents/Variables/.vimrc")<cr>
map <leader>vd :e ~/.vim/ <CR>
if has("unix") "{{{
    map <silent><leader>vb :call Split_if("") \| e ~/.bashrc<CR>
    map <silent><leader>vt :call Split_if("") \| e ~/.tmux.conf<CR>
    map <silent><leader>vp :call Split_if("") \| e ~/.pentadactylrc<CR>
    map <silent><leader>vc :call Split_if("") \| e ~/.conkyrc<CR>
    map <silent><leader>va2 :call Split_if("") \| e ~/.aria2/aria2.conf<CR>
    map <silent><leader>vax :call Split_if("") \| e ~/.axelrc<CR>
    map <silent><leader>vsp :call Split_if("s",10) \|e ~/Documents/vimwiki/Ref/ShuangPin.vwk<CR>
    map <silent><leader>vwv :call Split_if("") \|e /media/sda5/Documents/Variables/.vimrc<CR>
else
    map <silent><leader>vsp :call Split_if("s",10) \|e d:/Documents/vimwiki/Ref/ShuangPin.vwk<CR>
    map <silent><leader>vp :call Split_if("") \| e ~/.pentadactylrc<CR>
endif "}}}
"reloading of the .vimrc
map <leader>vr :so ~/.vimrc<CR>
"map <leader>RR :so ~/.vimrc<CR>
"map <leader>rr :so ~/.vimrc<CR>
map <leader>rr :nohl \|redr<CR>

map <Leader>tn :call Split_if("t")<CR>
map <leader>re <c-^>
map <leader>dff :call <SID>file_del('<cfile>')<cr>
map <leader>dfi :call <SID>file_del('%')<cr>
map <leader>cf :call <SID>file_add()<cr>
function! s:file_del() "{{{
    let s= input("be sure to delete the file:".expand(a:type).":(y/n)")
    if s!="y"
        return
    endif

    let r=delete(expand(a:type))
    if r==0
        echo "delete success!"
    else
        echo "delete failure!"
    endif
endfunction "}}}
function! s:file_add() "{{{
    " let s= input("be sure to delete the file:".expand('<cfile>').":(y/n)")
    " if s!="y"
    " 	return
    " endif
    " 
    " let r=delete(expand('<cfile>'))
    " if r==0
    " 	echo "add success!"
    " else
    " 	echo "add failure!"
    " endif
    call Split_if("s")
    exec "e ".expand('<cfile>')
endfunction "}}}

"map <leader>
"check current file to decide if split or not
command! -nargs=* Splif call Split_if(<q-args>)
fun! Split_if(...) "{{{
    " if expand('%')==""
    "     return
    " endif
    if a:0
        if a:1 =="v"
            " call ChkWin(0)
            exe "vsplit"
            if exists("a:2")
                "echoe a:2
                exe "vertical resize ".a:2
            endif
        elseif a:1=="t"
            exe "tabnew"
        elseif a:1=="s"
            exe "split"
            if exists("a:2")
                "echoe a:2
                exe "resize ".a:2
            endif
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
"can't use it in the map due to some weird reason.
fun! Toggle_diff() "{{{
    if &diff
        diffoff
        set foldmethod=marker
        set foldcolumn=1
        echo "diffmode Off"
    else
        diffthis
        echohl WarningMsg | echo "diffmode On" | echohl None
    endif
endfun "}}}

map <silent> <leader>DD :call DiffWithFileFromDisk()<CR>
function! DiffWithFileFromDisk()
    let filename=expand('%')
    let diffname = filename.'.fileFromBuffer'
    exec 'saveas! '.diffname
    diffthis
    vsplit
    exec 'edit '.filename
    diffthis
endfunction
set diffopt=filler,vertical,foldcolumn:1
nmap <leader>da :1,$+1diffget<cr>
nmap <leader>dc :1,.diffget<cr>
nmap <leader>d$ :.,$+1diffget<cr>
map <silent> <leader>do :call DiffOrig()<CR>
command! DiffOrig win 151 100 | vert new | setl bt=nofile | r # | 0d_
            \ | diffthis | setl noma
            \ | wincmd p | diffthis
function! DiffOrig(...) "{{{
    if exists("a:1") 
        exec "sp ".a:1
    endif
    let syn=&syntax
    call ChkWin(0)
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

endfunction "}}}
"}}}
"Toggle Folding And Foldmethod  "{{{
"NOTE: 'n_==' is useful to indent folded text
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
if has("unix") && has("gui_running") "{{{
    "Error with MSYS
    " if &term==cygwin

    set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
else
    set listchars=tab:\|-,trail:-,extends:>,precedes:<
endif "}}}

map <Leader>li :set list! list?<CR>
map <silent><leader>nn :if  &nu \| setl rnu \| 
            \elseif &rnu \| setl nornu\|
            \else \| setl nu\| 
            \endif <CR>
map <leader>wr :set wrap! wrap?<CR>
"map <leader>nn set nu! nu?<CR>
"map <leader>nr :set rnu! rnu?<CR>
map <leader>sp :set spell!<CR>
            \<bar>:echo "Spell check: ".strpart("OFFON", 3 * &spell, 3)<CR>

no <silent><m-1> :if &go=~#'m'\|se go-=m\|
            \else\|se go+=m\|
            \endif<CR>
no <silent><m-2> :if &go=~#'r'\|se go-=r\|
            \else\|se go+=r\|
            \endif<CR>


" copy filename
map <silent> <leader>cpl :let @+=expand('%').':'.line('.')<CR>
map <silent> <leader>cpf :let @+=expand('%:p')<CR>
map <silent> <leader>cph :let @+=expand('%:p:h')<CR>
"map <silent> <leader>cp :let @+=g:<CR>
"Copy current variables
command! -nargs=1 -complete=var Cvar let @+=<args>

"Keymapping Of Gtd
map<silent> <Leader>ntd :TinyTodo<CR>
command! TinyTodo call TinyTodo()
fun! TinyTodo() "{{{
    "TODO: open a tab in gvim
    if expand('%') != ""
        exec '!gvim "+winp 1400 150" "+win 37 25"
                    \"+se fdc=0" "+se stl=" "+se nosc"
                    \"~/Documents/vimwiki/Todo/TodoTiny.vwk"'
    else
        exec "winp 1400 150 \| win 37 25 \| se nosc fdc=0 stl= "
        exec "e ~/Documents/vimwiki/Todo/TodoTiny.vwk"
    endif
endfun "}}}
"}}}
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
nmap <leader>1p1 :set ft=python\|let w:python_version=1\|echo "PYPY1.X"<CR>
nmap <leader>1p2 :set ft=python\|let w:python_version=2\|echo "PYTHON2.X"<CR>
nmap <leader>1p3 :set ft=python\|let w:python_version=3\|echo "PYTHON3.X"<CR>



nmap <leader>11 :filetype detect \| syntax enable \| call Color_Modify() <CR>
"nmap <leader>`` :filetype detect \| syntax enable \| so $MYVIMRC<CR>

"use menu syntax
nmap <leader>1me  :emenu Syntax.
"nnoremap <silent> <leader>1 :nohl<CR>
" DONE: 110519 clear all hlsearch without warningmsg
nnoremap <silent> <c-l> :let @/=''\|redraw<CR>
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
" nnoremap <C-w><c-d> :bnext<CR>
" nnoremap <C-w>d :bnext<CR>
" nnoremap <C-w><c-f> :bprevious<CR>
" nnoremap <C-w>f :bprevious<CR>

map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>
"nmap <C-e><C-W> :call NavBuff("next")<cr>
"nmap <C-e><c-e> :call NavBuff("prev")<cr>
"buffer and window navigation
"nmap <C-W><C-W> :call NavBuff("next")<cr>
"nmap <C-W><c-e> :call NavBuff("prev")<cr>
nnoremap <C-W><c-r> <c-^>
nmap <C-W><c-b> :call NavBuff("list")<cr>
nmap <C-W><c-tab> :call NavBuff("list")<cr>
nmap <C-W><tab> :call NavBuff("list")<cr>

fun! NavBuff(act) "{{{
    if a:act=="next"
        exe winnr('$')==1 ? "bnext" : "normal \<C-W>w"
    endif
    if a:act=="prev"
        exe winnr('$')==1 ? "bprevious" : "normal \<C-W>W"
    endif
    if a:act=="list"
        exe winnr('$')<=4 ? "CommandTBuffer" : "Unite window "
    endif
endfun "}}}

"dont close last window , use :hid
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
nnoremap <silent> <C-W><c-g> :sp<CR>gf
nnoremap <silent> <C-W><c-s> :sp<CR>gf
noremap <silent> <C-W><c-s> :sp<CR>gf
nnoremap <silent> <C-W><c-t> :tab sp<CR>gf

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
vnoremap <c-n> "sy<c-c>/<c-\>eRead_visual("e")<CR><CR><ctrl-g>
vnoremap <c-p> "sy<c-c>/<c-\>eRead_visual("e")<CR><CR><ctrl-g>
vnoremap / "sy<c-c>/<c-\>eRead_visual("e")<CR><cr><ctrl-g>
vnoremap ? "sy<c-c>?<c-\>eRead_visual("e")<CR><cr><ctrl-g>
vnoremap # "sy<c-c>?<c-\>eRead_visual("e")<CR><cr><ctrl-g>
vnoremap * "sy<c-c>/<c-\>eRead_visual("e")<CR><cr><ctrl-g>
nnoremap <c-n> n
nnoremap <c-p> N

"search for none exist before / after
vnoremap <leader>/ "sy<c-c>/\(\)\@<!<c-r>s<Home><right><right>
vnoremap <leader>? "sy<c-c>/<c-r>s\(\)\@!<left><left><left><left><left>




"nnoremap # n
"nnoremap * n
"mousewheel go around
if v:version < 703 "{{{
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
endif "}}}

"}}}
" 4.4.Edit_and_formatting
" Easy Editing Modify "{{{
" make p in Visual mode replace the selected text with the yank register
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"as D
nnoremap Y y$

"change case <m-c>
nnoremap <m-c>1 gUU
nnoremap <m-c>2 guu
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
nmap <m-c>3 :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
" Capitalize inner word
nmap <m-c>w guiw~w
" UPPERCASE inner word
nmap <m-c>U gUiww
" lowercase inner word
nmap <m-c>u guiww
nmap <m-c>c ~h

"trim whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>:let @/=''<CR>

nnoremap <leader>scm :%s//\r/g<CR>

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
nnoremap <Leader>el ^v$c[[<C-r>"]]<ESC>`[
nnoremap <Leader>eW BvEc[[<C-r>"]]<ESC>`[
nnoremap <Leader>ew bvec[[<C-r>"]]<ESC>`[

"php
nnoremap <leader>ep ciw<?php <C-r>" ?><ESC>
vnoremap <Leader>ep c<?php <C-r>" ?><ESC>`[
"" html comment
nnoremap <leader>e! ciw<!-- <C-r>" --><ESC>
vnoremap <Leader>e! c<!-- <C-r>" --><ESC>`[
"}}}
"TODOTHINS "{{{
nnoremap <leader>et :call <SID>add_text(" TODO:")<CR>
nnoremap <leader>ef :call <SID>add_text("FIXME:")<CR>
nnoremap <leader>ex :call <SID>add_text("  XXX:")<CR>
function! s:is_whiteline() "{{{
    return getline('.')=~'^\s*$'
endfunction "}}}
function! s:add_text(text)
    if &syn=="vimwiki"
        let cmnt = a:text
    else
        let cmnt = substitute(&commentstring, '%s', ' '.a:text, "")
    endif
    if s:is_whiteline()
        exec 'normal I' . cmnt
    else
        let fo_bak=&fo
        set fo=2
        exec 'normal o' . cmnt
        let &fo=fo_bak
        " exec 'normal I'
        " let col=col('.')
        " if col==1
        "     let col=0
        " endif
        " call append(line('.'),repeat(" ",col).cmnt)
    endif
endfunction

"}}}
"Formating "{{{
"alignment of text
nmap <leader>ll :left<CR>
nmap <leader>lr :right<CR>
nmap <leader>lc :center<CR>

"make vimwiki list
nm <leader>l1 :call g:sub_list('*')<cr>
nm <leader>l2 :call g:sub_list('#')<cr>
nm <leader>l3 :call g:sub_list('-')<cr>
nm <leader>l4 :call g:sub_list('1.')<cr>
function! g:sub_list(sym)
    let line=getline('.')
    let m=substitute(line,'^\(\s*\)\%([*#-]\s\|\%(\d\.\)\+\s\)\=\ze.*','\1'.a:sym.' ','')
    call setline(line('.'),m)
endfunction

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
noremap <C-V>		"+gp=`]
noremap <S-Insert>		"+gp=`]
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
" if has("win32") || has("win64")
"     let g:unite_session_path = $HOME . "/.vim/sessions"
" endif

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
map <leader>nt :tabnew<CR>
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
" let g:neocomplcache_enable_quick_match=1
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

inoremap <expr><C-g> neocomplcache#undo_completion()

inoremap <expr><CR> pumvisible() ?
            \ neocomplcache#smart_close_popup() : "\<CR>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

"{{{
aug omni_compl "{{{
    au! omni_compl
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
aug END "}}}

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
"error with gvim start in MSYS
if &term=='cygwin'
    let wiki_1.path = '/d/Documents/vimwiki'
else
    let wiki_1.path = '~/Documents/vimwiki'
endif
let wiki_1.maxhi=0
let wiki_1.ext = '.vwk'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp','sh':'sh'}

let g:vimwiki_list = [wiki_1]

let g:vimwiki_menu = ""
"let g:vimwiki_global_ext= 0
let g:vimwiki_browsers=['firefox']
"let g:vimwiki_html_header_numbering = 2
let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,zip,rar,7z,gz
            \,py,sh,rb,pl,lua,go
            \,c,cpp,h
            \,js,css,html,php
            \,j,java,xml
            \,vim,vba'
let g:vimwiki_conceallevel=2
let g:vimwiki_lower="a-z0-9\u0430-\u044f"

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

    " setlocal fdm=indent
    "setlocal foldexpr=Myfoldlevel(v:lnum)
    " setlocal foldexpr=VimwikiFoldLevel(v:lnum)
    " setlocal foldtext=MyVimwikiFoldText()
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

    "map <M-RightMouse> <Plug>VimwikiGoBackWord
    map <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    imap <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    map <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    imap <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    inoremap <buffer><expr> <m-End> "\<c-o><c-i>"
    noremap <buffer><expr> <m-End> "\<c-i>"
    nmap <silent><buffer> <TAB> <Plug>VimwikiNextLink
    "inoremap <expr> <buffer> <Tab> vimwiki_tbl#kbd_tab()

    inoremap <buffer><expr><TAB> pumvisible() ? "\<c-n>" : 
                \ vimwiki#tbl#kbd_tab()
    inoremap <buffer><expr><s-TAB> pumvisible() ? "\<c-p>" : 
                \ vimwiki#tbl#kbd_shift_tab()
    "tab with 2 space sts sw
    setl shiftwidth=4 softtabstop=4
    setl cms=%%%%%s
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
nmap  <leader>ga :call <SID>update_add()<cr> 
function! s:update_add() "{{{
    call Last_update()
    w
    redraw
    try
        exec "Git add %"
    catch /^Vim\%((\a\+)\)\=:E492/
        echo "Not a git repo..."
    endtry
endfunction "}}}
nmap  <leader>gc :Gcommit<cr> 
nmap  <leader>gd :Gsdiff 
nmap  <leader>gk :Git checkout 
nmap  <leader>gr :Git branch  
nmap  <leader>gp :Git push<cr>

"}}}
"Misc Plugins Settings "{{{
"   syntax/vim.vim 默认会高亮 s:[a-z] 这样的函数名为错误
let g:vimsyn_noerror = 1
"nmap <leader>ch :CalendarH<CR>

"let g:NERDTreeChDirMode=2
"noremap <m-w><m-w> :NERDTreeToggle "expand('%:p:h')"<CR>

" let g:ColorV_leader_maps = '<Leader>f'
let g:galaxy_term_check=0
let g:galaxy_term_color=256
" set t_Co=16
" let g:ColorV_no_python=1
" let g:ColoV_debug=0
" let g:ColorV_win_pos="bot"
" let g:ColorV_win_space="hls"
"remap the ColorVchange command 
" aug preview_css_auto
"     au!
"     au! BufWinEnter *.css call colorv#preview("S")
"     au! bufwritepost *.css call colorv#preview("S")
" aug END
" nmap <silent> <leader>ce :ColorVchange<CR>

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
noremap \\ :TComment<cr>

" noremap <c-F5> :call so_that#show()<cr>
"{{{
let g:neocomplcache_snippets_dir="~/.vim/my_snips/snippets_complete/"
map <leader>se :sp\|NeoComplCacheEditSnippets<cr>
map <leader>s- :sp\|e ~/.vim/my_snips/snippets_complete/_.snip <cr>
map <leader>s_ :sp\|e ~/.vim/my_snips/snippets_complete/_.snip <cr>
"}}}
"}}}

"6.Function_And_Key_Mapping{{{1
"LastUpdate check "{{{
" Check no more than 30 lines from start for 'Last Change:' and update it with
" the current datetime.
function! Last_update() "{{{
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
endfunction "}}}
command! -nargs=0 Lastupdate call Last_update() 
"}}}
"ACK "{{{Searching:
"   -i, --ignore-case     Ignore case distinctions in PATTERN
"   --[no]smart-case      Ignore case distinctions in PATTERN,
"                         only if PATTERN contains no upper case
"                         Ignored if -i is specified
"   -v, --invert-match    Invert match: select non-matching lines
"   -w, --word-regexp     Force PATTERN to match only whole words
"   -Q, --literal         Quote all metacharacters; PATTERN is literal
" 
" Search output:
"   --line=NUM            Only print line(s) NUM of each file
"   -l, --files-with-matches
"                         Only print filenames containing matches
"   -L, --files-without-matches
"                         Only print filenames with no matches
"   -o                    Show only the part of a line matching PATTERN
"                         (turns off text highlighting)
"   --passthru            Print all lines, whether matching or not
"   --output=expr         Output the evaluation of expr for each line
"                         (turns off text highlighting)
"   --match PATTERN       Specify PATTERN explicitly.
"   -m, --max-count=NUM   Stop searching in each file after NUM matches
"   -1                    Stop searching after one match of any kind
"   -H, --with-filename   Print the filename for each match
"   -h, --no-filename     Suppress the prefixing filename on output
"   -c, --count           Show number of lines matching per file
"   --column              Show the column number of the first match
" 
"   -A NUM, --after-context=NUM
"                         Print NUM lines of trailing context after matching
"                         lines.
"   -B NUM, --before-context=NUM
"                         Print NUM lines of leading context before matching
"                         lines.
"   -C [NUM], --context[=NUM]
"                         Print NUM lines (default 2) of output context.
" 
"   --print0              Print null byte as separator between filenames,
"                         only works with -f, -g, -l, -L or -c.
" 
" File presentation:
"   --pager=COMMAND       Pipes all ack output through COMMAND.  For example,
"                         --pager="less -R".  Ignored if output is redirected.
"   --nopager             Do not send output through a pager.  Cancels any
"                         setting in ~/.ackrc, ACK_PAGER or ACK_PAGER_COLOR.
"   --[no]heading         Print a filename heading above each file's results.
"                         (default: on when used interactively)
"   --[no]break           Print a break between results from different files.
"                         (default: on when used interactively)
"   --group               Same as --heading --break
"   --nogroup             Same as --noheading --nobreak
"   --[no]color           Highlight the matching text (default: on unless
"                         output is redirected, or on Windows)
"   --[no]colour          Same as --[no]color
"   --color-filename=COLOR
"   --color-match=COLOR
"   --color-lineno=COLOR  Set the color for filenames, matches, and line numbers.
"   --flush               Flush output immediately, even when ack is used
"                         non-interactively (when output goes to a pipe or
"                         file).
" 
" File finding:
"   -f                    Only print the files found, without searching.
"                         The PATTERN must not be specified.
"   -g REGEX              Same as -f, but only print files matching REGEX.
"   --sort-files          Sort the found files lexically.
"   --invert-file-match   Print/search handle files that do not match -g/-G.
"   --show-types          Show which types each file has.
" 
" File inclusion/exclusion:
"   -a, --all-types       All file types searched;
"                         Ignores CVS, .svn and other ignored directories
"   -u, --unrestricted    All files and directories searched
"   --[no]ignore-dir=name Add/Remove directory from the list of ignored dirs
"   -r, -R, --recurse     Recurse into subdirectories (ack's default behavior)
"   -n, --no-recurse      No descending into subdirectories
"   -G REGEX              Only search files that match REGEX
" 
"   --perl                Include only Perl files.
"   --type=perl           Include only Perl files.
"   --noperl              Exclude Perl files.
"   --type=noperl         Exclude Perl files.
"                         See "ack --help type" for supported filetypes.
" 
"   --type-set TYPE=.EXTENSION[,.EXT2[,...]]
"                         Files with the given EXTENSION(s) are recognized as
"                         being of type TYPE. This replaces an existing
"                         definition for type TYPE.
"   --type-add TYPE=.EXTENSION[,.EXT2[,...]]
"                         Files with the given EXTENSION(s) are recognized as
"                         being of (the existing) type TYPE
" 
"   --[no]follow          Follow symlinks.  Default is off.
" 
"   Directories ignored by default:
"     autom4te.cache, blib, _build, .bzr, .cdv, cover_db, CVS, _darcs, ~.dep,
"     ~.dot, .git, .hg, _MTN, ~.nib, .pc, ~.plst, RCS, SCCS, _sgbak and .svn
" 
"   Files not checked for type:
"     /~$/           - Unix backup files
"     /#.+#$/        - Emacs swap files
"     /[._].*\.swp$/ - Vi(m) swap files
"     /core\.\d+$/   - core dumps
" 
" Miscellaneous:
"   --noenv               Ignore environment variables and ~/.ackrc
"   --help                This help
"   --man                 Man page
"   --version             Display version & copyright
"   --thpppt              Bill the Cat
function! Ack(args) "{{{
    let grepprg_bak=&grepprg
    if has("unix")
        let os = system('cat //etc//issue')
        if os =~?"Ubuntu"
            set grepprg=ack-grep\ -a\ --nocolor\ --nogroup\ --column\ --break
        else
            set grepprg=ack\ -a\ --nocolor\ --nogroup\ --column\ --break
        endif
    else
        " exec "set grepprg=" . "ack// -a// -H// --nocolor// --column"
        set grepprg=ack\ -a\ --nocolor\ --nogroup\ --column\ --break
    endif
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    redraw
endfunction "}}}
command! -nargs=* -complete=file Ack call Ack(<q-args>)
"}}}
fun! Ranger() "{{{seems only can be used under terminal
    silent !ranger --choosefile=/tmp/chosen
    if filereadable('/tmp/chosen')
        exec 'edit ' . system('cat /tmp/chosen')
        call system('rm /tmp/chosen')
    endif
    redraw!
endfun
map <leader>rg :call Ranger()<cr> "}}}
"}}}

