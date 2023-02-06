-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- REMAP
map("n", "gj", "j", {silent = true})
map("n", "j", "gj", {silent = true})
map("n", "gk", "k", {silent = true})
map("n", "k", "gk", {silent = true})

map("n", "<leader>z", ":set wrap! <CR>", {silent = true})  -- set wrap / no wrap
map("n", "<leader>n", ":bn <CR>", {silent = true})  -- buffer next
map("n", "<leader>p", ":bp <CR>", {silent = true})  -- buffer previous
map("n", "<leader>d", ":bd <CR>", {silent = true})  -- buffer delete

-- now it is possible to paste many times over selected text
-- map("n", "p", '"0p')

