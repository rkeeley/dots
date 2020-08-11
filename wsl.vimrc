"
" ~/.vimrc for WSL (TODO: tie into global one with conditionals)
"

" Vundle """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                            " required
filetype off                                " required
set rtp+=~/.vim/bundle/Vundle.vim           " Include Vundle in the runtimepath
call vundle#begin()

"
" Don't forget to install new plugins with :PluginInstall
"

Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle

" Utilities
Plugin 'ctrlpvim/ctrlp.vim'                 " fuzzy find: :CtrlP*
Plugin 'jeetsukumaran/vim-buffergator'      " easier buffer management: \b
Plugin 'majutsushi/tagbar'                  " tags in sidebar: <F8>
Plugin 'mattn/vim-sqlfmt'                   " fotmat SQL: :SQLFmt
Plugin 'scrooloose/nerdtree'                " file explorer: <F10>
Plugin 'vim-scripts/BufOnly.vim'            " close all other buffers: :BufOnly
Plugin 'wesQ3/vim-windowswap'               " easy window swapping: \ww

" Programming Support
Plugin 'gilsondev/searchtasks.vim'          " :SearchTasks [TODO,FIXME,XXX]
Plugin 'tomtom/tcomment_vim'                " :help tcomment-operator
Plugin 'Townk/vim-autoclose'                " auto-close paired chars [({/etc.
Plugin 'ycm-core/YouCompleteMe'             " code completion/etc.

" Rice
Plugin 'chriskempson/base16-vim'            " TODO: remove in WSL
Plugin 'morhetz/gruvbox'                    " TODO: fix/remove for WSL
Plugin 'vim-airline/vim-airline'            " better status/tabline
" TODO: Delete this one? ASCII airline?
Plugin 'vim-airline/vim-airline-themes'     " themes for airline
Plugin 'PProvost/vim-ps1'                   " PowerShell syntax highlighting

" Version Control
Plugin 'juneedahamed/vc.vim'                " :VCBlame/etc. for git/svn
Plugin 'tpope/vim-fugitive'                 " airline helper and :Git <command>

" Considerations (a lot of these are covered by YCM)
"Plugin 'bagrat/vim-workspace'               " tabs/etc. show up in airline
"Plugin 'ervandrew/supertab'                 " configurable tab completion
"Plugin 'godlygeek/tabular'                  " auto-indent tabbed syntax
"Plugin 'gregsexton/gitv'                    " git log --graph
"Plugin 'honza/vim-snippets'                 " snippets for code completion/etc
"Plugin 'kablamo/vim-git-log'                " git log expanded functionality
"Plugin 'neomake/neomake'                    " linting/make framework
"Plugin 'plytophogy/vim-virtualenv'          " makes vim work with virtualenv
"Plugin 'SirVer/ultisnips'                   " TODO: add this one
"Plugin 'tpope/vim-dispatch'                 " start async builds in tmux/etc.
"Plugin 'vim-syntastic/syntastic'            " inline syntax/error checking

call vundle#end()                            " required
filetype plugin indent on                    " required when -indent not set
" End Vundle """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"
" UI
"
set number                             " show line numbers
set numberwidth=4                      " width of line number column
set ruler                              " show row/column
set showbreak=+++                      " continuation line prefix
set showmatch                          " highlight matching brace
"set showtabline=2                      " always show status bar on top
set wildmenu                           " visual completion bar above cmd line
set wildmode=list:longest              " list all matches; complete longest str
syntax on                              " enable syntax highlighting if possible
colorscheme murphy                     " TODO: get better ones/gruvbox/base16

" Text file or no extension (assume notes file) -> break lines at textwidth
if &filetype ==# "text" || strlen(&filetype) == 0
    set linebreak
endif


"
" Behavior
"
set autoindent                         " auto-indent new lines
set backspace=indent,eol,start         " modern backspace behavior
set expandtab                          " tabs -> spaces
set foldmethod=syntax                  " fold based on filetype syntax
set formatoptions-=o                   " don't start line with comment with [oO]
set formatoptions+=j                   " smart join commented lines
set hidden                             " switch buffers without saving first
set hlsearch                           " highlight all search results
set ignorecase                         " always case-insensitive (until caps)
set incsearch                          " incremental search
set mouse=n                            " enable mouse only in normal mode
set scrolloff=5                        " 5 lines of context surrounding cursor
set shiftwidth=4                       " number of auto-indent spaces
set smartcase                          " case-insensitive search until capital
set smartindent                        " softcore cindent
set smarttab                           " \n/backspace shiftwidth spaces for tabs
set softtabstop=4                      " spaces per tab while editing
set t_vb=                              " no visualbell/screen flashing stuff
set textwidth=100                      " linebreak at this many characters
set undolevels=1000                    " billions of mistake-fixing u presses
set updatecount=50                     " update the .swp file every 50 chars
set visualbell                         " vim shouldn't be able to yell at me
set wildignore=*.o,*.obj,*.pyc,*~,*.swp,*.bak


"
" Environment
"
set autochdir                          " cd to the directory of the open file
set noerrorbells                       " >:(


"
" Specific filetype overrides
"
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"autocmd FileType sh set formatoptions+=o " no block comment syntax in sh
autocmd BufNewFile,BufReadPost *.sh setlocal textwidth=80


"
" Airline config
"
" display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" change how the filenames look in the airline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" set airline colorscheme (base16 will override later if enabled)
" TODO: fix base16/gruvbox
let g:airline_theme = 'solarized_flood'
"let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''


"
" CtrlP config
"
let g:ctrlp_working_path_mode = 'ra'


"
" gruvbox config
"
"let g:gruvbox_italics = 1


"
" NERDTree config
"
let g:NERDTreeWinSize             = 40
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeHighlightCursorLine = 1
let g:NERDTreeRespectWildIgnore   = 1
let g:NERDTreeWindowPos           = 'left'


"
" vc.vim config
"
let g:vc_log_name         = '/tmp/vc.vim.log'
let g:vc_max_logs         = 15  " default number of logs to pull per revision
let g:vc_max_open_files   = 10  " max # of files to open with :VCBrowse <C-o>
let g:vc_no_vc_maps       = 1   " stop remapping my + after vimrc is loaded
let g:vc_browse_cache_all = 1   " caching for repo/working copy/bookmarks


"
" YouCompleteMe config
"
let g:ycm_collect_identifiers_from_tags = 1
let g:ycm_min_num_of_chars_for_completion = 3 " sick of having to esc twice 
" TODO: Explain this somewhere else
" Need a ~/.vimrc/after/plugin/youcompleteme.vim to edit ycm vars after init
"let g:ycm_filetype_blacklist.diff = 0
set tags+=$HOME/.vimrc/tags/*


"
" Keybinds and rebinds
"
nnoremap <F8>  :TagbarToggle<CR>
nnoremap <F10> :NERDTreeToggle<CR>

" Remove search highlighting with ^L in normal mode/^L^Q in insert mode
nnoremap <C-L>       :nohls<CR>
inoremap <C-L> <C-Q> :nohls<CR>

" Window movement
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

" Window resizing
nnoremap <     <C-W><
nnoremap >     <C-W>>
nnoremap -     <C-W>-
nnoremap +     <C-W>+

nnoremap <Space> w
nnoremap <BS>    0

" 'Disable' recording mode
nnoremap q       :echo repeat('q', winwidth('%'))<CR>
nnoremap Q       :echo repeat('Q', winwidth('%'))<CR>

" 'Disable' program lookup
nnoremap K       k

" Don't remove leading indentation when inserting a '#' with smartindent set
" (Multi-line bash comments are broken without this) TODO: still true?
inoremap # X<C-H>#


"
" Shortcuts
"
command NH  :nohlsearch
command Nh  :nohlsearch

command Ntf :NERDTreeFocus
command Ntt :NERDTreeToggle

command Vb  :VCBlame
command W   :echo repeat('W', winwidth('%'))

