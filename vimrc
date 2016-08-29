" General config
set nocompatible " make vim usable
set noerrorbells " no error bells
set encoding=utf-8 " standard encoding utf-8
set shortmess=atI " don't show splash screen
set mouse=a " allow mouse in all mode

" UI config (Colors)
let g:solarized_termcolors=256 " or it looks like crap
let g:solarized_contrast="high" " statusbar looks better
colorscheme solarized " load solarized scheme. Must be before set bg=dark
set bg=dark " dark theme  

" UI config (Layout)
set number " line numbers
set cursorline " underline current line
set title " set terminal title
set laststatus=2 " show status line
set statusline= " Statusline anpasen
set statusline+=\[%n] "buffernr
set statusline+=\ %<%F\ "File+path
set statusline+=\ %y\ "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''} "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\ "Encoding2
set statusline+=\ %{&ff}\ "FileFormat (dos/unix..) 
set statusline+=\ %=\ row:%l/%L\ "Rownumber/total (%)
set statusline+=\ col:%03c\ "Colnr
set statusline+=\ \ %m%r%w\ %P\ \ "Modified? Readonly? Top/bot.

" UI config (cmd line behavior)
set wildmenu " autocomplete inside command menu
set showmatch " show matching parenthesis
set showmode " show current mode
set showcmd " show partial info in last line
set history=1000 " save the last 1000 commands

" UI config (Editor behavior)
set splitright " open split right to the current split
set splitbelow " open split under the the current split
set autoindent
filetype plugin indent on
syntax on

" Tab Config
set softtabstop=0
set tabstop=3
set shiftwidth=3

" Search
set ignorecase " Ignore case when searching
set smartcase " Ignore case unless captial case letters are typed
set hlsearch " Highlight match
set incsearch " Search as you type

" Backup
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/

" Key Rebinds
nmap <silent> <F3> :NERDTreeToggle<CR>
" nohlsearch
" mapleader vergeben , evtl

set spelllang=de,en

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
