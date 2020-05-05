command! -nargs=1 SessionSave call Mks(<f-args>)
function! Mks(name)
    execute 'mksession! ~/.local/share/nvim/sessions/' . a:name . '-session.vim'
endfunction

command! -nargs=1 SessionRemove call Rms(<f-args>)
command! -complete=file -nargs=1 SessionRemove :echo '~/.local/share/nvim/sessions/' . a:name . '-session.vim'.' '.(delete('~/.local/share/nvim/sessions/' . <f-args> . '-session.vim') == 0 ? 'SUCCEEDED' : 'FAILED')
function! Rms(name)
    delete('~/.local/share/nvim/sessions/' . a:name . '-session.vim')
endfunction
