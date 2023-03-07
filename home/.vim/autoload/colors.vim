function! colors#ShowHighlightsUnderCursor()
    let l:synstack = synstack(line('.'), col('.'))
    let l:map = map(l:synstack, 'synIDattr(v:val, "name")')

    echo join(reverse(map), ' ')
endfunction
