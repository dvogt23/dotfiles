function! PutTermPanel(buf, side, size) abort
  " new term if no buffer
  if a:buf == 0
    term
  else
    execute "sp" bufname(a:buf)
  endif
  " default side if wrong argument
  if stridx("hjklHJKL", a:side) == -1
    execute "wincmd" "J"
  else
    execute "wincmd" a:side
  endif
  " horizontal split resize
  if stridx("jkJK", a:side) >= 0
    if ! a:size > 0
      resize 6
    else
      execute "resize" a:size
    endif
    return
  endif
  " vertical split resize
  if stridx("hlHL", a:side) >= 0
    if ! a:size > 0
      vertical resize 6
    else
      execute "vertical resize" a:size
    endif
  endif
endfunction

function! s:ToggleTerminal(side, size) abort
  let tpbl=[]
  let closed = 0
  let tpbl = tabpagebuflist()
  " hide visible terminals
  for buf in filter(range(1, bufnr('$')), 'bufexists(bufname(v:val)) && index(tpbl, v:val)>=0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      silent execute bufwinnr(buf) . "hide"
      let closed += 1
    endif
  endfor
  if closed > 0
    return
  endif
  " open first hidden terminal
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)<0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      call PutTermPanel(buf, a:side, a:size)
      return
    endif
  endfor
  " open new terminal
  call PutTermPanel(0, a:side, a:size)
endfunction

" set header title for journal & enter writing mode
function! SetJournalMode()
    execute 'normal gg'
    let filename = '#' . ' ' . expand("<afile>:t:r")
    call setline(1, filename)
    execute 'normal o'
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>

" search in the current selected range
function! RangeSearch(direction)
    call inputsave()
    let g:srchstr = input(a:direction)
    call inputrestore()
    if strlen(g:srchstr) > 0
        let g:srchstr = g:srchstr.
                    \ '\%>'.(line("'<")-1).'l'.
                    \ '\%<'.(line("'>")+1).'l'
    else
        let g:srchstr = ''
    endif
endfunction

" delete all not visible buffers
function! Wipeout(bang)
    let visible = {}
    for t in range(1, tabpagenr('$'))
        for b in tabpagebuflist(t)
            let visible[b] = 1
        endfor
    endfor
    let l:tally = 0
    let l:cmd = 'bw'
    if a:bang
        let l:cmd .= '!'
    endif
    for b in range(1, bufnr('$'))
        if buflisted(b) && !has_key(visible, b)
            let l:tally += 1
            exe l:cmd . ' ' . b
        endif
    endfor
    echon "Deleted " . l:tally . " buffers"
endfunction

" execute with Qargs to every quickfix item
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" toggle current buffer to hex and reverse
function ToggleHex()
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        let b:oldft=&ft
        let b:oldbin=&bin
        setlocal binary
        let &ft="xxd"
        let b:editHex=1
        %!xxd -g 1
    else
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        let b:editHex=0
        %!xxd -r
    endif
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

" toggle the colorcolumn
function! ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=80
    endif
endfunction

" makes * and # work on visual mode too.
function! VisualSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" remove all other buffers
function! BufOnly(buffer, bang)
    if a:buffer == ''
        let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
        let buffer = bufnr(a:buffer + 0)
    else
        let buffer = bufnr(a:buffer)
    endif
    if buffer == -1
        echohl ErrorMsg
        echomsg "No matching buffer for" a:buffer
        echohl None
        return
    endif
    let last_buffer = bufnr('$')
    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if n != buffer && buflisted(n)
            if a:bang == '' && getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                            \ n '(add ! to override)'
                echohl None
            else
                silent exe 'bdel' . a:bang . ' ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile
    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif
endfunction

function! GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
endfunction

function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    exec(a:pfx.'open')
endfunction

" Whenever or not there is a window on the provided side.
function! HasWindow(side)
    let _eventignore = &eventignore
    set eventignore=all
    let result = 0
    let crr_win = winnr()
    exe '5wincmd ' . a:side
    if winnr() != crr_win
        let result = 1
        exe crr_win . 'wincmd w'
    endif
    let &eventignore = _eventignore
    return result
endfunction

function! ResizeWindow(dir)
    let crr_win = winnr()
    if a:dir == 'h'
        if HasWindow('h') && !HasWindow('l')
            5wincmd >
        elseif HasWindow('h') && HasWindow('l')
            5wincmd l
            5wincmd >
            exe crr_win . '5wincmd w'
        elseif HasWindow('l') && !HasWindow('h')
            5wincmd <
        endif
    elseif a:dir == 'l'
        if HasWindow('l') && !HasWindow('h')
            5wincmd >
        elseif HasWindow('l') && HasWindow('h')
            5wincmd l
            5wincmd <
            exe crr_win . '5wincmd w'
        elseif HasWindow('h') && !HasWindow('l')
            5wincmd <
        endif
    elseif a:dir == 'k'
        if HasWindow('j') && !HasWindow('k')
            5wincmd -
        elseif HasWindow('j') && HasWindow('k')
            5wincmd j
            5wincmd +
            exe crr_win . '5wincmd w'
        elseif HasWindow('k')
            5wincmd +
        elseif HasWindow('j')
            5wincmd j
            5wincmd +
            exe crr_win . '5wincmd w'
        endif
    elseif a:dir == 'j'
        if HasWindow('j')
            5wincmd +
        elseif HasWindow('k')
            5wincmd k
            5wincmd +
            exe crr_win . '5wincmd w'
        endif
    endif
endfunction

" multiple git diffs in tabs
function! TabMultiDiff()
    let s:tab_multi_diff = 0
    argdo call s:AddBufferToTab()
    tabclose
endfun

function! TabMultiDiffMaximized()
    augroup TabMultiDiffMaximize
        autocmd VimResized * silent! call EquilizeAllTabWindows()
    augroup END
    set lines=999 columns=999
    call TabMultiDiff()
endfun

function! EquilizeAllTabWindows()
    let orig = tabpagenr()
    tabdo wincmd =
    while tabpagenr() != orig
        tabprevious
    endwhile
endfun

function! s:AddBufferToTab()
    let buf = bufnr("%")
    if s:tab_multi_diff
        tablast
        vsplit
        wincmd w
    else
        tab split
        tabmove
    endif
    let s:tab_multi_diff = ! s:tab_multi_diff
    exe 'b ' . buf
    diffthis
    tabfirst
endfun

" toggle syntax based folding
function! ToggleFolding()
    if (!exists("b:outline_mode"))
        let b:outline_mode = 0
    endif
    if (b:outline_mode == 0)
        echo "Enabling syntax based folding."
        set foldmethod=syntax
        set foldenable
        let b:outline_mode = 1
    else
        echo "Disabling syntax based folding."
        set foldmethod=manual
        set nofoldenable
        let b:outline_mode = 0
    endif
endfunction

" Autoremove trailing white spaces spaces and convert tabs in spaces
function! StripWhiteSpace()
    if &ft =~ 'gitcommit\|diff'
    return
    endif
    mark s
    %s/\s\+$//e
    's
    delmarks s
endfunction

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
