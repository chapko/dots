" Dein (plugin manager) {{{
" ==========================================================

let deinroot = expand('$HOME/.local/share/dein')
let deinrepo = deinroot . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(deinroot)
  call dein#begin(deinroot)
  call dein#add(deinrepo)

  " Essential
  call dein#add('Shougo/denite.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('neomake/neomake')
  call dein#add('editorconfig/editorconfig-vim')

  " Autocompletion
  call dein#add('vim-scripts/SyntaxComplete')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('carlitux/deoplete-ternjs', { 'on_ft': 'javascript' })
  call dein#add('Shougo/neco-vim', { 'on_ft': 'vim' })
  call dein#add('zchee/deoplete-go', {'build': 'make', 'on_ft': 'go' })
  call dein#add('Shougo/echodoc')

  " Editing plugins
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-abolish')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('Raimondi/delimitMate')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('chrisbra/NrrwRgn')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " UI
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ap/vim-css-color')
  call dein#add('icymind/NeoSolarized')

  " Lang specific
  call dein#add('pangloss/vim-javascript', { 'on_ft': 'javascript' })
  call dein#add('moll/vim-node', { 'on_ft': 'javascript' })
  call dein#add('elzr/vim-json', { 'on_ft': 'json' })
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })
  call dein#add('zchee/nvim-go', {'build': 'make'})
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-lua-ftplugin')
  call dein#add('leafgarland/typescript-vim')

  "call dein#add('')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"}}}

" Neovim config {{{
" ==========================================================

" Options {{{
" --------------------------------------

" change <leader> to comma
let mapleader=','
" enable fancy cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

set tabstop=4           " tab width
set shiftwidth=0        " indent width for >>, <<, etc. (0=tabstop)
set softtabstop=-1      " soft tab width (negative=shiftwidth)
set expandtab           " use spaces for indenting
set autoindent          " copy indent from current line when starting a new line
set smartindent         " make indent smarter
set copyindent          " copy the previous indentation on auto-indenting

set nowrap              " do not wrap long lines
set sidescroll=1        " scroll long lines by 1 char
set sidescrolloff=10    " horizontal scroll context
set scrolloff=2         " vertical scroll context
set virtualedit=block   " cursor can be positioned anywhere in V-Block mode

set number              " show line number
set nocursorline        " don't highlight cursor line
set nocursorcolumn      " don't highlight cursor column
set relativenumber      " use relative line numbers (relative to the current)

set hlsearch            " highlight all search matches
set incsearch           " show found patters during typing
set ignorecase          " ignore case when searching
set smartcase           " ignore case if pattern is all lowercase
set wrapscan            " searching wraps around the end of the file

set history=50          " keep 50 lines of command line history
set synmaxcol=200       " maximum column in which to search for syntax items
set colorcolumn=80      " line at column 80
set textwidth=80        " for line wrapping with `gq`

set foldcolumn=0        " display gutter line with folding areas
set foldmethod=indent   " automatically fold by indent level
set foldlevelstart=99   " make all folds open by default

set modeline            " support modeline comments (like vim: tw=8 noet:)
set autoread            " reload file after it has been changed outside

set list                " show whitespaces
set listchars=eol:↙,tab:╶─,trail:·,extends:…,precedes:…,nbsp:•
set breakindent         " wrapped lines are indented
set showbreak=…\        " display '… ' at the beginning of wrapped lines
set breakindentopt=min:20,shift:0,sbr
set fillchars=fold:\    " use ' ' for fold lines instead of more intrusive '-'

" do not insert 2 spaces after '.', '?', and '!' with a join command
set nojoinspaces
set spell               " spell checking

set laststatus=2        " always display status line

set keywordprg=":help"  " K invokes this command for the word under cursor

" use "+ register by default
set clipboard^=unnamedplus

set noshowcmd
set noshowmode

" format options
" t - auto-wrap text
" c - auto-wrap comments
" r - insert comment leader on <Enter>
" o - insert comment leader on 'o' or 'O'
" q - comments formatting with 'gq'
" a - auto-format paragraphs (disabled)
" n - recognize number lists
" l - don't break already long lines in insert mode
" 1 - don't break line after one-letter word
" j - smart comments joining
set formatoptions=tcroqnl1j

set wildchar=<Tab>
set wildmenu
set wildmode=full
set wildignore=""
set wildignorecase

" color scheme

" URxvt works better without termguicolors enabled
if $TERM !~# "rxvt-unicode"
  set termguicolors " use 24-bit colors
endif
set background=light
let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_visibility = 'low'
colorscheme NeoSolarized
"}}}

" Functions {{{
" --------------------------------------

function! ToggleWhiteSpaceIgnore()
  if &diffopt =~ 'iwhite'
    set diffopt-=iwhite
  else
    set diffopt+=iwhite
  endif
endfunction
"}}}

" Commands {{{
" --------------------------------------

command! W :w
command! Vimrc :e ~/.config/nvim/init.vim
command! DeinUpdate :call dein#update()
"}}}

" Mappings {{{
" --------------------------------------

cmap w!! w !sudo tee > /dev/null %

nnoremap ; :
" ; and , - next and prev character for f and t
nnoremap <Space> ;
nnoremap <C-Space> ,

imap jj <esc>
cmap jj <esc>

" Turn off highlight search
nmap <silent> <leader>n :nohls<CR>

" shortcut for "very magic" patterns
nnoremap <A-/> /\v

" more natural navigation on wrapped lines
nnoremap j gj
nnoremap k gk

" window resize
noremap <silent> <C-F9>  :vertical resize -3<CR>
noremap <silent> <C-F10> :resize +3<CR>
noremap <silent> <C-F11> :resize -3<CR>
noremap <silent> <C-F12> :vertical resize +3<CR>
noremap <silent> <C-S-F9>  :vertical resize -1<CR>
noremap <silent> <C-S-F10> :resize +1<CR>
noremap <silent> <C-S-F11> :resize -1<CR>
noremap <silent> <C-S-F12> :vertical resize +1<CR>

" toggle wrapping
nmap <silent> <leader>w :setlocal wrap!<CR>

" add ; or , at the end of the line
nmap <silent> <leader>; msA;<esc>`s:delmarks s<CR>
nnoremap <silent> <leader>, msA,<esc>`s:delmarks s<CR>

" buffer commands
nmap <silent> <leader>bd :bdelete<CR>

" 'le' is short for location expand (lo with comma leader is not easy)
nmap <silent> <leader>le :lopen<CR>
nmap <silent> <leader>lc :lclose<CR>

nmap <silent> <leader>pc :pclose<CR>

" jump to the first non-blank character of the line
nmap 0 ^

" copy file info to clipboard:
" <leader>yf - relative filepath and linenumber
" <leader>yp - full filepath
" <leader>yn - file name only
nmap <silent> <leader>yf :let @+ = expand("%") . ":" . line(".")<CR>
nmap <silent> <leader>yp :let @+ = expand("%:p")<CR>
nmap <silent> <leader>yn :let @+ = expand("%:t")<CR>
nmap <silent> <leader>i :call ToggleWhiteSpaceIgnore()<CR>
nmap <leader>dt :diffthis<CR>
nmap <leader>do :diffoff<CR>
"}}}

"}}}

" Plugins config {{{
" ==========================================================

" Denite {{{
" --------------------------------------
nmap <C-p> :Denite file_rec<CR>
nmap <C-b> :Denite buffer<CR>
nmap <C-S-f> :Denite grep<CR>
nmap <C-A-f> :Denite grep<CR>

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
"       \ '*~', '*.o', '*.exe', '*.bak',
"       \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
"       \ '.hg/', '.git/', '.bzr/', '.svn/',
"       \ 'tags', 'tags-*',
"       \  ])

" call denite#custom#source(
"       \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])

call denite#custom#map('insert',
      \ '<C-j>', '<denite:move_to_next_line>',
      \ 'noremap')

call denite#custom#map('insert',
      \ '<C-k>', '<denite:move_to_previous_line>',
      \ 'noremap')

call denite#custom#map('insert',
      \ '<C-s>', '<denite:do_action:vsplit>',
      \ 'noremap')

call denite#custom#map('insert',
      \ '<C-i>', '<denite:do_action:split>',
      \ 'noremap')


"}}}

" NERD Tree {{{
" --------------------------------------
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1

" Toggle the NERD Tree on and off
nmap <silent> <leader>t :NERDTreeToggle<CR>
" Reveal current file in the nerd tree panel
map <silent> <leader>r :NERDTreeFind<CR>


"}}}

" fugitive {{{
" --------------------------------------
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
" }}}

" Neomake {{{
" --------------------------------------
" Open location list on update. 2 preserves cursor position
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

function! HideFileName()
  setlocal conceallevel=2 concealcursor=nc
  syntax match qfFileName /^[^|]*|/ transparent conceal
  syntax match qfFileName /^|| / transparent conceal
endfunction

augroup neomake_setup
    autocmd!
    autocmd BufRead * Neomake
    autocmd BufWritePost * Neomake
    autocmd FileType qf call HideFileName()
augroup END

" }}}

" Deoplete {{{
" --------------------------------------
call deoplete#enable()
call echodoc#enable()

set splitbelow
function! OnPreviewEnter()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction
autocmd WinEnter * call OnPreviewEnter()
" }}}

" deoplete go {{{
" --------------------------------------
let g:deoplete#sources#go#gocode_binary = expand("$GOPATH") . "/bin/gocode"
let g:deoplete#sources#go#sort_class = [
            \ 'package', 'func', 'type', 'var', 'const', ]

" }}}


" neocomplete {{{
" --------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" }}}

" NERD Commenter {{{
" --------------------------------------
let g:NERDSpaceDelims = 1
" }}}

" delimitMate {{{
" --------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" }}}

" trailing whitespace {{{
" --------------------------------------
nmap <silent> <leader>fw :FixWhitespace<CR>
" }}}

" indentLine {{{
" --------------------------------------
let g:indentLine_setColors = 1
let g:indentLine_char = ''
" }}}

" airline {{{
" --------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
" }}}

" lua {{{
" --------------------------------------
let g:vimrc_lua_configured = 1
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
"let g:deoplete#omni#functions.lua = 'xolox#lua#completefunc'
" }}}

" json {{{
" --------------------------------------
let g:vim_json_syntax_conceal = 0
" }}}

" javascript {{{
" --------------------------------------
let g:javascript_plugin_jsdoc = 1
" }}}

" Final settings {{{
set exrc   " read .nvimrc and .exrc in the current directory
set secure " make exrc secure
" }}}

" vim: foldmethod=marker foldlevel=1 ts=2 sw=2

