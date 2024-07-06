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
"Remap hjkl to ALT+wasd"
noremap <Esc>a h
noremap <Esc>s j
noremap <Esc>w k
noremap <Esc>d l
"To work in insert mode"
inoremap <esc>a <left>
inoremap <esc>d <right>
inoremap <esc>w <up>
inoremap <esc>s <down>
"C Setup"
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
"map <F8> :w <CR> :!gcc % && ./a.out <CR>
"Map f8 to compile depending on the file type"
map <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!java %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

nnoremap <Leader>cc : set colorcolumn=80<cr>
nnoremap <Leader>cc : set colorcolumn-=80<cr>
set mouse=a


"Ayu-Vim"
set termguicolors
"set background=dark
"let g:ayucolor="dark"
"colorscheme ayu

"Eldar Colorscheme"
"------------------------
" Syntax: highlighting
"------------------------
if has('syntax')
    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif

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

"Tpope Commentary"
filetype plugin indent on

"Preservim Tagbar"
nmap <F9> :TagbarToggle<CR>
" set g:tagbar_ctags_bin.
