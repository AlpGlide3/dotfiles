call plug#begin('~/.local/share/nvim/plugged')
Plug 'unblevable/quick-scope'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" set stuff
set hidden
set incsearch
set nohlsearch
set undofile
set undodir
set undolevels=512
set nowrap
set autoindent
set number
set relativenumber
set listchars=tab:\ \ >,trail:~,extends:>,precedes:<
set list

" mappings and stuff
" search and replace, does boilerplate for you
nnoremap <leader>r :%s//g<left><left>
" yank till eol
map Y y$

" number is always on, but rnu is removed when in insert mode or focus lost
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" highlight stuff that was just yanked
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
