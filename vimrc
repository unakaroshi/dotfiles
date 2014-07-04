set nocompatible
let mapleader=","
let maplocalleader="\\"

" =====================================================================
" Configure Vundle
" http://github.com/gmarik/Vundle.vim
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'corntrace/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'TaskList.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'tsaleh/vim-supertab'
Plugin 'SearchComplete'
Plugin 'matchit.zip'
"Plugin 'msanders/snipmate.vim'
Plugin 'christoomey/vim-space'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jammy.vim'
Plugin 'a.vim'
Plugin 'c.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype on
filetype plugin on


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"====================================================================




" Pathogen for the plugins which are not handled by Vundle
"execute pathogen#infect()

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

" C-Plugin configuration
let g:C_GlobalTemplateFile = '/home/roehrl/.vim/c-support/templates/Templates'
let g:C_Dictionary_File = '/home/roehrl/.vim/c-support/wordlists/c-c++-keywords.list,'.
                        \ '/home/roehrl/.vim/c-support/wordlists/k+r-keywords.list,'.
                        \ '/home/roehrl/.vim/c-support/wordlists/stl_index.list,'.
                        \ '/home/roehrl/.vim/c-support/wordlists/NyC.list'

" Nerdtree Configuration
let NERDTreeIgnore=['\.d$', '\.o$', '\~$']




set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set backup
set backupdir=$HOME/.vimbackup
set esckeys
set expandtab
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
set tags=/home/roehrl/src/ControllerLib/ARG_ControllerLib/tags
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
set viminfo='50,f1,:50,@50,/50


" Configure the shell
if has("dos16") || has("dos32")
  let shell='command.com'
endif
if has("unix")
  let &shell="bash\ -l"
endif


augroup FileTypeGroup
  au!
  " For Helpfiles I like a slightly changed keymapping:
  " <Return> brings you to the tag under the cursor
  " <BS> brings you back
  au FileType help call AuxHelpKeyMappings()

  " I watch Logfiles usually without Linewrapping
  au BufNewFile,BufRead *.log set nowrap
  au BufNewFile,BufRead *.c inoremap { {<CR>}<ESC>O
  au BufNewFile,BufRead *.c set ft=cpp
  au BufNewFile,BufRead *.dox set syntax=cpp
  au BufNewFile,BufRead *.cpp inoremap { {<CR>}<ESC>O
  au BufNewFile,BufRead *.h inoremap { {<CR>}<ESC>O
augroup END


function! AuxHelpKeyMappings() range
  nmap <buffer><silent><CR> <C-]>
  nmap <buffer><silent><BS> <C-T>
endfunction


" NerdTree toggling with F1
map <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> <ESC>:NERDTreeToggle<CR>i

" BufferExplorer with F2
map <silent> <F2> :BufferExplorer<CR>
imap <silent> <F2> <ESC>:BufferExplorer<CR>


" F3 shows every line in which the word under the cursor appears.
" s-F3 shows the first appearance of the the word under the cursor.
map <F3> [I
map <S-F3> [i
imap <F3> <ESC>[I
imap <S-F3> <ESC>[i

" Jump to Tags with F4 and jumb back from tags with Shift F4
map <F4> <C-]>
map <S-F4> <C-T>
imap <F4> <ESC><C-]>i
imap <S-F4> <ESC><C-T>i

" Show Spaces at end of line and Tabs everywhere
" by pressing F2 or F3
map <F5> :set list<C-M>
map <S-F5> :set nolist<C-M>
imap <F5> <ESC>:set list<C-M>a
imap <S-F5> <ESC>:set nolist<C-M>a


" Set fileencoding to utf-8
vnoremap <F6> :set fenc=utf-8<CR>

" F7 removes trailing whitespaces from whole file
map <F7> :%s/\s\+$//<CR>
imap <F7> <ESC>:%s/\s\+$//<CR>

" Doxygencomment
map <F8> :Dox<CR>
imap <F8> <ESC>:Dox<CR>i

" Comments
" F9 Toggle the comment
" Shift-F9 Inverts the comment
map <F9> <plug>NERDCommenterToggle
map <S-F9> <plug>NERDCommenterInvert
vmap <F9> <plug>NERDCommenterToggle
vmap <S-F9> <plug>NERDCommenterInvert
imap <F9> <plug>NERDCommenterToggle
vmap <S-F9> <plug>NERDCommenterInvert


" Fuer folgende Sachen muss man auf der oeffnenden geschweiften
" Klammer der Methode/Konstruktor/Destructor stehen und die
" geschweifte Klammer muss in direkt unter der Funktionsdefinition
" stehen.
" Used for Astade-Tracing
" F10: NOTIFY_FUNCTION_CALL
" F11: MOTIFY_CONSTRUCTOR
" ShiftF12: NOTIFY_DESTRUCTOR
map <F10> k0/::<CR>b"yyw"wy0nll"zyw/(<CR>v%"xyjoNOTIFY_FUNCTION_CALL(this, 5, "<ESC>"ypA", "<ESC>"zpA", "<ESC>"xpA", "<ESC>"wpA")<ESC>0/"<CR>nnnnlxnhx<ESC>:nohls<CR>0
map <F11> k0/::<CR>b"yyw"wy0nll"zyw/(<CR>v%"xyjoNOTIFY_CONSTRUCTOR(5, "<ESC>"ypA", "<ESC>"xpA")<ESC>0/"<CR>2nlxnhx<ESC>:nohls<CR>0
map <S-F11> k0/::<CR>b"yywnll"zyw/(<CR>v%"xyjoNOTIFY_DESTRUCTOR(5, "<ESC>"ypA")<ESC>:nohls<CR>0

" Insert Arges copyright
map <F12> O/*<CR>Copyright (C) Arges GmbH<CR>      www.arges.de<ESC>jo<ESC>
imap <F12> <ESC>O/*<CR>Copyright (C) Arges GmbH<CR>      www.arges.de<ESC>jo

" Delete complete buffer
map <c-d> 1GdG
imap <c-d> <ESC>1GdGi

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
map <leader>b GoZ<ESC>:g/^[ <TAB>]*$/,/[^ <TAB>]/-j<CR>Gdd

" go to next window with SHIFT-TAB
noremap <S-Tab> <C-W>w
inoremap <S-Tab> <ESC><C-W>w

nnoremap Q gq
vnoremap Q gq

map :alias map
map :which map

" Insert line by pressing Enter in command-mode.
nmap <CR> o<ESC>

" make space move the cursor to the right - much better than a *beep*
nmap \  l

" fast buffer switching:
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-b> :bp<CR>

" Klammern um das aktuelle Wort
map <leader><leader> maa0<ESC>mbbma$a x<ESC>`awgebi(<ESC>ea)<ESC>$xx`blx`a

" Join der aktuellen Zeile mit der naechsten.
nnoremap J :let i=":normal ".col(".")."l"<CR>J0:execute i<CR>h

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Clear search highlights in normal mode by hitting <ESC>
noremap <silent> <esc> :noh<return><esc>



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



" Abbreviations
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
iab Michale   Michael

set enc=utf-8
set fenc=utf-8
set bg=dark

" Only on terminal use the solarized colorscheme
if !has('gui_running')
  colors solarized
endif
"       vim:tw=70 et sw=4 comments=\:\"
