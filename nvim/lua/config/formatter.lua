local ok, formatter = pcall(require, 'formatter')
if not ok then
  print ('formatter not found!')
  return
end

local util = require "formatter.util"

local prettierd = function ()
    return {
        exe = "prettierd",
        stdin = true,
        args = {
            util.escape_path(util.get_current_buffer_file_path()),
            "--tab-width=4",
            "--print-width=120",
            "--single-quote"
        },
    }
end


formatter.setup {
    logging = false,
    filetype = {
        html = { prettierd },
        javascript = { prettierd },
        typescript = { prettierd },
        javascriptreact = { prettierd },
        typescriptreact = { prettierd },
        css = { prettierd },
        scss = { prettierd },
        vue = { prettierd },
        json = { prettierd },
        markdown = { prettierd },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

-- REMAPS
vim.cmd [[
    nnoremap <silent> <leader>f :Format<CR>
    nnoremap <silent> <leader>F :FormatWrite<CR>
]]
