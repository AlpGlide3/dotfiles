call plug#begin('~/.local/share/nvim/plugged')
" need nvim nightly for this
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'scheme' }
Plug 'arcticicestudio/nord-vim'
" use a slightly edited version of forest-night: more contrast
Plug 'sainnhe/forest-night'
call plug#end()

" colorscheme forest-night
colorscheme nord

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
set rnu
set laststatus=1
set listchars=tab:\ \ \|,trail:~,extends:>,precedes:<
set list

" mappings and stuff
" buffer navigation
nnoremap gb :ls<CR>:b<space>
" search and replace, does boilerplate for you
nnoremap <leader>r :%s//g<left><left>
" split line
nnoremap <leader>o a<CR><esc>k$
" yank till eol
map Y y$
" remote yank: from wellle
nnoremap <silent> gy :<C-U>call MarkAndSetOpfunc()<CR>g@
vnoremap <silent> gy :<C-U>call MarkYankAndJump()<CR>
" source init.vim
nnoremap <silent> <leader>i :source ~/.config/nvim/init.vim

" vim-sneak thing
let g:sneak#label = 1

" goyo and limelight
nnoremap <silent> <leader>g :Goyo<CR>
let g:goyo_width = 100
let g:goyo_height = 100
nnoremap <silent> <leader>l :Limelight!!<CR>
let g:limelight_conceal_ctermfg = 'gray'

" highlight stuff that was just yanked: from somewhere in r/nvim
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END

function! MarkAndSetOpfunc()
	let g:save_cursor = getpos(".")
	set opfunc=YankAndJumpBack
endfunction

function! MarkYankAndJump()
	let g:save_cursor = getpos(".")
	call YankAndJumpBack(visualmode(), 1)
endfunction

function! YankAndJumpBack(type, ...)
	if a:0
		silent exe "normal! `<" . a:type . "`>y"
	elseif a:type == 'line'
		silent exe "normal! '[V']y"
	elseif a:type == 'block'
		silent exe "normal! `[\<C-V>`]y"
	else
		silent exe "normal! `[v`]y"
	endif
	call setpos('.', g:save_cursor)
endfunction

" presence.nvim stuff
let g:presence_auto_update       = 1
let g:presence_editing_text      = "Editing %s"
let g:presence_workspace_text    = "Working on %s"
let g:presence_neovim_image_text = "The One True Text Editor"
let g:presence_main_image        = "neovim"
