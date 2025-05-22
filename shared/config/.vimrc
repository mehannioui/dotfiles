call plug#begin('~/.vim/plugged')

" Syntax highlighting & better indentation
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'

" JSX and React support
Plug 'maxmellon/vim-jsx-pretty'

" Auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Powerful LSP engine

" Code formatting (Prettier)
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Fuzzy file finder (for navigation)
Plug 'junegunn/fzf.vim'

" Statusline (for a nice bottom bar)
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'

" Commenting utility
Plug 'preservim/nerdcommenter'

" File explorer
Plug 'preservim/nerdtree'

call plug#end()

syntax enable
filetype plugin indent on
set tabstop=2        " Tab width = 2 spaces
set shiftwidth=2     " Auto-indent with 2 spaces
set expandtab        " Convert tabs to spaces
set autoindent       " Copy indentation from previous line
set smartindent      " Auto-indent new lines
set number           " Show line numbers
set cursorline       " Highlight the current line

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
