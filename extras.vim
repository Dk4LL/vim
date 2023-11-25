" =================================================================================================
"
" Arquivo para a instalação e configuração de pacotes (plugins) no meu vim
" Autor: Dk4LL (dk4ll@proton.me)
" Data: 27/10/2023
"
" =================================================================================================

call plug#begin()

  " Plugins para Tema de cores (Iceberg, Catppuccin e Nord)
  "Plug 'cocopon/iceberg.vim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  "Plug 'arcticicestudio/nord-vim'

  " Plugin tema de cores para a barra de status
  Plug 'gkeep/iceberg-dark'

  " Plugin para a barra de status
  Plug 'itchyny/lightline.vim'

  " Plugin wrapper do Git no vim
  Plug 'tpope/vim-fugitive'

    " Plugin para o Browser-server
  Plug 'https://github.com/wolandark/vim-live-server.git'

  " Plugin para gliphicons
  Plug 'ryanoasis/vim-devicons'

  " Plugin para o explore de arquivos
  Plug 'preservim/nerdtree'

  " Plugin para o gerenciamente de buffer como tab 
  Plug 'ap/vim-buftabline'

  " Plugin para o Emmet no Vim 
  Plug 'mattn/emmet-vim'

  " Plugin para o Hoogle no vim
  "Plug 'twinside/vim-hoogle'

  " Plugin para destaque de indentação
  "Plug 'preservim/vim-indent-guides'

  " Plugin para arco-íris nos parentese, colchetes e chaves
  Plug 'kien/rainbow_parentheses.vim'

  " Plugin para permitir a transparência no VIm
  Plug 'tribela/vim-transparent'

  " Plugin para o LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" =================================================================================================
"
" Configuração dos pacotes
"
" =================================================================================================



" -------------------------------------------------------------------------------------------------
" Iceberge
" -------------------------------------------------------------------------------------------------
" Ativa o pacote de cores (Iceberg)
" colorscheme iceberg

" -------------------------------------------------------------------------------------------------
" Catppuccin
" -------------------------------------------------------------------------------------------------
" Ativa o pacote de cores Catppuccin, possui as opções: Mocha, Macchiato, Frappé e Latte
colorscheme catppuccin_frappe



" -------------------------------------------------------------------------------------------------
" Lightline
" -------------------------------------------------------------------------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'separator': {'left': "", 'right': ''},
      \ 'active': {
      \     'left' : [ ['mode', 'paste'], ['readonly', 'filename'], ['gitbranch'] ],
      \     'right': [ ['clock'], [ 'lineinfo', 'percent' ], ['fileformat', 'fileencoding', 'filetype'], ['status'] ]
      \ },
      \ 'inactive': {
      \     'left': [ ['filename'] ],
      \     'right': [ ['clock'], ['status'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'LightlineBranchname',
      \   'status': 'StatusDiagnostic',
      \   'clock': 'MyTime'
      \ },
      \ }


function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ' : ''
  return filename . modified
endfunction

function! LightlineBranchname()
  if isdirectory(getcwd() . '/.git')
    let branch = FugitiveHead()
    return " " . branch
  else
    return '[No git]'
  endif
 endfunction

function! MyTime()
  "let current_time = strftime("%c")
  let current_time = strftime("%H:%M")
  return "  " . current_time
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return '  0    0    0'
  else
    return '  ' .  string(info['error'])  . '    ' . string(info['warning']) . '    ' . string(info['hint'])
  endif
endfunction



" -------------------------------------------------------------------------------------------------
" Vim-devicons
" -------------------------------------------------------------------------------------------------

" Carrega de fato o plugin
let g:webdevicons_enable = 1

" Adiciona as flags no NERDTree
let g:webdevicons_enable_nerdtree = 1

" Define a quantidade de espaço após um glyph character (o padrão é ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Forçar preenchimento extra no NERDTree fazendo os ícones de arquivo se alinhem verticalmente
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1



" -------------------------------------------------------------------------------------------------
" Emmet-vim
" -------------------------------------------------------------------------------------------------

" Modos onde o Emmet-vim está ativo
let g:user_emmet_mode='inv'

" Ativa o Emmet-vim apenas para arquivos html e css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



" -------------------------------------------------------------------------------------------------
" Rainbow_parentheses.vim
" -------------------------------------------------------------------------------------------------

" Cores usadas
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



" -------------------------------------------------------------------------------------------------
" Vim-transparent
" -------------------------------------------------------------------------------------------------

let g:transparent_groups = [
  \ 'Normal', 'Comment', 'Constant', 'Special', 'Identifier',
  \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
  \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
  \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

let g:transparent_groups += ['Pmenu']

let g:transparent_groups += ['CocFloating']

augroup transparent
    autocmd VimEnter,ColorScheme * call MyTransparent()
augroup END

function! MyTransparent()
  hi CursorLine ctermfg=NONE ctermbg=239 guibg=NONE guibg=#4e4e4e
  hi CocMenuSel ctermbg=239 guibg=#4e4e4e
endfunction


