scriptencoding utf-8
set encoding=utf-8
let skip_loading_mswin = 1
set nocompatible
set sw=2 ts=2 expandtab
syn on
filetype plugin indent on
set bs=2
set listchars=tab:>-,trail:^
set list
set textwidth=80
set cc=+1
set laststatus=2
set history=1000

"cindent options
set cino=g0,(1s

set rtp+=~/.fzf

" == Pathogen ==
"execute pathogen#infect()

" == Vim Plug
" " Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" == Plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Highlight-UnMatched-Brackets'

" Initialize plugin system
call plug#end()

" == Setting fzf ==
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nmap ,b :Buffers<CR>
nmap ,f :Files<CR>

" == Fuzzy finder
"nmap ,f :FufFileWithCurrentBufferDir<CR>
"nmap ,b :FufBuffer<CR>
"nmap ,t :FufTaggedFile<CR>

" == Esc character
inoremap ;; <ESC>
inoremap <C-;> <ESC>
map h <Left>
map j <Up>
map k <Down>
map l <Right>
map <C-K> <C-D>
map <C-J> <C-U>

"No bell
set vb t_vb=

"Color scheme
set background=light
let g:solarized_italic=0
colorscheme solarized
highlight ColorColumn guibg=#e86b79

set signcolumn=yes
set hidden

" == LanguageClient

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['nice', '-n', '19', 'cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['nice', '-n', '20', 'cquery', '--log-file=/tmp/cq.log'],
    \ 'python': ['pyls', ],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/aserebriyskiy/.config/nvim/settings.json'
"set completefunc=LanguageClient#complete
"set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F12> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" Support for per-project files

set exrc
set secure

" Misc

" Doxygen-style comments
autocmd Filetype c,cpp set comments^=:///
