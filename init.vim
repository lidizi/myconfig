 set  nu 
 "| 当文件被其他编辑器修改时，自动加载 |
set autowrite
set autoread ""设置按照syntax高亮进行折叠 
set relativenumber 
set foldmethod=syntax 
set nofoldenable 
set modifiable 
set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set noexpandtab 
set cursorline 
set so=10 
syntax on
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white




"highlight Normal ctermfg=black ctermbg=yellow--------------------fzf 搜索---------------------
"
"

"------------------------------------------fzf---------------------------------------------


"let g:fzf_preview_window = ['right:50%', 'ctrl-/']

"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']




let g:fzf_preview_window = []
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"command! -bang -nargs=? -complete=dir Files \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

"command! -bang -nargs=? -complete=dir Files \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


"command! -bang -nargs=? -complete=dir Files \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat {}']}, <bang>0)


command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
"------------------------------------------fzf---------------------------------------------





"" 重新映射 leader 键
let g:mapleader = '\'
"nnoremap  <Leader>ff :Files<CR>
nnoremap  <Leader>ll :Lines<CR>
"nnoremap  <Leader>e :Buffers<CR>
nnoremap <Leader>ss :RG <CR>

nnoremap <Leader>cc :Commands <CR>
nnoremap <Leader>hh :History <CR>
nnoremap <silent><leader>d :Defx<CR>
"inoremap jj <Esc>`^
inoremap jj <Esc>`^
inoremap wj <Esc>`^ :w <CR>
nnoremap <silent><leader>w <Esc>:w<CR>
vnoremap <silent><Leader>w <Esc>:write<CR>
nnoremap <Leader>rr:call QuickRun()

"-------------------------------git ----------------------------------------

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gc :Gcommit<CR>



"
"-------------------------------git ----------------------------------------

"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1

"let g:Lf_PopupPalette = {
"    \  'light': {
"    \      'Lf_hl_match': {
"    \                'gui': 'NONE',
"    \                'font': 'NONE',
"    \                'guifg': 'NONE',
"    \                'guibg': '#303136',
"    \                'cterm': 'NONE',
"    \                'ctermfg': 'NONE',
"    \                'ctermbg': '236'
"    \              },
"    \      'Lf_hl_cursorline': {
"    \                'gui': 'NONE',
"    \                'font': 'NONE',
"    \                'guifg': 'NONE',
"    \                'guibg': '#303136',
"    \                'cterm': 'NONE',
"    \                'ctermfg': 'NONE',
"    \                'ctermbg': '236'
"    \              },
"    \      },
"    \  }
"
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fan :LeaderfFunctionAll<CR>
nnoremap <Leader>fch :LeaderfHistoryCmd <CR>
nnoremap <Leader>fc :LeaderfCommand <CR>

noremap <leader>e :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"noremap <leader>fgr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>

call plug#begin()
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'liuchengxu/vim-clap'

 Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
Plug 'junegunn/fzf.vim',
"Plug 'ludovicchabant/vim-gutentags'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'

Plug 'neoclide/coc-git'
Plug 'morhetz/gruvbox'
Plug 'mzlogin/vim-markdown-toc'

Plug 'dhruvasagar/vim-table-mode'
" 安装插件
Plug 'iamcco/markdown-preview.nvim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ferrine/md-img-paste.vim'
Plug 'kristijanhusak/defx-icons'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project','.gitignore']
"
"" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
"
"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
"" 检测 ~/.cache/tags 不存在就新建 "
"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif
"
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

autocmd FileType ruby :call RUBLIB()
autocmd FileType python :call PYTHONLIB()
autocmd FileType defx call s:defx_my_settings() 
function PYTHONLIB()
	set tags=tags
	set tags+=./tags
	set tags+=/Users/lidi/.tags/python/3.8/tags
endfunction
function RUBLIB()
	set tags=tags
	set tags+=./tags
	set tags+=/Users/lidi/.tags/ruby/3.0/tags
endfunction
function JSLIB()
	set tags=tags
	set tags+=./tags
	set tags+=/Users/lidi/.tags/js/node_modules/tags
endfunction


"let g:defx_icons_enable_syntax_highlight = 1
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
"取消储存时自动更新目录
let g:vmt_auto_update_on_save = 0
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:mdip_imgdir = 'img'
colorscheme onedark
"colorscheme gruvbox

"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>F%i

" 指定浏览器路径


let g:table_mode_map_prefix = 't'
let g:table_mode_delimiter = ' '
let g:mkdp_path_to_chrome = "path/of/chrome"
" 指定预览主题，默认Github
let g:mkdp_markdown_css=''
" 禁用markdown 折叠
let g:vim_markdown_folding_disabled = 1

let g:vim_markdown_math = 1
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" 设置状态栏
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>

let g:floaterm_wintype = "split"
nmap <leader>ts :FloatermPrev<CR>
nmap <leader>tn :FloatermNew<CR>
nmap <leader>tn :FloatermToggle<CR>
nmap <leader>th :FloatermHide<CR>
" 修改了一些个人不喜欢的字符
  " 设置defx树的一些格式
  
  "不显示文档总字数
let g:airline#extensions#wordcount#enabled = 1
"不显示文件编码（Windows系统）
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
"设置tagber对于markdown的支持
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }
"取消显示warning部分
let g:airline_section_warning = ''
"取消显示section_b
let g:airline_section_b = ''
"section_c显示为tagbar检索出来的标题
let g:airline_section_c = airline#section#create(['tagbar'])
"section_x显示文件名
let g:airline_section_x = '%{expand("%")}'
"section_y显示时间
let g:airline_section_y = airline#section#create(['%{strftime("%D")}'])
"section_z显示日期
let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
"激活tagbar扩展
let g:airline#extensions#tagbar#enabled = 1

"  call defx#custom#option('_', {
"            \ 'winwidth': 30,
"            \ 'split': 'vertical',
"            \ 'direction': 'topleft',
"            \ 'show_ignored_files': 0,
"            \ 'buffer_name': '',
"            \ 'toggle': 1,
"            \ 'resume': 1
"            \ })
call defx#custom#option('_', {
  \ 'columns': 'icons:indent:filename:size',
  \ 'winwidth': 30,
  \ 'split': 'vertical',
  \ 'direction': 'botright',
  \ 'show_ignored_files': 0,
  \ 'resume': 1,
  \ })


function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \<SID>isAtStartOfLine('\|\|') ?
          \'<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \<SID>isAtStartOfLine('__') ?
          \'<c-o>:silent! TableModeDisable<cr>' : '__'
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  "IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  "nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> o
                \ defx#is_directory() ? 
                \ defx#do_action('open_or_close_tree') : 
                \ defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> E defx#do_action('open')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> R defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove')
  "nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> <C-R> defx#do_action('redraw')
endfunction
"function! s:defx_my_settings() abort
"  " Define mappings
"  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
"  nnoremap <silent><buffer><expr> c
"  \ defx#do_action('copy')
"  nnoremap <silent><buffer><expr> m
"  \ defx#do_action('move')
"  nnoremap <silent><buffer><expr> p
"  \ defx#do_action('paste')
"  nnoremap <silent><buffer><expr> l
"  \ defx#do_action('open')
"  nnoremap <silent><buffer><expr> E
"  \ defx#do_action('open', 'vsplit')
"  nnoremap <silent><buffer><expr> P
"  \ defx#do_action('open', 'pedit')
"  nnoremap <silent><buffer><expr> o
"  \ defx#do_action('open_or_close_tree')
"  nnoremap <silent><buffer><expr> K
"  \ defx#do_action('new_directory')
"  nnoremap <silent><buffer><expr> N
"  \ defx#do_action('new_file')
"  nnoremap <silent><buffer><expr> M
"  \ defx#do_action('new_multiple_files')
"  nnoremap <silent><buffer><expr> C
"  \ defx#do_action('toggle_columns',
"  \                'mark:indent:icon:filename:type:size:time')
"  nnoremap <silent><buffer><expr> S
"  \ defx#do_action('toggle_sort', 'time')
"  nnoremap <silent><buffer><expr> d
"  \ defx#do_action('remove')
"  nnoremap <silent><buffer><expr> r
"  \ defx#do_action('rename')
"  nnoremap <silent><buffer><expr> !
"  \ defx#do_action('execute_command')
"  nnoremap <silent><buffer><expr> x
"  \ defx#do_action('execute_system')
"  nnoremap <silent><buffer><expr> yy
"  \ defx#do_action('yank_path')
"  nnoremap <silent><buffer><expr> .
"  \ defx#do_action('toggle_ignored_files')
"  nnoremap <silent><buffer><expr> ;
"  \ defx#do_action('repeat')
"  nnoremap <silent><buffer><expr> h
"  \ defx#do_action('cd', ['..'])
"  nnoremap <silent><buffer><expr> ~
"  \ defx#do_action('cd')
"  nnoremap <silent><buffer><expr> q
"  \ defx#do_action('quit')
"  nnoremap <silent><buffer><expr> <Space>
"  \ defx#do_action('toggle_select') . 'j'
"  nnoremap <silent><buffer><expr> *
"  \ defx#do_action('toggle_select_all')
"  nnoremap <silent><buffer><expr> j
"  \ line('.') == line('$') ? 'gg' : 'j'
"  nnoremap <silent><buffer><expr> k
"  \ line('.') == 1 ? 'G' : 'k'
"  nnoremap <silent><buffer><expr> <C-l>
"  \ defx#do_action('redraw')
"  nnoremap <silent><buffer><expr> <C-g>
"  \ defx#do_action('print')
"  nnoremap <silent><buffer><expr> cd
"  \ defx#do_action('change_vim_cwd')
"endfunction
"colorscheme gotham
"colorscheme gotham256
"function! s:defx_my_settings() abort
"  "IndentLinesDisable
"  setl nospell
"  setl signcolumn=no
"  setl nonumber
"  nnoremap <silent><buffer><expr> <CR>
"  \ defx#is_directory() ?
"  \ defx#do_action('open_or_close_tree') :
"  \ defx#do_action('drop',)
"  nmap <silent><buffer><expr> <2-LeftMouse>
"  \ defx#is_directory() ?
"  \ defx#do_action('open_or_close_tree') :
"  \ defx#do_action('drop',)
"  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
"  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
"  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
"  "nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
"nnoremap <sient><buffer><expr> o
"                \ defx#is_directory() ? 
"                \ defx#do_action('open_or_close_tree') : 
"                \ defx#do_action('multi', ['drop'])
"  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
"  nnoremap <silent><buffer><expr> E defx#do_action('open')
"  nnoremap <silent><buffer><expr> C defx#do_action('copy')
"  nnoremap <silent><buffer><expr> P defx#do_action('paste')
"  nnoremap <silent><buffer><expr> R defx#do_action('rename')
"  nnoremap <silent><buffer><expr> D defx#do_action('remove')
"  "nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
"  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
"  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
"  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
"  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
"  nnoremap <silent><buffer><expr> <C-R> defx#do_action('redraw')
"endfunction


 func! ArgFunc() abort
        let s:arg = argv(0)
        if isdirectory(s:arg)
            return s:arg
        else
            return fnamemodify(s:arg, ':h')
        endif
endfunc

func! QuickRun()
        exec "w"
        let ext = expand("%:e")
        let file = expand("%")
        if ext ==# "sh"
            exec "!sh %"
        elseif ext ==# "cpp"
            exec "!clang++ % -Wall -O3 -g -std=c++17 -o %<.out && ./%<.out"
        elseif ext ==# "c"
            exec "!clang % -Wall -g -std=c11 -o %<.out && ./%<.out"
        elseif ext ==# "java"
            let classPath = expand('%:h')
            let className = expand('%:p:t:r')
            " echo classPath
            " echo className
            exec "!javac %"
            exec "!java -classpath " . classPath . " " . className
        elseif ext ==# "go"
            exec "!go run %"
        elseif ext ==# "js"
            exec "!node %"
        elseif ext ==# "bin"
            exec "!readelf -h %"
        elseif ext ==# "py"
            exec "!python3 %"
        elseif ext ==# "vim"
            exec "so %"
        elseif ext ==# "html"

          exec "open -a 'Firefox' %"
          ""  exec "!google-chrome-stable %"
        elseif ext ==# "rs"
            call CargoRun()
        elseif ext ==# "rb"
            exec "!ruby %"
        else
            echo "Check file type !"
        endif
        echo 'done'
endf

func! CargoRun()
	let cargo_run_path = fnamemodify(resolve(expand('%:p')), ':h')
	while cargo_run_path != "/"
		if filereadable(cargo_run_path . "/Cargo.toml")
		    echo cargo_run_path
		    exec "cd " . cargo_run_path
		    exec "!cargo run"
		    exec "cd -"
		    return
		endif
	let cargo_run_path = fnamemodify(cargo_run_path, ':h')
	endwhile
	echo "Cargo.toml not found !"
endf

hi Visual ctermfg=180 ctermbg=59 guifg=#E5C07B guibg=#5C6370

