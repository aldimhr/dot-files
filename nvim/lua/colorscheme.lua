local g = vim.g
local wo = vim.wo
local opt = vim.opt

require('gruvbox').setup {
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    dim_inactive = false,
    transparent_mode = true,
    overrides = {
        htmlH2 = { fg = "#ffffff" },
        htmlTagN = { fg = "#689d6a" },
        htmlTitle = { fg = "#ffffff" }
    },
}

vim.cmd [[colorscheme gruvbox]] -- set colorscheme
