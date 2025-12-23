""" Key Mappings

" quick undo and redo in insert mode
inoremap <C-z> <esc>ui
inoremap <C-r> <esc><C-r>i

"" ctrl-backspace in insert mode
" if at end of line: space -> normal -> "_cb
" else move right once, enter normal mode and replace backwards
inoremap <silent><expr> <C-h> (col(".") == col("$"))? " \<esc>\"_cb" : "\<Right><esc>\"_cb" 


"" coc tab completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
	\ "\<CMD>call feedkeys(v:lua.require('nvim-autopairs').autopairs_cr(), 'in')\<CR>"
inoremap <silent><expr> <ESC> coc#pum#visible() ? coc#pum#cancel() : "\<ESC>"

"" insert mode commenting
imap <C-_> <C-o>gcc

"" dir tree shortcuts
nmap <C-b> <Cmd>Neotree show toggle<CR>
imap <C-b> <C-o><Cmd>Neotree show toggle<CR>

