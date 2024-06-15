" Set compatibility to Vim only (optional)
set nocompatible

" Automatically wrap text that extends beyond the screen length
set wrap

" Encoding
set encoding=utf-8

"Show line numbeers
set number

" Status Bar
set laststatus=2

"Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

"Start NERDTree and put the cursor back in the other window
"autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinSize=20
map <F6> : NERDTreeToggle <CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"C Setup
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
map <F8> :w <CR> :!gcc % && ./a.out <CR>
nnoremap <Leader>cc : set colorcolumn=80<cr>
nnoremap <Leader>cc : set colorcolumn-=80<cr>
set mouse=a


"Ayu-Vim"
set termguicolors
set background=dark
let g:ayucolor="dark"
colorscheme ayu

"Lightline Config"
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

"COC-NVIM"
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
