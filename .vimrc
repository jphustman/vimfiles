" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" :NeoBundleList        - list configured bundles
" :NeoBundleInstall(!)  - install (update) bundles
" :NeoBundleClean(!)    - confirm (or auto-approve) removal of bundles
"
" spell Identify platform {
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
    if &compatible
        set nocompatible    " Be iMproved
    endif

    " Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Bundles {
" filetype off
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'git@github.com:jphustman/cf-utils.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'cflint/cflint-syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'matchit.zip'
NeoBundle 'jphustman/Align.vim'
NeoBundle 'jphustman/SQLUtilities'
NeoBundle 'jphustman/dbext.vim'
NeoBundle 'jlanzarotta/bufexplorer'

if WINDOWS()
    NeoBundle 'bling/vim-airline'
else
	NeoBundle 'Lokaltog/powerline', {'rtp':'~/.vim/bundle/powerline/powerline/bindings/vim'}
endif

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vsutil.vim'
NeoBundle 'VimRegEx.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'


NeoBundle 'justmao945/vim-clang'
NeoBundle 'rhysd/vim-clang-format'

"
" Snippet Stuff
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'git://github.com/jphustman/ultisnippets'

" There are other ways to install YouCompleteMe on Linux
if WINDOWS()
    NeoBundle 'Shougo/neocomplcache.vim'
    NeoBundle 'Shougo/neosnippet.vim'
endif

if OSX()
    NeoBundle 'Valloric/YouCompleteMe'
	NeoBundle 'rizzatti/dash.vim'
endif


" javascript
NeoBundle 'elzr/vim-json'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'matthewsimo/angular-vim-snippets'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'burnettk/vim-angular'

" HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kaihendry/vim-html5'

" PHP
NeoBundle 'spf13/PIV' " PHP Integration for Vim
NeoBundle 'blueyed/smarty.vim' " Smarty plugin for Vim
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle '2072/PHP-Indenting-for-VIm'
NeoBundle 'stefanich/php.vim-html-enhanced'

" Python
NeoBundle 'klen/python-mode'
NeoBundle 'python.vim'
NeoBundle 'python_match.vim'
NeoBundle 'pythoncomplete'



" *css
NeoBundle 'cakebaker/scss-syntax.vim'


NeoBundle 'tpope/vim-markdown'

" Arduino
NeoBundle 'sudar/vim-arduino-syntax'
NeoBundle 'jplaut/vim-arduino-ino'

NeoBundle 'ynkdir/vim-vimlparser'
NeoBundle 'syngan/vim-vimlint', {
    \ 'depends' : 'ynkdir/vim-vimlparser'}

NeoBundle 'jphustman/VimIRC.vim'

NeoBundle 'wikitopian/hardmode'

call neobundle#end()

filetype plugin indent on    " Required!

NeoBundleCheck
" }

" Syntastic Config {
let g:syntastic_enable_signs = 1
" let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_gjslint_args = '--strict'
let g:syntastic_javascript_jslint_args = "--edition=latest"
"let g:syntastic_javascript_checkers=['eslint', 'jshint', 'jslint']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_cf_checkers=['cflint']
let g:syntastic_cfml_checkers=['cflint']
let g:syntastic_cfscript_checkers=['cflint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_php_checkers=['php', 'phplint', 'jshint']
let g:syntastic_vim_checkers=['vimlint']

"function! ESLintArgs()
    "let rules = findfile('.eslintrc', '.;')
    "return rules != '' ? '--rulesdir ' . shellescape(fnamemodify(rules, ':p:h')) : ''
"endfunction

"autocmd FileType javascript let b:syntastic_javascript_eslint_args = ESLintArgs()

" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]

" }

" vim-javascript {
let g:javascript_enable_domhtmlcss = 1
" }

" UltiSnips {

" }

" NeoSnippet {
"let g:neosnippet#snippets_directory += "./snippets"
" }

" Python {

" Disable PyMode if python support not present
if !has('python')
    let g:pymode = 0
endif

if isdirectory(expand("~/.vim/bundle/python-mode"))
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
endif

" }

" PHP {
if isdirectory(expand("~/.vim/bundle/PIV"))
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
endif
" }

" let g:tagbar_ctags_bin='C:\Users\jphustman\Downloads\ctags58\ctags58\ctags.exe'
set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let g:gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
	let &tags = &tags . ',' . gitroot . '/.git/tags'
endif



let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
color solarized

highlight clear SignColumn
highlight clear LineNr

" indent guides
let g:indent_guides_start_level = 2

" Status Line {
set laststatus=2

" Broken down into easily includeable segments
"set statusline=%<%f\ " Filename
"set statusline+=%h%m%r" Options
"set statusline+=%{fugitive#statusline()}" Git Hotness
"set statusline+=[%{&fo}]
"set statusline+=%=%-14.(%l,%c%V%)\ %P"

" Janus
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n
set statusline+=[%b][0x%B]

" Syntastic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"set statusline+=\ [%{&ff}/%Y] " Filetype
"set statusline+=\ [%{getcwd()}] " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
" }

" NeoComplCache {
    if WINDOWS()
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        let g:neocomplcache_keyword_patterns = {}
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

        " Plugin key-mappings {
        " These two lines conflict with the default digraph mapping of <C-K>
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        imap <silent><expr><C-k> neosnippet#expandable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                    \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        inoremap <expr><C-g> neocomplcache#undo_completion()
        inoremap <expr><C-l> neocomplcache#complete_common_string()
        "inoremap <expr><CR> neocomplcache#complete_common_string()

        function! CleverCr()
            if pumvisible()
                if neosnippet#expandable()
                    let exp = "\<Plug>(neosnippet_expand)"
                    return exp . neocomplcache#close_popup()
                else
                    return neocomplcache#close_popup()
                endif
            else
                return "\<CR>"
            endif
        endfunction

        " <CR> close popup and save indent or expand snippet
        imap <expr> <CR> CleverCr()

        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
        "inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()
        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
        " }

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " Enable heavy omni completion.
        let g:neocomplcache_omni_patterns = {}
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
    endif
" }

" YouCompleteMe and UltiSnips {
if LINUX()
	let g:acp_enableAtStartup = 0

	" enable completion from tags
	let g:ycm_collect_identifiers_from_tags_files = 1

	" remap Ultisnips for compatibility for YCM
	let g:UltiSnipsExpandTrigger = '<C-j>'
	let g:UltiSnipsJumpForwardTrigger = '<C-j>'
	let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

	" Haskell post write lint and check with ghcmod
	" $ `cabal install ghcmod` if missing and ensure
	" ~/.cabal/bin is in your $PATH.
	if !executable("ghcmod")
		autocmd BufWritePost *.hs GhcModCheckAndLintAsync
	endif

	" For snippet_complete marker.
	if has('conceal')
		set conceallevel=2 concealcursor=i
	endif

	" Disable the neosnippet preview candidate window
	" When enabled, there can be too much visual noise
	" especially when splits are used.
	set completeopt-=preview

endif
" }

" NerdTree {
if isdirectory(expand("~/.vim/bundle/nerdtree"))

    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let g:NERDTreeShowBookmarks=1
    let g:NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let g:NERDTreeChDirMode=0
    let g:NERDTreeQuitOnOpen=0
    let g:NERDTreeMouseMode=2
    let g:NERDTreeShowHidden=1
    let g:NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0

endif
" }

" Initialize NERDTree as needed {
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }

" vim-airline {
if WINDOWS()
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols ?, ?, ?, ?, ?, ?, and ?.in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if isdirectory(expand('~/.vim/bundle/vim-airline/'))
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    endif
endif
" }

" General
if OSX() |
	set background=light
	set guioptions+=T
else
	set background=dark
endif


" Gui {
if has('gui_running')
	"set lines=40                " 40 lines of text instead of 24
	if !exists('g:spf13_no_big_font')
		if LINUX() && has('gui_running')
			set guifont=Source\ Code\ Pro\ 10
		elseif OSX() && has('gui_running')
			set guifont=Inconsolata\ for\ Powerline:h14
		elseif WINDOWS() && has('gui_running')
			set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
		endif
	endif
else
	if &term == 'xterm' || &term == 'screen'
		set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
		set background=light
	endif
	"set term=builtin_ansi       " Make arrow and other keys work
endif
" }

" Variables {
set lazyredraw
set viewoptions=folds,options,cursor,unix,slash


" stop autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax enable
set nospell
set mouse=a
set mousehide
scriptencoding utf-8
"set columns=120
"set lines=40
highlight ColorColumn ctermbg=darkgray
set modeline
set modelines=5

set showmode
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set visualbell
set comments=sl:/*,mb:*,elx:*/

set colorcolumn=80
"set textwidth=72
"set wrapmargin=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set cindent

" set nowrap
set nojoinspaces
set splitright
set splitbelow

set virtualedit=onemore

set cursorline
set tabpagemax=15

autocmd FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }

" For when you forget to sudo.. Really write the file
cmap w!! w !sudo tee % >/dev/null

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
let g:mapleader=','
let g:maplocalleader=',,'


" Wild settings (from Janus)
" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*



" Mappings {
noremap <leader>- ddp
noremap <leader>_ ddkP
inoremap <leader><c-u> <esc>bveU$a
nnoremap <leader><c-u> bveU

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap H O
nnoremap L $

nmap <F2> :SyntasticCheck<CR>
nmap <S-F2> :SyntasticToggleMode<CR>

nmap <F3> :set list!<CR>

nmap <F4> vii:sort i<cr>
vnoremap <F4> :sort i<cr>

nmap <F8> :TagbarToggle<CR>

map <F9> :call ToggleBGColor()<CR>

nnoremap <leader>8 :lprev<CR>
nnoremap <leader>9 :lnext<CR>



function! ToggleBGColor ()
	if (&background == 'light')
		set background=dark
		echo 'background -> dark'
	else
		set background=light
		echo 'background -> light'
	endif
endfunction

nmap <leader>/ :nohlsearch<CR>

"map <c-J> <c-W>j<c-w>_
"map <c-K> <c-W>k<c-w>_
"map <c-L> <c-W>l<c-w>_
"map <c-H> <c-W>h<c-w>_
map <c-J> <c-W>j
map <c-K> <c-W>k
map <c-L> <c-W>l
map <c-H> <c-W>h



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
nmap <leader>fman :set foldmethod=manual<CR>
nmap <leader>fsyn :set foldmethod=syntax<CR>
nmap <leader>find :set foldmethod=indent<CR>
nmap <leader>fmark :set foldmethod=marker<CR>
" }

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" misc {

iabbrev adn and
iabbrev waht what
iabbrev tehn then


set showmatch
set incsearch
set hlsearch

set backspace=indent,eol,start
set linespace=0

set winminheight=0
set ignorecase
set smartcase
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3


set foldenable
set foldmethod=indent
"set foldlevel=1
"set foldclose=all

" List chars (from Janus)
set list
set listchars=""            " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.      " show trailing spaces as dots
set listchars+=extends:>    " The character to show in the last column when wrap is
                            " off and the line continues beyond the right of the screen
set listchars+=precedes:<   " The character to show in the last column when wrap is
                            " off and the line continues beyond the left of the screen

"set listchars=tab:¿\ ,trail:¿,extends:#,nbsp:. " Highlight problematic whitespace
"set listchars+=precedes:<,extends:>

function! Sorted(l)
	let new_list = deepcopy(a:l)
	call sort(new_list)
	return new_list
endfunction

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
let &path.='src/include,/usr/include/AL,'
set includeexpr=substitute(v:fname,'\\.','/','g')
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"set makeprg=make\ -C\ ../build\ -j9

" Arduino specifics
au BufRead,BufNewFile *.ino,*.pde set filetype=arduino

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
		if exists('*mkdir')
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo 'Warning: Unable to create backup directory: ' . directory
			echo 'Try: mkdir -p ' . directory
		else
			let directory = substitute(directory, ' ', '\\\\ ', 'g')
			exec 'set ' . settingname . '=' . directory
		endif
	endfor
endfunction
call InitializeDirectories()
" }

" remove trailing whitespace {
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()
function! StripTrailingWhitespace()
	" save last search and cursor position
	let _s=@/
	let l = line('.')
	let c = col('.')

	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
" }

