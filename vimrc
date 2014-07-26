let mapleader=","
let maplocalleader=","

" Some platform specific stuff that has to be done before Vundle"{{{
if has("dos16") || has("dos32") || has("windows") || has("win32")
    let path='~/vimfiles/bundle'
    let shell='command.com'
    set runtimepath+=~/vimfiles
    set runtimepath+=~/vimfiles/bundle/Vundle.vim
    set backupdir=C:\temp
endif
if has("unix")
    let &shell="bash\ -l"
    set runtimepath+=~/.vim/bundle/Vundle.vim
    set backupdir=$HOME/.vimbackup
    set tags=$HOME/src/IS3/ARG_ControllerLib/tags
    let g:C_GlobalTemplateFile = '$HOME/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_Dictionary_File = '$HOME/.vim/bundle/c.vim/c-support/wordlists/c-c++-keywords.list,'.
                            \ '$HOME/.vim/bundle/c.vim/c-support/wordlists/k+r-keywords.list,'.
                            \ '$HOME/.vim/bundle/c.vim/c-support/wordlists/stl_index.list'
endif"}}}

"Vundle  {{{
" =====================================================================
" Configure Vundle
" http://github.com/gmarik/Vundle.vim
set nocompatible
filetype off
"
" set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'SearchComplete'
Plugin 'TaskList.vim'
Plugin 'a.vim'
Plugin 'bling/vim-airline'
Plugin 'c.vim'
Plugin 'corntrace/bufexplorer'
Plugin 'jammy.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-startify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tsaleh/vim-supertab'

if has("ruby")
  Plugin 'wincent/Command-T'
endif

if has("unix")
  Plugin 'Valloric/YouCompleteMe'
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
syntax on
filetype on"}}}

" Variables"{{{
" Configuration for TList
let Tlist_Show_Menu=1

" Configuration for airline (a cool status line)
" Good themes would be: badwolf, jellybeans, kalisi, monochrome, zenburn
let g:airline_theme='monochrome'

" Configuration for doxygen
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_authorName="Michael Roehrl"

" Configuration for BufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1

" Grep should not look in the following directories
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'

" Nerdtree Configuration
let NERDTreeIgnore=['\.d$', '\.o$', '\~$']"}}}

" Settings"{{{
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set backup
set enc=utf-8
set esckeys
set expandtab
set fenc=utf-8
set ff=unix
set ffs=unix
set foldmethod=marker
set formatoptions=cqr
set grepprg=/bin/grep\ -nH
set guioptions=tamgir
set helpheight=0
set hidden
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set magic
set makeprg=make
set noerrorbells
set nolist
set nostartofline
set number
set report=0
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set shiftwidth=2
set showmatch
set showmode
set smartindent
set t_vb=
set tabstop=2
set tagstack
set textwidth=100
set visualbell
set whichwrap=<,>,h,l
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest,list:full
set wrapmargin=1
set writebackup

" VimInfo:
" Danach kann man nach dem Starten vom vim mit '. an die Stelle der letzten
" Änderung (wenn man in der entsprechenden Datei ist) oder mit '0 gleich die
" Datei auch mitwechseln. Außerdem merkt er sich je 50 Einträge der letzten
" Marken, command, input und search history. f1 heißt, daß globale Marken
" gespeichert werden (A_Z0-9). Register werden nicht gespeichert, wäre mit
" <500 möglich (500 Zeilen je Register)
set viminfo='50,f1,:50,@50,/50"}}}

" Autocommands"{{{
if has("autocmd")
    augroup AutoCmds
        autocmd!
        " Insert Arges copyright
        autocmd FileType cpp  :iab aarges /*<CR> Copyright (C) Arges GmbH<CR>      www.arges.de<ESC>jji
        autocmd FileType c    :iab aarges /*<CR> Copyright (C) Arges GmbH<CR>      www.arges.de<ESC>jji

        " For Helpfiles I like a slightly changed keymapping:
        " <Return> brings you to the tag under the cursor
        " <BS> brings you back
        autocmd FileType help call AuxHelpKeyMappings()

        " In Makefiles show tabs
        autocmd FileType make setlocal list listchars=tab:>-,trail:-

        " I watch Logfiles usually without Linewrapping
        autocmd BufNewFile,BufRead *.log setlocal nowrap

        " C-Files should be treated as CPP files
        autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setlocal filetype=cpp.doxygen

        " Doxygenfiles should be treated as doxygen files
        autocmd BufNewFile,BufRead *.dox setlocal syntax=doxygen

        " Remove trailing whitespaces on save for the following files:
        autocmd BufWritePre *.c,*.cpp,*.h,*.dox,*.sh,.vimrc,.gvimrc,.bashrc,*.rb,*.py,*.java,*.pro,*.pri :call <SID>StripTrailingWhitespaces()
    augroup END
endif"}}}

" Mappings {{{
" NerdTree toggling with F1
noremap <silent> <F1> :NERDTreeToggle<CR>
inoremap <silent> <F1> <ESC>:NERDTreeToggle<CR>i

" UndoTree toggling with S-F1
noremap <silent> <S-F1> :UndotreeToggle<CR>
inoremap <silent> <S-F1> <ESC>:UndotreeToggle<CR>

" BufferExplorer with F2
noremap <silent> <F2> :BufExplorer<CR>
inoremap <silent> <F2> <ESC>:BufExplorer<CR>


" F3 shows every line in which the word under the cursor appears.
" s-F3 shows the first appearance of the the word under the cursor.
noremap <F3> [I
noremap <S-F3> [i
inoremap <F3> <ESC>[I
inoremap <S-F3> <ESC>[i

noremap <silent> <F4> :Gstatus<CR>
noremap <silent> <S-F4> :Gblame<CR>


" When pressing F5 toggle the relativenumber-view
noremap <silent> <F5> :set relativenumber!<CR>
inoremap <silent> <F5> <ESC>:set relativenumber!<CR>i

" F7 removes trailing whitespaces from whole file
noremap <silent> <F6> :call <SID>StripTrailingWhitespaces<CR>
inoremap <silent> <F6> :call <SID>StripTrailingWhitespaces<CR>i


" Fuer folgende Sachen muss man auf der oeffnenden geschweiften
" Klammer der Methode/Konstruktor/Destructor stehen und die
" geschweifte Klammer muss in direkt unter der Funktionsdefinition
" stehen.
" Used for Astade-Tracing
" F10: NOTIFY_FUNCTION_CALL
" F11: MOTIFY_CONSTRUCTOR
" ShiftF12: NOTIFY_DESTRUCTOR
noremap <F10> k0/::<CR>b"yyw"wy0nll"zyw/(<CR>v%"xyjoNOTIFY_FUNCTION_CALL(this, 5, "<ESC>"ypA", "<ESC>"zpA", "<ESC>"xpA", "<ESC>"wpA")<ESC>0/"<CR>nnnnlxnhx<ESC>:nohls<CR>0

noremap <F11> k0/::<CR>b"yyw"wy0nll"zyw/(<CR>v%"xyjoNOTIFY_CONSTRUCTOR(5, "<ESC>"ypA", "<ESC>"xpA")<ESC>0/"<CR>2nlxnhx<ESC>:nohls<CR>0
noremap <S-F11> k0/::<CR>b"yywnll"zyw/(<CR>v%"xyjoNOTIFY_DESTRUCTOR(5, "<ESC>"ypA")<ESC>:nohls<CR>0


" Delete complete buffer
noremap <c-d> 1GdG
inoremap <c-d> <ESC>1GdGi

noremap <leader>ev :split $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" open the alternate file in split
noremap <leader>a :AS<CR>

" Yank entire buffer
nnoremap gy :%y+<CR>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands
nnoremap Y y$

" Go to the beginning and end of lines easier
noremap H ^
noremap L $

" Easier Redo
nnoremap U <C-r>

" Space selects the current word
noremap <SPACE> viw

" - deletes the current line and places it one line below
noremap - ddp

" + deletes the current line and places it one line below
noremap + ddkP

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Surround the commented line with lines.
" Example:
" # Test 123
" becomes
" # --------
" # Test 123
" # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-"lyyk"lP<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" This reduces a range of empty lines into one line only
noremap <leader>b GoZ<ESC>:g/^[ <TAB>]*$/,/[^ <TAB>]/-j<CR>Gdd

" go to next window with TAB and to previous with Shift-TAB
noremap <Tab> <C-W>w
noremap <S-Tab> <C-W>W
inoremap <Tab> <ESC><C-W>w
inoremap <S-Tab> <ESC><C-W>W

" CTRL-= will make all windows (almost) equaly high and wide
noremap <C-=> <C-W>=
inoremap <C-=> <C-W>=

" ,+ will make the current window bigger, ,- will make it smaller
noremap <silent> <leader>+:resize +10<CR>
noremap <silent> <leader>- :resize -10<CR>

nnoremap Q gq
vnoremap Q gq

noremap :alias map
noremap :which map

" Insert line by pressing Enter in command-mode.
nnoremap <CR> o<ESC>

" fast buffer switching:
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-b> :bp<CR>

" (Klammern) um das aktuelle Wort
noremap <leader><leader> bi(<ESC>lea)<ESC>
inoremap <leader><leader> <ESC>bi(<ESC>lea)

" Join der aktuellen Zeile mit der naechsten.
nnoremap J :let i=":normal ".col(".")."l"<CR>J0:execute i<CR>h

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Clear search highlights in normal mode by hitting <ESC>
"noremap <silent> <esc> :noh<return><esc>"}}}

" Functions"{{{
function! AuxHelpKeyMappings() range
  noremap <buffer><silent><CR> <C-]>
  noremap <buffer><silent><BS> <C-T>
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction"}}}

" Abbreviations"{{{
iab _i18n  internationalization
iab alos      also
iab aslo      also
iab bianry    binary
iab bianries  binaries
iab charcter  character
iab charcters characters
iab exmaple   example
iab exmaples  examples
iab shoudl    should
iab seperate  separate
iab teh       the
iab tpyo      typo
iab tihs      this
iab widht     width
iab heigth    height
iab fro       for
iab swithc    switch
iab calss     class
iab ddate     <C-R>=strftime("%Y-%m-%d")<CR>


" Some frequent typos in German:
iab nciht     nicht
iab doer      oder
iab Michale   Michael"}}}"}}}

" Colorscheme"{{{
" Only on terminal use the solarized colorscheme
if !has('gui_running')
  colors solarized
endif
"}}}

" vim:tw=70 et sw=4 nowrap comments=\:\"
