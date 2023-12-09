" =================================================================================================
"
" Arquivo com as configurações de mapeamento de teclas do meu Vim
" Autor: Dk4LL (dk4ll@proton.me)
" Versão: 1.0
" Data: 20/11/2023
"
" =================================================================================================

" -------------------------------------------------------------------------------------------------
" Remapeando comando básicos do Vim
" -------------------------------------------------------------------------------------------------

" Inicia um terminal em um janela de terminal própria, fora do vim
nnoremap <silent> <leader>T :term<CR>

" Mudança entre as janelas no sentido esqueda, direita, cima e baixo
nnoremap <silent> <leader>wl <C-w>h
nnoremap <silent> <leader>wr <C-w>l
nnoremap <silent> <leader>wu <C-w>k
nnoremap <silent> <leader>wd <C-w>j

" Split de buffer em janela vertical e horizontal
nnoremap <silent> <leader>wv <C-w>v
nnoremap <silent> <leader>wh <C-w>s

" Redimensionar janelas para cima e baixo.
nnoremap <silent> <leader>wU <C-w><C-->
nnoremap <silent> <leader>wD <C-w><C-+>
nnoremap <silent> <leader>wL <C-w><
nnoremap <silent> <leader>wR <C-w>>

" Fecha a janela atual
nnoremap <silent> <leader>wc <C-w>q

" -------------------------------------------------------------------------------------------------
" Mapeando funções disponibilizadas por plugins
" -------------------------------------------------------------------------------------------------

" *** PLUGIN VIM-LIVE-SERVER ***

" Inicia o browser-server (Porta padrão 3000)
nnoremap <leader>bs :StartBrowserSync <CR>

" Encerra o browser-server (Porta padrão 3000)
nnoremap <leader>bS :KillBrowserSync <CR>

" Inicia o browser-server na porta N (é preciso informa o valor N e apertar a tecla enter)
" nnoremap <leader>bn :StartBrowserSyncOnPort N <CR>

" Encerra o browser-server na porta N (é preciso informa o valor N e apertar a tecla enter)
" nnoremap <leader>bN KillBrowserSyncOnPort N <CR>



" *** PLUGIN NERDTREE ***

" Abre a NERDTree (Padrão de abertura)
nnoremap <silent> <leader>to :NERDTree<CR>
" Fecha a NERDTree
nnoremap <silent> <leader>tc :NERDTreeClose<CR>
" Abre o NERDTree, ou muda para a janela do NERDTree se ela já estiver aberta
nnoremap <silent> <leader>tf :NERDTreeFocus<CR>
" Muda o root do NERDTree para diretório de trabalho atual, se não tiver um NERDTree aberto o mesmo será criado
nnoremap <silent> <leader>tw :NERDTreeCWD<CR>
" Atualiza o diretório root do NERDTree
nnoremap <silent> <leader>tr :NERDTreeRefreshRoot<CR>



" *** PLUGIN COC ***

" Torna o TAB a combinação de tecla de navegação (para frente) do menu do CoC
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Torna o S-TAB a combinação de tecla de navegação (para trás) do menu do CoC
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Torna o Enter a tecla de seleção do menu do Coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Torna o Ctrl-space para abrir o menu do CoC
inoremap <silent><expr> <c-@> coc#refresh()

" Define a navegação para trás nos diagnósticos do CoC
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)

" Define a navegação para frente nos diagnósticos do CoC
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Navegação, vai para a definição
nnoremap <silent> gd <Plug>(coc-definition)

" Nagegação, vai para a definição de tipo
nnoremap <silent> gy <Plug>(coc-type-definition)

" Nagegação, vai para a implementação
nnoremap <silent> gi <Plug>(coc-implementation)

" Navegação, vai para as referências
nnoremap <silent> gr <Plug>(coc-references)

" Exibe a documentação em uma janela do tipo pop-up
nnoremap <silent> K :call ShowDocumentation()<CR>

" Aplica solução rápida (quickfix) na linha corrent
nnoremap <leader>qf  <Plug>(coc-fix-current)

" Função de renomear símbolos
nnoremap <leader>rn <Plug>(coc-rename)

" Realiza formatação no código selecionado
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

" Aplica actions no código selecionado
nnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Aplica actions na posição do cursor
nnoremap <leader>ac  <Plug>(coc-codeaction-cursor)

" Aplica actions no buffer
nnoremap <leader>as  <Plug>(coc-codeaction-source)

" Aplica refatoração de código no buffer
nnoremap <silent> <leader>re <Plug>(coc-codeaction-refactor)

" Aplica refatoração de código em código selecionado
xnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Highlight do symbol sobre o cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Executa o Code lens na linha corrente do cursor
nnoremap <leader>cl  <Plug>(coc-codelens-action)

" Exibe lista de diagnósticos
nnoremap <silent><nowait> <leader>el  :<C-u>CocList diagnostics<cr>

" Gerencia as extensões
nnoremap <silent><nowait> <leader>ae  :<C-u>CocList extensions<cr>

" Exibe a lista de comandos do CoC
nnoremap <silent><nowait> <leader>aC  :<C-u>CocList commands<cr>

" Procura símbolo no documento atual
nnoremap <silent><nowait> <leader>fF  :<C-u>CocList outline<cr>

" Procura símbolo no workspace atual
nnoremap <silent><nowait> <leader>fW  :<C-u>CocList -I symbols<cr>

" Action seguinte do CoC
nnoremap <silent><nowait> <leader>J  :<C-u>CocNext<CR>

" Action anterior do CoC
nnoremap <silent><nowait> <leader>K  :<C-u>CocPrev<CR>

" Resume para a última CoC list
nnoremap <silent><nowait> <leader>P  :<C-u>CocListResume<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



" *** RAINBOW_PARENTHESES.VIM ***

" Liga/desliga o Plugin
nnoremap <silent> <leader>{0 :RainbowParenthesesToggle<CR>

" Liga/desliga o Plugin apenas para os parenteses
nnoremap <silent> <leader>{r :RainbowParenthesesLoadRound<CR>

" Liga/desliga o Plugin apenas para as colchetes
nnoremap <silent> <leader>{s :RainbowParenthesesLoadSquare<CR>

" Liga/desliga o Plugin apenas para as chaves
nnoremap <silent> <leader>{b :RainbowParenthesesLoadBraces<CR>

" Liga/desliga o Plugin apenas para as html tags
nnoremap <silent> <leader>{c :RainbowParenthesesLoadChevrons<CR>



" *** VIM-BUFTABLINE ***

" Vai para o próximo buffer (respeita a lista circular)
nnoremap <silent> ]b :bnext<CR>

" Vai para o buffer anterior (respeita a lista circular)
nnoremap <silent> [b :bprev<CR>

" Fecha (mata ou deleta) o buffer atual
nnoremap <silent> <leader>bd :bd<CR>



" *** NERDCOMMENTER ***

" Símbolo de comentário a esquerda 
nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
" Símbolo de comantário a direita
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>



" *** VIM-GITGUTTER ***

" Próximo Hunk 
" nnoremap ]h <Plug>(GitGutterNextHunk)

" Prévio Hunk
" nnoremap [h <Plug>(GitGutterPrevHunk)




