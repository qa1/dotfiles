" Settings {{{
syntax on

" UFT-8 Encoding
scriptencoding utf-8
set encoding=utf-8

" Stick unamed register into system clipboard
if $TMUX == ''
    set clipboard+=unnamed
endif

" Correct delete key in OSX
set backspace=eol,start,indent

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
set smarttab
set number
set ffs=unix,dos,unix

" Use vim, not vi api
set nocompatible

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" Setup cursor shape
set guicursor=

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Set leader key
let mapleader = '-'

" Always show cursor
set ruler

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" Ignore case in search
set smartcase

" Autoload files that have changed outside of vim
set autoread

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Mod line supporting
set modeline
set modelines=5

" Set folding type in marker
set foldmethod=marker

" Set search results highlighting
set hlsearch

" Map <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Let's move between tabs and create them !
nmap <C-w>n :tabnext<CR>
nmap <C-w>p :tabprevious<CR>
nmap <C-w>c :tabnew<CR>
let n = 1
while n < 10
	execute "map <C-w>" . n . " " . n . "gt"
	let n += 1
endwhile

" }}}

" FileType Configurations {{{

" PHP
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab

" C++
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab

" Ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

" Json
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab

" Docker-compose
autocmd Filetype docker-compose setlocal ts=2 sts=2 sw=2 expandtab

" Vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.javascript
autocmd Filetype vue.javascript setlocal ts=2 sts=2 sw=2 expandtab

" Babel configuration
autocmd BufRead,BufNewFile .babelrc setlocal filetype=json

" HTML
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab

" JavaScript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

" Git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

" Cursor
autocmd VimLeave * set guicursor=a:ver30

" }}}

" Commands {{{

" Command Mappings
command Spellcheck setlocal spell spelllang=en_us

" }}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" Static plugins all from the github :)
Plug 'junegunn/vim-easy-align'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'vim-scripts/textutil.vim'
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-jade'
Plug 'wakatime/vim-wakatime'
Plug '1995parham/vim-zimpl'
Plug '1995parham/vim-gas'
Plug '1995parham/vim-tcpdump'
Plug '1995parham/tomorrow-night-vim'
Plug '1995parham/vim-spice'
Plug 'aolab/vim-avro'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dag/vim2hs'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'bps/vim-tshark'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'othree/html5.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ap/vim-css-color'
Plug 'mattn/webapi-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'wellle/targets.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-tbone'
Plug 'gcmt/wildfire.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-python/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'cohama/agit.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'garyburd/go-explorer'
Plug 'posva/vim-vue'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'sekel/vim-vue-syntastic'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'elzr/vim-json'
Plug 'kylef/apiblueprint.vim'

" Plugin options
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug '1995parham/vim-header', { 'do': ':UpdateRemotePlugins' }

" Add plugins to &runtimepath
call plug#end()

"}}}

" Plugins Configurations {{{

" Wakatime
let g:wakatime_PythonBinary = 'python3'
let g:wakatime_ScreenRedraw = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-u>"

" Tomorrow-Night
set background=light
if (has("termguicolors"))
	set termguicolors
endif

colorscheme Tomorrow-Night

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
highlight clear SignColumn

" Super tab
let g:SuperTabMappingForward = "<C-h>"

" Emmmet
" only enable normal mode functions.
let g:user_emmet_mode='n'
let g:user_emmet_leader_key='<C-E>'

" vim-header
let g:header_name = 'Parham Alvani'
let g:header_email = 'parham.alvani@gmail.com'

" vim-polygot
let g:polyglot_disabled = ['python', 'javascript']

" Syntastic
if has('python3')
	let g:syntastic_python_python_exec = system('which python3')
elseif has('python')
	let g:syntastic_python_python_exec = system('which python')
endif

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_go_checkers = ['gofmt', 'go', 'golint']

let g:syntastic_c_compiler_options = ' -std=gnu11'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1

" Tagbar
nmap <F5> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


" NerdTree
map <C-n> <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 2
let g:nerdtree_tabs_synchronize_view = 0

" Airline (status line)
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tagbar#enabled = 1

let g:airline_powerline_fonts = 1

let g:airline_theme = 'tomorrow'

let g:airline_section_c = '%{strftime("%c")}'

" vim-buffergator
map <C-b> :BuffergatorToggle<CR>

" vimtex
let g:vimtex_disable_version_warning = 1

" C
let c_gnu = 1

" CPP
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" Python
let g:python_highlight_all = 1

" javascript
let g:javascript_plugin_jsdoc = 1

" Octave
augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype octave
				\	if &omnifunc == "" |
				\	setlocal omnifunc=syntaxcomplete#Complete |
				\	endif

endif

" PHP
function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

"}}}