set nocompatible
filetype off "Required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"use <Tab> for all your insert completion needs
"Plugin 'SuperTab'
"
"Syntastic is a syntax checking plugin for Vim
Plugin 'vim-syntastic/syntastic'

"Plugin 'scrooloose/syntastic'
"Plugin 'leafgarland/typescript-vim'
"
"A Vim plugin which shows a git diff in the sign column.
Plugin 'airblade/vim-gitgutter'
"for vcs
"Plugin 'mhinz/vim-signify'

Plugin 'vim-airline/vim-airline'
"Pasting in Vim with indentation adjusted to destination context.
Plugin 'sickill/vim-pasta'
"Comment
Plugin 'preservim/nerdcommenter'
"This plug-in provides automatic closing of quotes, parenthesis, brackets
Plugin 'Raimondi/delimitMate'

Plugin 'SirVer/ultisnips'

"color scheme nova
"Plugin 'trevordmiller/nova-vim'
"
"support for prolog
"Plugin 'adimit/prolog.vim'

"For git
Plugin 'tpope/vim-fugitive'
"l9 is a Vim-script library
Plugin 'L9'
"Plugin 'eparreno/vim-l9'
" Go language support for Vim
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'sjl/badwolf'
Plugin 'rking/ag.vim'
"Plugin 'morhetz/gruvbox'


call vundle#end()
filetype plugin indent on
let mapleader=","

set hlsearch
set ignorecase
set smartcase
set enc=utf-8
set fileencoding=utf-8
set laststatus=2
let g:syntastic_cpp_compiler_options='-std=c++14 -Weffc++ -fopenmp'

set colorcolumn=80
set cursorcolumn
set cursorline
set number
set relativenumber
syntax on
set background=dark
let g:solarized_termcolors=256
"colorscheme gruvbox
colorscheme badwolf
set expandtab
set smartindent
set softtabstop=4
set shiftwidth=4
set mouse=a
set backspace=indent,eol,start
map <F7> :NERDTreeToggle<CR>
map <C-p> :CtrlP ./<CR>
"map <F7> :tabp<CR>
"map <F8> :tabn<CR>
cmap w!! w !sudo tee % > /dev/null
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Show hidden files
let NERDTreeShowHidden=1 
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"b:NERDTree.isTabTree()) | q | endif

"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg=' .
"  a:bg .' ctermfg=' . a:fg . ' guibg=' . a:guibg .' guifg=' . a:guifg
"    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.
"    a:extension . '$#'
"endfunction
"
"
"Config for vim-go

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
     call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au filetype go inoremap <buffer> . .<C-x><C-o>
"Completion menu first item gets auto filled
"This behavior is not up to vim-go. Vim-go only supplies the matches to Vim. 
"The behavior you're seeing is controlled by completeopt option. See :help 'completeopt'.
set cot+=longest
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:go_list_type = "quickfix"

"TagBar
let g:tagbar_width=30
nmap <F8> :TagbarToggle<CR>
"gotags
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

let g:vundle_default_git_proto = 'git'
let g:asyncrun_open = 8
