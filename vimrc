" VUNDLE CONFIG ========================================================== {{{

" Header {{{
set shell=/bin/bash           " maybe you use fish, like me
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" }}}
" Plugins on GitHub repo {{{

" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Bundle 'mattn/emmet-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Surround
Bundle 'tpope/vim-surround'
" Python mode
Bundle 'klen/python-mode'
" Better autocompletion
Bundle 'Valloric/YouCompleteMe'
" Automatically sort python imports
Bundle 'fisadev/vim-isort'
" Easy motion
Bundle 'Lokaltog/vim-easymotion'
" Git/mercurial/others diff icons on the side of the file lines
Bundle 'mhinz/vim-signify'
" Git integration
Bundle 'motemen/git-vim'
" Git wrapper
Bundle 'tpope/vim-fugitive'
" Autoclose
Bundle 'Raimondi/delimitMate'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
" Pathenses highlight 
Plugin 'junegunn/rainbow_parentheses.vim'
" REPL with tmux
Bundle 'sjl/tslime.vim'
" Airline
Bundle 'bling/vim-airline'
" Window chooser
Bundle 't9md/vim-choosewin'
" Paint css colors with the real color
Bundle 'lilydjwg/colorizer'
" Undo tree, better than Gundo
Bundle 'mbbill/undotree'
" TaskList
Bundle 'fisadev/FixedTaskList.vim'
" Ack
Bundle 'mileszs/ack.vim'
" Snippet
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" }}}
" Plugins from vim-scripts repos {{{

" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Yank history navigation
Bundle 'YankRing.vim'
" Work with R files instead of RStudio
Bundle 'Vim-R-plugin'

" }}}
" Footer {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ
" }}}

" }}}
" VIM SETTINGS AND MAPPINGS ============================================== {{{

" Basic sets {{{
" Set things
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set ttyfast
set ruler
set backspace=indent,eol,start
set nu
set norelativenumber
set laststatus=2
set history=1000
set undofile
set backup
set undoreload=10000
set list
set listchars=nbsp:¶,eol:¬,tab:>-,extends:»,precedes:«
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=indent
set foldlevel=99
set foldlevelstart=0
set formatoptions=qrn1j
set ls=2
set virtualedit+=block
syntax on
" Search and movement
set ignorecase
set smartcase
set incsearch
set showmatch
set gdefault
set hlsearch
set synmaxcol=800
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
" Time out
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}
" My leader {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}
" Basic maps {{{
" ESC
inoremap jk <esc>

" New line without enter insert mode
nmap <leader><cr> o<Esc>

" Disable entering ex fucking mode
map Q <Nop>
let loaded_matchparen = 1

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Kill window
nnoremap tq :q<cr>

" Manual
nnoremap M K

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Clear highlight after searching
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" }}}
" Navigation {{{

" Return to the same line when you reopen a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" More t*
map tc  :lclose<cr>zvzz
map tz <c-w>z

" List navigation
" Alt + Arrow to move between Lists
nnoremap <left>    :cprev<cr>zvzz
nnoremap <right>   :cnext<cr>zvzz
nnoremap <up>      :lprev<cr>zvzz
nnoremap <down>    :lnext<cr>zvzz

" Navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make new window
noremap <leader>v <C-w>v

" Navigate console
noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap H ^
noremap L $
vnoremap L g_

nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

nnoremap gI `.

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}
" Edit tricks {{{
" Copy to and paste from clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+x
nnoremap <C-v> "+p

" Delete from there
nnoremap D d$

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Save as sudo
ca w!! w !sudo tee "%"

" Zip Right
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Insert Mode Completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

" Edit shorcuts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ef :vsplit ~/.config/fish/functions/aliases.fish<cr>
nnoremap <leader>eg :vsplit ~/.gitconfig<cr>
nnoremap <leader>em :vsplit ~/.mutt/muttrc<cr>

" Source
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Trailing white space
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Colors and Highlight {{{

" Use 256 colors
let &t_Co = 256
set background=light

" Error match
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" }}}
" Backup, swap and undos storage {{{
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backupdir=~/.vim/dirs/backups " where to put backup files
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/'

" Create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
" }}}
" Abbreviations {{{
function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction
function! MakeSpacelessBufferIabbrev(from, to)
    execute "iabbrev <silent> <buffer> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('mt/',  'http://manhtai.com/')
call MakeSpacelessIabbrev('bb/',  'http://bitbucket.org/')
call MakeSpacelessIabbrev('bbm/', 'http://bitbucket.org/manhtai/')
call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghm/', 'http://github.com/manhtai/')

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ

iabbrev mt@ vo@manhtai.com
" }}}
" Selection {{{
" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Linewise visual selection
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Easier linewise reselection
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" }}}
" Folding {{{

" Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
nnoremap <c-z> mzzMzvzz15<c-e>`z<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Misc {{{
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Visual mode
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" PLUGINS SETTINGS AND MAPPINGS ========================================== {{{

" Tasklist {{{
map <F2> :TaskList<CR>
" }}}
" NERDTree {{{
map <F3> :NERDTreeToggle<CR>
nmap <leader>t :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" }}}
" Tagbar {{{
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" }}}
" Undo tree {{{
nnoremap <F5> :UndotreeToggle<cr>
" }}}
" Yankring {{{
nnoremap <silent> <leader><tab> :YRShow<CR>

function! YRRunAfterMaps()
    " Make Y yank to end of line.
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>

    " Fix L and H in operator-pending mode, so yH and such works.
    omap <expr> L YRMapsExpression("", "$")
    omap <expr> H YRMapsExpression("", "^")

    " Don't clobber the yank register when pasting over text in visual mode.
    vnoremap p :<c-u>YRPaste 'p', 'v'<cr>gv:YRYankRange 'v'<cr>
endfunction

" }}}
" Snippet {{{
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" }}}
" CtrlP {{{
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_map = '<leader>,'
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>E :CtrlP ../

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/|docs/build/" .
    \ ")'"

let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files --exclude-standard -co | " .
    \ ctrlp_filter_greps

let my_ctrlp_ffind_command = "ffind --semi-restricted --dir %s --type e -B -f"

let g:ctrlp_user_command = ['.git/', my_ctrlp_ffind_command, my_ctrlp_ffind_command]
" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Map some keys
nnoremap <leader>er :Errors<CR>
nnoremap <leader>C :SyntasticCheck<cr>

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_python_python_exec = '/usr/share/python3'
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_enable_signs = 0
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"
let g:syntastic_enable_highlighting = 0
" }}}
" YouCompleteMe {{{

" Autoclose preview window after viewing it
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}
" Python-mode {{{
let g:pymode_python = 'python'

let g:pymode_doc = 1
let g:pymode_doc_key = 'M'
let g:pydoc = 'pydoc'

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>R'

let g:pymode_syntax = 1
let g:pymode_syntax_doctests = 0
let g:pymode_syntax_docstrings = 1

let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_slow_sync = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_virtualenv = 0
let g:pymode_rope = 0
let g:pymode_folding = 0

" }}}
" TabMan {{{
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'
" }}}
" Signify {{{
let g:signify_vcs_list = [ 'git', 'hg' ]

nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" }}}
" Window Chooser {{{
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" }}}
" Airline {{{
let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" }}}
" Fugitive Git wrapper {{{
set statusline+=%{fugitive#statusline()}
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>gp :GitPush<cr>
augroup ft_fugitive
    au!
    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
vnoremap <leader>H :Gbrowse<cr>
nnoremap <leader>H V:Gbrowse<cr>

" "(Upstream) Hub"
vnoremap <leader>u :Gbrowse @upstream<cr>
nnoremap <leader>u V:Gbrowse @upstream<cr>
" }}}
" Tslime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'
" }}}
" DelimitMate {{{
let delimitMate_excluded_ft = "clojure,lisp"
nmap <Leader>x :DelimitMateOff<cr>
" }}}
" Rainbow {{{
augroup rainbow
  autocmd!
  autocmd FileType python,lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" }}}
" Ack {{{
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" Easy motion --------------------------
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
" }}}

" }}}
" FILETYPE-SPECIFIC SETTINGS ============================================= {{{

" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR> 
    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    " }

    " Prettify a hunk of JSON with <localleader>p
    au FileType javascript nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
    au FileType javascript vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}
" HTML, Django, Jinja, Dram {{{

let g:html_indent_tags = ['p', 'li']

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *.dram setlocal filetype=htmldjango

    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-b> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll

    au Filetype markdown nnoremap <buffer> <localleader>p VV:'<,'>!python -m json.tool<cr>
    au Filetype markdown vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}
" Fish {{{

augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish

    au FileType fish setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Mail {{{

augroup ft_mail
    au!

    au Filetype mail setlocal spell
augroup END

" }}}
" Mutt {{{

augroup ft_muttrc
    au!

    au BufRead,BufNewFile *.muttrc set ft=muttrc

    au FileType muttrc setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType python RainbowParentheses
    au FileType man nnoremap <buffer> <cr> :q<cr>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" YAML {{{

augroup ft_yaml
    au!

    au FileType yaml set shiftwidth=2
augroup END

" }}}
" XML {{{

augroup ft_xml
    au!

    au FileType xml setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType xml nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType xml nnoremap <buffer> <localleader>= Vat=
augroup END

" }}}

" }}}
