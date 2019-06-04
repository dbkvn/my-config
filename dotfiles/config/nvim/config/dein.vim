" Dein Package Manager Configuration
" -----------------------------------------------------------------------------

" Add Dein to the runtime path.
set runtimepath+=/home/kmartin/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Initialize Dein packages (only if Dein exists).
if dein#load_state('/home/kmartin/.config/nvim/dein')
  call dein#begin('/home/kmartin/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kmartin/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Example: add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " --- Add plug-ins.

  " NERDTree - file explorer.
  call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})

  " Deoplete - asynchronous completion.
  " call dein#add('Shougo/deoplete.nvim') " FIXME

  " Syntastic - syntax checking.
  call dein#add('vim-syntastic/syntastic')

  " Denite - fuzzy-finding features.
  call dein#add('Shougo/denite.nvim')

  " Tagbar - class outline viewer.
  call dein#add('majutsushi/tagbar')

  " rust.vim - rust language support.
  " call dein#add('rust-lang/rust.vim')

  " End Dein initialization and save state.
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

