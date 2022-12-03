" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
  " Use GuiFont! to ignore font errors
  GuiFont! JetBrainsMono Nerd Font:h12
endif

" Disable GUI Tabline
if exists(':GuiTabline')
  GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Enable GUI ScrollBar
"if exists(':GuiScrollBar')
"  GuiScrollBar 1
"endif

" Right Click Context Menu (Copy-Cut-Paste)
"nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
"inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
"xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" neovim-gtk
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'JetBrainsMono Nerd Font 12')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif

" fvim
if exists('g:fvim_loaded')
  " good old 'set guifont' compatibility with HiDPI hints...
  if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
    set guifont=JetBrainsMono\ Nerd\ Font:h16
  else
    set guifont=JetBrainsMono\ Nerd\ Font:h32
  endif
  
  " Ctrl-ScrollWheel for zooming in/out
  nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
  nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif
