local ok, null_ls = pcall(require, 'null-ls')
if not ok then 
  print ('null-ls not found!')
  return
end

local code_actions = null_ls.builtins.code_actions -- code action sources
local diagnostics = null_ls.builtins.diagnostics -- diagnostic sources
local formatting = null_ls.builtins.formatting -- formatting sources
local hover = null_ls.builtins.hover -- hover sources
local completion = null_ls.builtins.completion -- completion sources

null_ls.setup {
  sources = {
    code_actions.eslint_d,
    diagnostics.jshint,
    diagnostics.tidy,
    diagnostics.todo_comments,
    -- formatting.prettierd.with({
    --     env = {
    --         string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
    --     },
    -- })
    -- formatting.stylua,
    -- formatting.prettierd.with({
    --     env = {
    --         PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
    --     },
    -- }),

    -- diagnostics.eslint_d,
    -- diagnostics.standardjs,
  },

  -- on_attach = function(client, bufnr)
    -- if client.server_capabilities.documentFormattingProvider then
      -- vim.cmd [[ nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR> ]] -- formatting
      -- vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format {async = true}<CR>")
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()") -- format on save
    -- end
 
    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   vim.cmd [[ xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR> ]]
    -- end
  -- end,
}
