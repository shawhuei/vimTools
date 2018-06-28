" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"set encoding=utf-8
set fileformats=unix
set guifont=Luxi\ Mono\ 9
set tabstop=4
set backspace=2
set nu!
"set vbt_vb=        " vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
"set wrap           " 自动换行
"set nowrap         " 不自动换行
set linebreak       " 整词换行
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
"set list                       " 显示制表符
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
set listchars=tab:.\ ,trail:.   " 将制表符显示为'.   '
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
set hidden          " 没有保存的缓冲区可以自动被隐藏
set scrolloff=5

"--------------------------------------------------------------------------------
" 查找/替换相关的设置
"--------------------------------------------------------------------------------
set hlsearch        " 高亮显示搜索结果
set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                    " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                    " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                    " 找要匹配的单词时，别忘记回车
set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个

"--------------------------------------------------------------------------------
" 状态栏相关的设置
"--------------------------------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2    " always show the status line
set ruler           " 在编辑过程中，在右下角显示光标位置的状态行

"--------------------------------------------------------------------------------
" 编程相关的设置
"--------------------------------------------------------------------------------
set completeopt=longest,menu    " 关掉智能补全时的预览窗口
filetype pluginindenton       " 加了这句才可以用智能补全

syn on              " 打开语法高亮
set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set ai!             " 设置自动缩进
colorscheme desert

"--------------------------------------------------------------------------------
" 代码折叠
"--------------------------------------------------------------------------------
"set foldmarker={,}
"set foldmethod=marker
set foldmethod=syntax
set foldlevel=100       " Don't autofold anything (but I can still fold manually)
"set foldopen-=search   " don't open folds when you search into them
"set foldopen-=undo     " don't open folds when you undo stuff
"set foldcolumn=4

"--------------------------------------------------------------------------------
" 模仿MS Windows中的快捷键
"--------------------------------------------------------------------------------
"vmap <C-c> "yy
"vmap <C-x> "yd
"nmap <C-v> "yp
"vmap <C-v> "yp
nmap <C-a> ggvG$

"--------------------------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

"--------------------------------------------------------------------------------
" 模仿MS Windows中的保存命令: Ctrl+S
"--------------------------------------------------------------------------------
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>




"###############################################################################
" The following is the Plugins' setting
"###############################################################################

"--------------------------------------------------------------------------------
" TagList :Tlist
"--------------------------------------------------------------------------------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window=1

"--------------------------------------------------------------------------------
" netrw 文件浏览器 :e <PATH>
"--------------------------------------------------------------------------------
"let g:netrw_winsize = 30       " 浏览器宽度

"--------------------------------------------------------------------------------
" QuickFix
"--------------------------------------------------------------------------------
nmap <F6> :cn<cr>   " 切换到下一个结果
nmap <F7> :cp<cr>   " 切换到上一个结果

"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
nmap wm :WMToggle<cr> " 是nomal模式的命令，不是Ex模式的

"--------------------------------------------------------------------------------
" MiniBufExp
"--------------------------------------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplorerMoreThanOne=0
"let g:miniBufExplModSelTarget = 1

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline
"--------------------------------------------------------------------------------
" cscope
"--------------------------------------------------------------------------------
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set cscopetag
" 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕一闪
" 就回到nomal状态了
" <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <silent><F4> :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"add alt + <-- cursor-left
map <M-Left> :bpre<CR>
"add alt + --> cursor-right
map <M-Right> :bnext<CR>
map cmb :CMiniBufExplorer<CR>

"max window
nmap mm <C-w><C-_><ESC>

"vim buffers
nmap bu :buffers<CR>

"choose vim buffers
nmap buf :buffer 
"--------------------------------------------------------------------------------
" Grep
"--------------------------------------------------------------------------------
"直接按下<F3>键来查找光标所在的字符串
nnoremap <silent> <F3> :Rgrep<CR>

"--------------------------------------------------------------------------------
" A
"--------------------------------------------------------------------------------
nnoremap <silent> <F12> :A<CR>

"--------------------------------------------------------------------------------
" NERD_commenter
"--------------------------------------------------------------------------------
let NERD_c_alt_style = 1    " 将C语言的注释符号改为//, 默认是/**/
"nmap <F5> ,cc

"--------------------------------------------------------------------------------
" SuperTab :SuperTabHelp
"--------------------------------------------------------------------------------
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"--------------------------------------------------------------------------------
" CVim :help csupport
"--------------------------------------------------------------------------------
let g:C_Comments = "no"         " 用C++的注释风格
let g:C_BraceOnNewLine = "no"   " '{'是否独自一行
let g:C_AuthorName = "Wu Yin"
let g:C_Project="F9"
let g:Cpp_Template_Function = "c-function-description-wuyin"
let g:C_TypeOfH = "c"           " *.h文件的文件类型是C还是C++

"##################################################################
"########################## End Of Vimrc ##########################
"##################################################################

" if filetype is C
"   TODO
" fi
"set tags+=/home/shaohui/L5910/DRV_L5910/MTK6582_KK_PRE_RELEASE/alps/tags
"set tags+=/home/shaohui/CU300/DRV_CU300/MTK6752_ALPS.KK.P294_K2V1_CU/alps/tags
"set tags+=/home/shaohui/CU300/MMI_CU300/MTK6752_ALPS.KK.P294_K2V1_CU/alps/tags
"set tags+=/home/shaohui/CM620/MTK6752_ALPS.KK.P294_K2V1_CU/alps/tags
"set tags+=/home/shaohui/Lollipop_W5800/AOSP_REF/MTK6582_WT_L/alps/tags
"set tags+=/home/shaohui/CM380/CM380_MMI/MTKSP6735MV1_64/alps/tags
"set tags+=/home/shaohui/CT381/MTKSP6735MV1_64/alps/tags
"set tags+=/home/shaohui/Amberalla/scamera/ambalink-a12-app/rtos/tags
"set tags+=/home/shaohui/WE001/WE001_app/ambalink-a12-app/tags
"set tags+=/home/shaohui/CM320/CM320_CM380_DRV/MTK6735_65T_LX_M/tags
"set tags+=/home/shaohui/CM280/tags
set tags+=//home/shaohui/CM280/CM280_DRV_0107/alps/tags
"set tags+=/home/shaohui/L5930/MTK6582LTE_PHONE_V2_KK1.82.92.LTE.DEV.p8/alps/tags
" Don't use Ex mode, use Q for formatting
map Q gq
map qq :q<CR>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
set mouse=a
"endif

let g:DoxygenToolkit_commentType = "C++" 
"let g:DoxygenToolkit_briefTag_pre="@Name: "
let g:DoxygenToolkit_paramTag_pre="@Param: "
let g:DoxygenToolkit_returnTag   ="@Returns: "
"letg:DoxygenToolkit_blockHeader="/*******************************************************"
"let g:DoxygenToolkit_blockFooter="*******************************************************/"
let g:DoxygenToolkit_authorName="shaohui@longcheer.net"
let g:DoxygenToolkit_licenseTag="By shaohui"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
"自定义快捷键
vmap <C-S-P>    dO#endif<Esc>PO#if 0<Esc>
map <F5> <Esc>:Dox<cr>
map <F8> <Esc>:DoxAuthor<cr>
map <F9> <Esc>:DoxLic<cr>

"cs add /home/zhaofei1/project/longcheerv2/0801/truck/alps/cscope.out /home/zhaofei1/project/longcheerv2/0801/truck/alps/
"cs add /home/zhaofei1/project/aw700/0912/alps/cscope.out /home/zhaofei1/project/aw700/0912/alps/
