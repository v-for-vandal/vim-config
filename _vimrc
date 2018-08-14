scriptencoding utf-8
set encoding=utf-8
let skip_loading_mswin = 1
set nocompatible
set sw=4 ts=4 noexpandtab
syn on
filetype plugin indent on
"set tags+="C:\Documents and Settings\aserebriyskiy\My Documents\Fine Objects 11.0.41.0\FineObjects"
set bs=2
set listchars=tab:>-,trail:
set list
set textwidth=120
set cc=+1
set laststatus=2
set history=1000

"cindent options
set cino=g0,(1s

"Pathogen
execute pathogen#infect()

"Fuzzy finder
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

"Esc character
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

"LanguageClient
set runtimepath+=~/.vim-ext-plugins/LanguageClient-neovim

set hidden

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/aserebriyskiy/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F12> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" Support for per-project files

set exrc
set secure
