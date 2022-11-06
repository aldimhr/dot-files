-- check group tag
-- :call SynStack()
vim.cmd [[
    function! SynStack ()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunction

    function! SynGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun

    map gm :call SynStack()<CR>
    map gs :call SynGroup()<CR>
]]

-- map('n', '<leader>s', ":call SynStack() <CR>")

