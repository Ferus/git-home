" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


""""
" Vundle load
""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Required
Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'Ferus/vimscripts'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'c.vim'
Bundle 'tailtab.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/mru.vim'

filetype plugin indent on

syntax on
let mapleader = ","
set modeline
set number
set list listchars=tab:->,trail:.,nbsp:.
set ts=2
set sw=2
set backspace=eol,start,indent
"set backspace=2
set directory=~/.vim/swaps
set cursorline
set showcmd
set showmatch
set pastetoggle=<F9>
set encoding=utf-8
set encoding=utf-8
set autoread
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1
set ignorecase
set smarttab

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nmap <leader>f :MRU<cr>

" set pwd to current file
autocmd BufEnter * silent! lcd %:p:h 

""""
" pymode
""""
let g:pymode_options = 0
let g:pymode_trim_whitespaces = 1
" pylint
let g:pymode_lint_checkers = ['pylint']
let g:pymode_lint_on_write = 1
let g:pymode_lint_ignore = "W0312,W0703,E1103,C0324,W0704,R0201,W0612,W0621,E0611,F0401,W0102,W0201,R0912,W0106,W0622,W0611,W0122,C0325,W0101,C0301,R0921,C0111"
" folding
let g:pymode_folding = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_slow_sync = 0
" I like my indentation better.
let g:pymode_indent = 0

""""
" tabs
""""
nmap <C-t> :tabnew<CR>
map tn :tabnew<CR>
map th :tabfirst<CR>
map tf :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprevious<CR>
map tl :tablast<CR>
map tc :tabclose<CR>
map tt :tabedit<Space>
map te :tabedit<Space>
map tm :tabmove<Space>

""""
" NERDTree
""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

""""
" Tell vim to remember certain things when we exit
""""
" '10  : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20  : up to 20 lines of command-line history will be remembered
" %    : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

" Remember cursor line
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

""""
" Pastee settings
""""
let g:pastee_usebrowser=1
let g:pastee_webbrowser='firefox'
let g:pastee_printurl=0

""""
" vim-powerline
""""
let g:Powerline_symbols = 'unicode'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"call Pl#Theme#InsertSegment('branch', 'after', 'filetype')
""""
" Whoops, accidentally opened a readonly file..
" Lets map :w!! to write the file instead.
""""
cmap w!! w !sudo tee >/dev/null %

" reload .vimrc when edited
autocmd! bufwritepost .vimrc source ~/.vimrc

""""
" replace tabs with spaces and vice versa because some people use spacesand I
" prefer tabs
""""
function! ReplaceSpacesWithTabsFunc()
	silent! %s/    /\t/g
endfunction
function! ReplaceTabsWithSpacesFunc()
	silent! %s/\t/    /g
endfunction

command! -buffer ReplaceSpacesWithTabs :call ReplaceSpacesWithTabsFunc()
command! -buffer ReplaceTabsWithSpaces :call ReplaceTabsWithSpacesFunc()
