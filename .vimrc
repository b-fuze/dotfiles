" vim: fdm=marker:
" Recommended for vim >= 7; no guarantee of compatibility with earlier versions
" Lucas Oman <me@lucasoman.com>
" --enable-rubyinterp --prefix=/usr --enable-ruby
" Get latest from: http://github.com/lucasoman/Conf/raw/master/.vimrc

" Link to Java LSP
let g:ale_java_javalsp_executable = '/media/b-fuse/22fb982d-3d59-4389-817d-a482aef0ec5a/home/b-fuse/Projects/git/java-language-server/dist/mac/bin/launcher'

" Restrict C to clangd
let b:ale_linters = {'c': ['ccls'], 'cpp': ['ccls'], 'javascript': ['tsserver'], 'java': ['javalsp'], 'rust': ['rls']}
let g:ale_sign_column_always = 1

let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1
let g:ale_echo_cursor = 0
let g:ale_lint_delay = 500
let g:ale_set_balloons = 1
set balloondelay=250

" ALE Config options

" Disable ALE completion
let g:ale_completion_enabled = 0


" load pathogen
execute pathogen#infect()


" ALE... with deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources = {'_': ['ale']}
" call deoplete#custom#source('ale', 'rank', 999)
" Don't deoplete so quick
let g:deoplete#auto_complete_delay = 100

" Close Deoplete tip window when a selection is
" made on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd BufWritePost * pclose

" Larger cmdheight for echodoc
set cmdheight=2

" Use tab for deoplete
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set clangd manually
let g:ale_c_clangd_executable = '/usr/lib/llvm-6.0/bin/clangd'

"set t_Co=256

" misc options
" {{{ interface
" lines, cols in status line
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI

" display the number of (characters|lines) in visual mode, also cur command
set showcmd

" current mode in status line
set showmode

" max items in popup menu
set pumheight=8

" show number column
set number
set numberwidth=3

" show fold column, fold by markers
set foldcolumn=2
set foldmethod=marker

" indicate when a line is wrapped by prefixing wrapped line with '> '
" set showbreak=>\

" always show tab line
set showtabline=2

" highlight search matches
set hlsearch

" highlight position of cursor
"set cursorline
"set cursorcolumn

"set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set laststatus=2
" }}}
" {{{ behavior
set nocompatible
syntax on
filetype on
filetype plugin on

" fast terminal for smoother redrawing
set ttyfast

set omnifunc=syntaxcomplete#Complete

" indentation options
" Note: smartindent is seriously outdated. cindent, even, is unnecessary.
" Let the filetype plugins do the work.
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
filetype indent on
"set autoindent
"set cindent


" show matching enclosing chars for .1 sec
set showmatch
set matchtime=1

" t: autowrap text using textwidth
" l: long lines are not broken in insert mode
" c: autowrap comments using textwidth, inserting leader
" r: insert comment leader after <CR>
" o: insert comment leader after o or O
set formatoptions-=t
set formatoptions+=lcro
set textwidth=80

" context while scrolling
set scrolloff=3

" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

" backspace over anything
set backspace=indent,eol,start

" case insensitive search if all lowercase
set ignorecase smartcase

" turn off bells, change to screen flash
set visualbell

" show our whitespace
set listchars=tab:\|\ ,trail:.
set list

" complete to longest match, then list possibilities
set wildmode=longest,list

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" keep a lot of history
set history=100

" keep lots of stuff
set viminfo+=:100
set viminfo+=/100

" don't duplicate an existing open buffer
set switchbuf=useopen

" }}}
" {{{ colors
highlight SpecialKey cterm=bold ctermfg=0
" tabe line colors
highlight TabLineFill ctermfg=DarkGray
highlight TabLine ctermfg=4 ctermbg=DarkGray cterm=bold
highlight TabLineSel ctermfg=7 cterm=none ctermbg=DarkGray

" number column colors
highlight LineNr cterm=none ctermbg=none ctermfg=4

" fold colors
highlight Folded cterm=none ctermbg=none ctermfg=4
highlight FoldColumn cterm=none ctermbg=none ctermfg=4

" visual mode colors
highlight Visual ctermbg=7 ctermfg=4

" dictionary menu colors
highlight Pmenu ctermbg=7 ctermfg=0
highlight PmenuSel ctermbg=Yellow ctermfg=0

" diff colors
highlight DiffAdd cterm=none ctermbg=4
highlight DiffDelete cterm=none ctermbg=4
highlight DiffChange cterm=none ctermbg=4
highlight DiffText cterm=none ctermbg=4

" keep cursor column last so it overrides all others
highlight CursorColumn cterm=none ctermbg=Black
highlight CursorLine cterm=none ctermbg=Black

highlight Search cterm=none ctermbg=7 ctermfg=4

" make sure bold is disabled or your terminal will look like the vegas strip
set background=dark
" }}}
" {{{ filetype dependent
autocmd BufNewFile,BufRead *.html setlocal commentstring=<!--%s-->
" ruby commenstring
autocmd FileType ruby setlocal commentstring=#%s
" make help navigation easier
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
"}}}
"php syntax options {{{
let php_sql_query = 1  "for SQL syntax highlighting inside strings
let php_htmlInStrings = 1  "for HTML syntax highlighting inside strings
"php_baselib = 1  "for highlighting baselib functions
"php_asp_tags = 1  "for highlighting ASP-style short tags
"php_parent_error_close = 1  "for highlighting parent error ] or )
"php_parent_error_open = 1  "for skipping an php end tag, if there exists an open ( or [ without a closing one
"php_oldStyle = 1  "for using old colorstyle
"php_noShortTags = 1  "don't sync <? ?> as php
let php_folding = 1  "for folding classes and functions
" }}}
"netrw options {{{
let g:netrw_sort_sequence = '[\/]$,\.php,\.phtml,*,\.info$,\.swp$,\.bak$,\~$'
"}}}
"{{{taglist options
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant;p:property'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 60
" close tlist when a selection is made
let Tlist_Close_On_Select = 1
" show the prototype
let Tlist_Display_Prototype = 1
" show tags only for current buffer
let Tlist_Show_One_File = 1
"}}}
"{{{html options
let html_use_css = 1
"}}}

" mappings
" {{{ general
let mapleader = "\\"
" easier move screen up/down
nmap <C-j> <C-e>
nmap <C-k> <C-y>
nmap <space> za
" turns off highlighting
nmap <Leader>/ :nohl<CR>
" search for highlighted text
vmap // y/<C-R>"<CR>
" keep block highlighted when indenting
vmap >> >gv
vmap << <gv
" fix a block of XML; inserts newlines, indents properly, folds by indent
nmap <Leader>fx :setlocal filetype=xml<CR>:%s/></>\r</g<CR>:1,$!xmllint --format -<CR>:setlocal foldmethod=indent<CR>
" comment/uncomment highlighted block
vmap <Leader>cc :s!^!//!<CR>
vmap <Leader>cu :s!^//!!<CR>
" open local projects list file
nmap <Leader>l :70vsplit ~/Dropbox/projects.list<CR>
" fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>
" toggle the tag list
nmap <Leader>tl :TlistToggle<CR>
" toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" make arrow keys useful
" use them to swap between split windows
nmap <left> <C-W>h
nmap <right> <C-W>l
nmap <up> <C-W>k
nmap <down> <C-W>j
com -range XselCopy :<line1>,<line2>w !xsel -i -b
com XselPaste :r !xsel -o -b
vmap <silent> <Leader>xc :XselCopy<CR>
nmap <silent> <Leader>xp :XselPaste<CR>
"}}}
" php {{{
" syntax check
nmap <Leader>ps :!php -l %<CR>
" run current script
nmap <Leader>pr :!php % \| less -F<CR>
" lookup keyword in function reference
nmap <Leader>ph :!pman <cword><CR>
" create test method
nmap <Leader>pt o<CR>/**<CR>@test<CR>/<CR>public function<TAB>
" phpdoc comments
nmap <Leader>cc o/**<CR>$Rev$<CR>$Date$<CR>$Id$<CR>$Author$<CR>$HeadURL$<CR><CR><CR><CR>@package <CR><BS>/<ESC>kkk$a
nmap <Leader>cb o/**<CR><CR><CR>@param <CR>@return <CR>@example <CR><BS>/<ESC>kkkkk$a
nmap <Leader>cv o/**<CR><CR><CR>@var <CR><BS>/<ESC>kkk$a
nmap <Leader>cp o/**<CR><CR><CR>@author Lucas Oman <me@lucasoman.com><CR>@param <CR>@return <CR>@example <CR><BS>/<ESC>kkkkkk$a
"}}}
" svn {{{
" set svn keywords
nmap <Leader>sk :!svn propset svn:keywords "Rev Date Id Author HeadURL" %<CR>
nmap <Leader>sp :call SvnPushFile()<CR>
com! -nargs=1 Sstat :call SvnStatus("<args>")

" view status of given path
fun! SvnStatus(path)
	tabe
	setl buftype=nofile
	exe "r !svn st ".a:path
endfunction

" call script to copy file to appropriate location in htdocs
fun! SvnPushFile()
	let line = getline('.')
	let file = strpart(l:line,8)
	exe "!~/lib/updatedev.php ".l:file
endfunction
"}}}
"f keys {{{
nmap <F2> :call ToggleColumns()<CR>
imap <F2> <C-o>:call ToggleColumns()<CR>
nmap <F3> :Nload<CR>
nmap <F4> :NERDTree<CR>
set pastetoggle=<F5>
" <F6>
nmap <F7> :!updatedev.php %:p<CR>
nmap <F8> :call WriteTrace()<CR>
nmap <F9> \ph
" <F10>
" <F11> don't use; terminal full-screen
" <F12>
" }}}
"{{{ list file
let g:listFile_ranks = ['=','1','2','3','4','5','!','o','-','?','x']
autocmd BufNewFile,BufRead *.list call MyListFileStuff()
fun! MyListFileStuff()
	nmap <buffer> ,! :Lmark !<CR>
	vmap <buffer> ,! :Lmark !<CR>
	nmap <buffer> ,tq :Ltag quick<CR>
	vmap <buffer> ,tq :Ltag quick<CR>
	nmap <buffer> ,sq :Lsearch tag quick<CR>
	nmap <buffer> ,d ,x,t,r
endfunction
"}}}

" minor helpful stuff
fun! ToggleColumns() "{{{
	"make it easy to remove line number column etc. for cross-terminal copy/paste
  if &number
    set nonumber
    set foldcolumn=0
    let s:showbreaktmp = &showbreak
    set showbreak=
  else
    set number
    set foldcolumn=2
    let &showbreak = s:showbreaktmp
  end
endfunction
"}}}
fun! WriteTrace() "{{{
	let lineNum = line('.')
	let lineFile = bufname('%')
	let lineVal = getline(lineNum)

	let allLines = readfile($HOME."/trace.txt")
	let allLines = add(allLines,lineFile.":".lineNum)
	let allLines = add(allLines,lineVal)
	let allLines = add(allLines,"")

	call writefile(allLines,$HOME."/trace.txt")
endfunction
"}}}
"{{{ctags stuff
nmap <Leader>tf :call CtagsFind(expand('<cword>'))<CR>
com! -nargs=+ Tf :call CtagsFind("<args>")
" split window and search for tag
nmap <Leader>ts :exe('stj '.expand('<cword>'))<CR>

" open new tab and search for tag
fun! CtagsFind(keyword)
	tabe
	exe "tj ".a:keyword
endfunction
"}}}

" stand-alone components
"{{{ TAB-COMPLETE and SNIPPETS
" add new snippets as regex=>completion
" first match encountered is used
let s:snippets = {}
let s:snippets['^\s*if$'] = " () {\<CR>}\<ESC>k^f)i"
let s:snippets['function$'] = " () {\<CR>}\<ESC>k^f(i"
let s:snippets['^\s*class$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*interface$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*foreach$'] = " () {\<CR>}\<ESC>k^f)i"
let s:snippets['^\s*while$'] = " () {\<CR>}\<ESC>k^f)i"

" when tab is pressed:
" 1) checks snippets for matches, return match if there is one
" 2) if character behind cursor is whitespace, just return a tab
" 3) if word behind cursor contains a slash, try filename complete
" 4) otherwise, try to ctrl-p complete
fun! CleverTab()
	if pumvisible()
		return "\<C-N>"
	endif
	if col('.') > 1
		let beginning = strpart( getline('.'), 0, col('.')-1 )
		let words = split(l:beginning,' ')
		let thisWord = l:words[-1]

		for key in keys(s:snippets)
			if l:beginning =~ key
				return s:snippets[key]
			endif
		endfor
	else
		let beginning = ''
	endif

	if l:beginning == '' || l:beginning =~ '\s$'
		return "\<Tab>"
	elseif (l:thisWord =~ '/')
		return "\<C-X>\<C-F>"
	else
		return "\<C-X>\<C-O>"
		"return "\<C-P>"
	endif
endfunction
" imap <Tab> <C-R>=CleverTab()<CR>
"}}}
"CODE GREP {{{
" grep for given string (second is case insensitive)
" simply a wrapper for vimgrep
" eg: :F /badxmlexception/ lib php
com! -nargs=+ F :call CommandFind("<args>")
fun! CommandFind(args)
	tabe
	let parts = split(a:args,' ')
	exe "vimgrep ".l:parts[0]." ".l:parts[1]."/**/*.".l:parts[2]
	exe "copen"
endfunction
"}}}
"{{{ TAB MGMT
" Some useful bits for managing tabs.
" Also changes format of tab line.
" Commands and shortcuts:
" \oc - open dir of current file in new tab
" H - navigate to tab to the left
" L - navigate to tab to the right
" C-l - move current tab left
" C-h - move current tab right
" gf - changes default behavior from opening file under cursor in current window to opening in new tab
nmap <Leader>oc :tabe %:h<CR>

" quicker aliases for navigating tabs
nmap H gT
nmap L gt
" move tab left or right
nmap <C-l> :call MoveTab(0)<CR>
nmap <C-h> :call MoveTab(-2)<CR>

" gf should use new tab, not current buffer
map gf :tabe <cfile><CR>

"tab line
fun! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'.(i+1).''
		" the filename is made by MyTabLabel()
		let s .= '%{MyTabLabel(' . (i + 1) . ')}  '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	return s
endfunction

fun! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let fullname = bufname(buflist[winnr - 1])
	" show a/b/c/filename.ext
	"let fullname = substitute(fullname,"(\w){1}\w*/","\1/","g")
	" show filename.ext
	let fullname = substitute(fullname,".*/","","")
	if getbufvar(buflist[winnr - 1],"&mod")
		let modified = "+"
	else
		let modified = " "
	endif
	return modified.fullname
endfunction

" Use the above tabe naming scheme
set tabline=%!MyTabLine()

"tab moving
fun! MoveTab(n)
	let which = tabpagenr()
	let which = which + a:n
	exe "tabm ".which
endfunction
"}}}

" b-fuze customizations
set nowrap
let g:markdown_fenced_languages = ['python', 'javascript', 'sh', 'json', 'yaml']

" Wrap without breaking words
set linebreak

" Set dark bg for popup
highlight Pmenu ctermfg=15 ctermbg=DarkGray guibg=DarkGray

" Vim GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'

au BufWrite * :GitGutter

" COC.NVIM

" if hidden is not set, TextEdit might fail.
set hidden

" don't give |ins-completion-menu| messages.
set shortmess+=c

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

autocmd FileType html let b:coc_additional_keywords = ["-"]
autocmd FileType xml let b:coc_additional_keywords = ["-"]
autocmd FileType yaml let b:coc_additional_keywords = ["-"]
autocmd FileType css let b:coc_additional_keywords = ["-"]
autocmd FileType scss let b:coc_additional_keywords = ["-"]
autocmd FileType sh let b:coc_additional_keywords = ["-"]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" /COC.NVIM

" Enable mouse support
set mouse=a
set ttymouse=xterm2

" Multi-cursor mouse
let g:VM_mouse_mappings = 1

" Quick comment
vmap <c-_> gc
nmap <c-_> gc$
imap <c-_> <c-o>gc$

" Quick jump to definition
nmap <C-Right> :ALEGoToDefinitionInSplit<CR>

" Quick find all references
nmap <C-Left> :ALEFindReferences<CR>

" Quick show all tags
nmap <F8> :TagbarToggle<CR>

" Copy buffer to clipboard
fun FuzeCopyToSystemClipboard()
  let l:win_pos = winsaveview()

  normal "+yae

  " Reset view after yanking the view
  call winrestview(l:win_pos)
endfun

" nmap C "+yae``
nmap C :call FuzeCopyToSystemClipboard()<CR>

" Fuzzy file open
nmap <c-p> :CommandT<CR>
nmap <c-b> :CommandTBuffer<CR>
let g:CommandTWildIgnore=&wildignore . ",*/node_modules,*/vendor"
autocmd BufEnter * command! -nargs=+ CommandTOpen :call GotoOrOpenVsplit(<q-args>)

function! GotoOrOpenVsplit(command_and_args) abort
  let l:command_and_args = split(a:command_and_args, '\v^\w+ \zs')
  let l:file = l:command_and_args[1]

  call commandt#GotoOrOpen("vsplit " . l:file)
endfunction

" Surround with string prompt
let g:surround_{char2nr('m')} = "\1Surround: \1\r\1\1"

" Remove bg in gutter (mainly for ALE)
highlight clear SignColumn

" Change ALE colors 
highlight ALEErrorSign ctermbg=NONE cterm=bold ctermfg=Red

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds' : [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" Allow tab to switch between ex-mode completions
set wildmode=longest,list,full
set wildmenu
set sidescroll=1

" Set terminal title bar to file
set titlestring=%t%(\ %M%)%(\ %a%)\ -\ VIM
" autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" Yank to system clipboard
vmap <c-p> "+y

" Preview windows should be at the bottom
set splitbelow

" Easymotion config from GH
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

