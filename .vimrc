"Plugins
call plug#begin()

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/ayu-theme/ayu-vim.git'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'https://github.com/preservim/nerdtree.git'

call plug#end()

"basic settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noerrorbells
set number
set nocompatible
set nowrap
syntax on

" NERDtree settings
nmap <F2> :NERDTreeToggle<CR>
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" You Complete Me settings
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 15

" enables backspace to work as expected
set backspace =indent,eol,start

"color theming
" enable true colors support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Set true color
set termguicolors
" set color theme
let ayucolor="dark"
colorscheme ayu 

" Git branch for status bar
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':'  --- '
endfunction

" Status Bar
set laststatus =2
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Status Bar End
