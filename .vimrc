"
" :NeoBundleList        - list configured bundles
" :NeoBundleInstall(!)  - install (update) bundles
" :NeoBundleClean(!)    - confirm (or auto-approve) removal of unused bundles
"
" Identify platform {
	silent function! OSX()
		return has('macunix')
	endfunction
	silent function! LINUX()
		return has('unix') && !has('macunix') && !has('win32unix')
	endfunction
	silent function! WINDOWS()
		return  (has('win16') || has('win32') || has('win64'))
	endfunction
" }

if has('vim_starting')
	set nocompatible    " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Bundles {
filetype off
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'git@github.com:jphustman/cf-utils.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'matchit.zip'
NeoBundle 'jphustman/Align.vim'
NeoBundle 'jphustman/SQLUtilities'
NeoBundle 'jphustman/dbext.vim'
NeoBundle 'Lokaltog/powerline', {'rtp':'~/.vim/bundle/powerline/powerline/bindings/vim'}
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vsutil.vim'
NeoBundle 'VimRegEx.vim'

NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'rhysd/vim-clang-format'

" javascript
NeoBundle 'elzr/vim-json'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'kchmck/vim-coffee-script'

" HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'

" PHP
NeoBundle 'spf13/PIV' " PHP Integration for Vim
NeoBundle 'blueyed/smarty.vim' " Smarty plugin for Vim



NeoBundle 'tpope/vim-markdown'

" Arduino
NeoBundle 'sudar/vim-arduino-syntax'
"NeoBundle 'jplaut/vim-arduino-ino'

call neobundle#end()

filetype plugin indent on    " Required!

NeoBundleCheck
" }

"let g:syntastic_javascript_checkers=['gjslint', 'jshint', 'jslint']
"let g:syntastic_javascript_gjslint_args = '--strict'
"let g:syntastic_javascript_checkers=['jshint']
 let g:syntastic_javascript_jslint_args = '--edition=latest'
 let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_check_on_open = 1

let g:tagbar_ctags_bin='C:\Users\jphustman\Downloads\ctags58\ctags58\ctags.exe'
set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
	let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" General
if OSX()
	set background=light
else
	set background=dark
endif
syntax on
set mouse=a
set mousehide
scriptencoding utf-8
set columns=120
set lines=40
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized

highlight clear SignColumn
highlight clear LineNr

" indent guides
let g:indent_guides_start_level = 2

" Status Line {
set laststatus=2

" Broken down into easily includeable segments
set statusline=%<%f\ " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y] " Filetype
set statusline+=\ [%{getcwd()}] " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
" }



set showmode

if has('gui_running')
	set lines=40                " 40 lines of text instead of 24
	if !exists("g:spf13_no_big_font")
		if LINUX() && has("gui_running")
			set guifont=Inconsolata\ Medium\ 10
		elseif OSX() && has("gui_running")
			set guifont=Andale\ Mono:h13,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
		elseif WINDOWS() && has("gui_running")
			set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
		endif
	endif
else
	if &term == 'xterm' || &term == 'screen'
		set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
	endif
	"set term=builtin_ansi       " Make arrow and other keys work
endif

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set comments=sl:/*,mb:*,elx:*/

"set textwidth=80
"set wrapmargin=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set cindent
autocmd FileType javascript setlocal expandtab

" set nowrap
set nojoinspaces
set splitright
set splitbelow

set virtualedit=onemore

set cursorline
set tabpagemax=15

"set backup
if has('persistent_undo')
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

set history=1000
set number
set sidescroll=5
set shiftround
let mapleader=","
let maplocalleader=",,"

noremap <leader>- ddp
noremap <leader>_ ddkP
inoremap <leader><c-u> <esc>bveU$a
nnoremap <leader><c-u> bveU

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

iabbrev adn and
iabbrev waht what
iabbrev tehn then

nnoremap H O
nnoremap L $

set showmatch
set incsearch
set hlsearch

set backspace=indent,eol,start
set linespace=0

set winminheight=0
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3


set foldenable

set list
set listchars=tab:¿\ ,trail:¿,extends:#,nbsp:. " Highlight problematic whitespace
set listchars+=precedes:<,extends:>

nnoremap <F3> :set list!<CR>

nmap <F8> :TagbarToggle<CR>

map <F9> :call ToggleBGColor()<CR>
function! ToggleBGColor ()
	if (&background == 'light')
		set background=dark
		echo "background -> dark"
	else
		set background=light
		echo "background -> light"
	endif
endfunction

nmap <leader>/ :nohlsearch<CR>

map <c-J> <c-W>j<c-w>_
map <c-K> <c-W>k<c-w>_
map <c-L> <c-W>l<c-w>_
map <c-H> <c-W>h<c-w>_

nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" }



" JSON remove concealing
let g:vim_json_syntax_conceal = 0

" Ctrl-C and V for copypasta
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y

" C++ specific http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc	" enable directory specific .vimrc
set secure	"
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
let &path.="src/include,/usr/include/AL,"
set includeexpr=substitute(v:fname,'\\.','/','g')
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"set makeprg=make\ -C\ ../build\ -j9

" Arduino specifics
au BufRead,BufNewFile *.ino,*.pde set filetype=c++

" \ RegularInitialize directories {
function! InitializeDirectories()
	let parent = $HOME
	let prefix = 'vim'
	let dir_list = {
				\ 'backup': 'backupdir',
				\ 'views': 'viewdir',
				\ 'swap': 'directory' }

	if has('persistent_undo')
		let dir_list['undo'] = 'undodir'
	endif

	let common_dir = parent . '/.' . prefix

	for [dirname, settingname] in items(dir_list)
		let directory = common_dir . dirname . '/'
		if exists("*mkdir")
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo "Warning: Unable to create backup directory: " . directory
			echo "Try: mkdir -p " . directory
		else
			let directory = substitute(directory, " ", "\\\\ ", "g")
			exec "set " . settingname . "=" . directory
		endif
	endfor
endfunction
call InitializeDirectories()
" }

" remove trailing whitespace
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()
function! StripTrailingWhitespace()
	" save last search and cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")

	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction


