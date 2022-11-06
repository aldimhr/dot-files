require('diagnostics') -- diagnostics

local g = vim.g
local wo = vim.wo
local opt = vim.opt

g.mapleader = ',' -- set leader key

-- opt.completeopt=menu,menuone,noselect
-- opt.numberwidth = 2
-- opt.cmdheight = 1 -- delete a line in bottom
opt.termguicolors = true
opt.smartindent = true
opt.autoindent = true
opt.number = true	-- add line number
opt.relativenumber = true-- line number relative to cursor
opt.wildmenu = true -- display all matching files when we tab complete
opt.tabstop = 4	-- set tab indent to 4 spaces
opt.shiftwidth = 4  -- set 4 spaces indent when tab pressed
opt.expandtab = true -- on pressing tab, insert 4 spaces
opt.clipboard = 'unnamedplus' -- set clipboard same as system
opt.hlsearch = false -- highlight on search
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.mouse = "a" --Enable mouse mode
opt.cursorline = true --Add highlight current line
wo.wrap = false -- set nowrap in default

-- for bettter netrw
opt.path:remove "/usr/include"
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"
opt.path:append "**"  -- search down into subfolders, provides tab-completion for all file-related tasks
opt.tags:append "$HOME"
opt.completeopt = "menu,menuone,noselect"

-- TWEAK FOR FILE BROWSING
-- with this we can:
-- - :edit a folder to open a file browser
-- - <CR>/v/t to open in an h-split/v-split/tab
-- - check |netrw-browse-maps| for more mappings
g.netrw_banner = 0 -- disable annoying banner
g.netrw_browse_split = 4 -- open in prior window
g.netrw_altv = 1 -- open splits to the right
g.netrw_liststyle = 3 -- tree view



require('remaps') -- import remaps
require('colorscheme') -- colorscheme
-- require('config.null-ls') -- null-ls config

