
set nu                      " line numbering
set sw=4                    " default shift width to 4 spaces
set ts=4                    " default tab stop to 4 spaces
set hls                     " highlight the search
syn on                      " syntax highlighting on
set showmatch               " show the matches searched for
set ai                      " auto indent
set smartindent             " smart indent
set expandtab               " expand tabs into spaces
set nowrap                  " don't wrap lines
set vb                      " flash screen instead of sounding a beep
set incsearch               " search as you type
set matchpairs+=<:>         " match greater than less than
set diffopt+=iwhite         " ignore whitespace in diffs
set exrc                    " enable per-directory .vimrc files
set secure                  " disable unsafe commands in local .vimrc files


set spell                   " spell checking on
set scrolloff=8             " minimum lines to keep above and below cursor
set mouse=a                 " automatically enable mouse usage

"set cursorline             " highlight current line




" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on


" show me all white spaces at the end of lines
set list listchars=trail:.,extends:>,tab:>-
" display > for the first character occupied by a tab, and - for any subsequent characters that the tab may occupy


" weird centering behavior as you move up and down the screen
"map j jzz
"map k kzz
"map n nzz
"map N Nzz

" match greater_than and less_than signs to each other, for Perl & PHP
autocmd BufRead *.pl inoremap # X<c-h>#
autocmd BufRead *.pm inoremap # X<c-h>#
autocmd BufRead *.php inoremap # X<c-h>#

" make .pstpl files syntax highlight like HTML files
au BufNewFile,BufRead *.pstpl set filetype=html

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" Display the current Git branch in the status
" set laststatus=2
" set statusline=%{GitBranch()}

set guifont=Courier\ New\ 9

" ********************************************************
" set the size of the GUI when using gvim
if has("gui_running")
    if has("windows")
        set lines=50 columns=150
    endif
    winpos 30 20
    " set cursorline
endif

" ********************************************************
" set the color scheme
"if ! has("gui_running")
"    set t_Co=256
"endif
" feel free to choose :set background=light for a different style
"set background=dark
"colors peaksea
colors darkZ

" ********************************************************
" Mark
function! Mark(...)
    if a:0 == 0
        let mark = line(".") . "G" . virtcol(".") . "|"
        normal! H
        let mark = "normal!" . line(".") . "Gzt" . mark
        execute mark
        return mark
    elseif a:0 == 1
        return "normal!" . a:1 . "G1|"
    else
        return "normal!" . a:1 . "G" . a:2 . "|"
    endif
endfunction


" ********************************************************
" A function to switch line numbers back and forth
function! SwitchWRAP ()
    set wrap!
endfunction

" map the <F3> key call my function above
map <F3> :call SwitchWRAP()<CR>


" ********************************************************
" switch the Ignore case
function! SwitchIC()
    set ic!
endfunction
" map the <F4> key call my function above
map <F4> :call SwitchIC()<CR>


" ********************************************************
" Removes trailing spaces
function! TrimWhiteSpace()
    let currPos=Mark()
    %s/\s*$//
    ''
    exe currPos
:endfunction

" clear out trailing whitespace file saves
"autocmd FileWritePre * :call TrimWhiteSpace()
"autocmd FileAppendPre * :call TrimWhiteSpace()
"autocmd FilterWritePre * :call TrimWhiteSpace()
"autocmd BufWritePre * :call TrimWhiteSpace()

" call the trim when pressing F5
map <F5> :call TrimWhiteSpace()<CR>
map! <F5> :call TrimWhiteSpace()<CR>


" ********************************************************
" fix the brackets
function! FixBrackets ()
    let currPos=Mark()
    silent! %s/) {/) {/g
    silent! %s/} else/} else/g
    silent! %s/else {/else {/g
    silent! %s/\(if\|while\|for\|foreach\)(/\1 (/g
    exe currPos
:endfunction

" map the <F6> key call my function above
map <F6> :call FixBrackets()<CR>


" ********************************************************

