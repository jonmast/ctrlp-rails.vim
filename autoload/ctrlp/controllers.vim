if exists('g:loaded_ctrlp_controllers') && g:loaded_ctrlp_controllers
  finish
endif
let g:loaded_ctrlp_controllers = 1

let s:controllers_var = {
\  'init':   'ctrlp#controllers#init()',
\  'accept': 'ctrlp#controllers#accept',
\  'lname':  'controllers',
\  'sname':  'contro',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:controllers_var)
else
  let g:ctrlp_ext_vars = [s:controllers_var]
endif

function! ctrlp#controllers#init()
  return map(globpath('app/controllers/**', '*_controller.rb', 0, 1), 'fnamemodify(v:val, ":s?app/controllers/??:s?_controller.rb??")')
endfunc

function! ctrlp#controllers#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'app/controllers/' . a:str . '_controller.rb')
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#controllers#id()
  return s:id
endfunction
