"vundle:
set nocompatible              " be iMproved, required
filetype off                  " required

" NeoBundle 
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end
"set runtimepath+=/Users/nathan/.vim/bundle/neobundle.vim/

call neobundle#begin()

NeoBundleFetch 'Shougo/neobundle.vim'


"Add bundles here:
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vimwiki/vimwiki', { 'rev' : 'dev' }
NeoBundle 'mattn/calendar-vim'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'

NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-git'
NeoBundle 'ervandew/supertab'
NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'godlygeek/tabular'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'ap/vim-css-color'
NeoBundle 'rizzatti/dash.vim'
"NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'lukaszkorecki/workflowish'
NeoBundle 'klen/python-mode'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'tbabej/taskwiki'
"NeoBundle 'farseer90718/vim-taskwarrior'
NeoBundle 'powerman/vim-plugin-AnsiEsc'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'Yggdroot/indentLine'

call neobundle#end()
NeoBundleCheck

filetype plugin indent on    " required

"rest of vimrc:
syntax on

"essentials:

let mapleader = "\<Space>" 

call arpeggio#map('i', '', 0, 'jk', '<Esc>')
let g:arpeggio_timeoutlens = {'j':400, 'k':200}

noremap : q:i
noremap / q/i

"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set number

set viminfo='1000,f1

map Y y$

set colorcolumn=81

" easy motion

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" navigation

"cursor for iterm2:
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif 

noremap <silent> cp :let @+="\"" . expand("%:p") . "\""<CR>

colorscheme jellybeans
"colorscheme molokai

"snippets
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:vimwiki_table_mappings = 0
"let g:vimwiki_list = [{'syntax': 'markdown'}]

" autocmd BufNewFile,BufRead *.wiki set tw=80 
" autocmd BufNewFile,BufRead *.wiki set linebreak

au BufRead * normal zR

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 

hi VimwikiBold ctermfg=203
hi VimwikiItalic ctermfg=75

nnoremap <leader>k :<C-U>call append(line(".") -1, repeat([''], v:count1))<CR>
nnoremap <leader>j :<C-U>call append(line("."), repeat([''], v:count1))<CR>
let g:ctrlp_map = '<leader>f'
nmap <silent> <leader>b :CtrlPBuffer<CR>
nmap <silent> <leader>r :CtrlPMRU<CR>
map <leader>mbe : MBEToggle<CR>
nmap <leader>s <Plug>(easymotion-s2)
vmap <leader>s <Plug>(easymotion-s2)
nmap <leader>sp :setlocal spell! spelllang=en_us<CR>
nmap <silent> <leader>y :SyntasticCheck<CR>
nmap <silent> <leader>u :SyntasticReset<CR>
nmap <leader>g :TagbarToggle<CR>
nnoremap <leader>a za
noremap <Leader>n :bnext<CR>
noremap <Leader>p :bprevious<CR>
noremap <Leader>v :vsplit<CR>
nnoremap <leader>cd :lcd %:p:h<CR>
noremap <Leader>wn :VimwikiDiaryNextDay<CR>
noremap <Leader>wp :VimwikiDiaryPrevDay<CR>
nnoremap <leader>g gql$
map <leader>l : IndentLinesToggle<CR>
nmap <silent> <leader>d <Plug>DashSearch
"map <leader>q :bd<cr>

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:rainbow_active = 1 
let g:indentLine_enabled = 0

set nowrap

set textwidth=0

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>o :<C-U>RangerChooser<CR>

" let g:neocomplete#enable_at_startup = 1

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

" if !exists('g:neocomplete#force_omni_input_patterns')
        " let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" let g:jedi#auto_initialization = 0

" XML formatter
function! DoFormatXML() range
	" Save the file type
	let l:origft = &ft

	" Clean the file type
	set ft=

	" Add fake initial tag (so we can process multiple top-level elements)
	exe ":let l:beforeFirstLine=" . a:firstline . "-1"
	if l:beforeFirstLine < 0
		let l:beforeFirstLine=0
	endif
	exe a:lastline . "put ='</PrettyXML>'"
	exe l:beforeFirstLine . "put ='<PrettyXML>'"
	exe ":let l:newLastLine=" . a:lastline . "+2"
	if l:newLastLine > line('$')
		let l:newLastLine=line('$')
	endif

	" Remove XML header
	exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

	" Recalculate last line of the edited code
	let l:newLastLine=search('</PrettyXML>')

	" Execute external formatter
	exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

	" Recalculate first and last lines of the edited code
	let l:newFirstLine=search('<PrettyXML>')
	let l:newLastLine=search('</PrettyXML>')
	
	" Get inner range
	let l:innerFirstLine=l:newFirstLine+1
	let l:innerLastLine=l:newLastLine-1

	" Remove extra unnecessary indentation
	exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

	" Remove fake tag
	exe l:newLastLine . "d"
	exe l:newFirstLine . "d"

	" Put the cursor at the first line of the edited code
	exe ":" . l:newFirstLine

	" Restore the file type
	exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>
" rainbow colors
let g:rainbow_conf = {
\   'ctermfgs': ['red', 'darkblue', 'darkgreen', 'darkcyan', 'darkmagenta', 'yellow', 'blue', 'green', 'cyan', 'magenta', 'gray', 'darkgray'],
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.csv,*.pickle,*.xlsx,*xls,*.docx,*.doc,*.pyc,*.png,*.jgp,

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.*egg-info$'

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    tnoremap <Space>:h <C-\><C-n> :split<CR>
    autocmd BufWinEnter,WinEnter term://* startinsert
    "autocmd BufLeave term://* stopinsert
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

end

let g:vimwiki_folding='syntax'

"set foldmethod=syntax
autocmd BufWinLeave *.wiki mkview
autocmd BufWinEnter *.wiki silent loadview 

"let g:user_emmet_install_global = 0
"autocmd FileType html,css, js EmmetInstall

let g:pymode_breakpoint = 0
let g:pymode_run = 0
let g:pymode_rope = 0

"let g:tagbar_type_vimwiki = {
          "\   'ctagstype':'vimwiki'
          "\ , 'kinds':['h:header']
          "\ , 'sro':'&&&'
          "\ , 'kind2scope':{'h':'header'}
          "\ , 'sort':0
          "\ , 'ctagsbin':'/Users/nathan/dotfiles/vwtags.py'
          "\ , 'ctagsargs': 'default'
          "\ }
let g:tagbar_type_vimwiki = {
            \ 'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'scope2kind':{'header':'h'}
            \ , 'sort':0
            \ , 'ctagsbin':'python2.7'
            \ , 'ctagsargs': '~/dotfiles/vwtags.py default'
            \ }
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['javascript'],
    \ 'passive_filetypes': ['python']}

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']

let g:ultisnips_python_style = 'jedi'
let g:dash_activate=0
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\'

map "* "+
