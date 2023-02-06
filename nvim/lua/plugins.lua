-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, 'packer')
if not ok then
  print ('packer.nvim not found!')
  return
end

require('packer').init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
  },
  compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
})

return packer.startup(function(use)
    use 'mattn/emmet-vim' -- Autocompletion for html and css
    use 'Shatur/neovim-ayu' -- ayu theme for lualine
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'ray-x/lsp_signature.nvim'  -- popup in typing
    use 'lewis6991/impatient.nvim' -- speed up loading lua modules
    use 'ellisonleao/gruvbox.nvim' -- colorscheme/main theme
    use 'wakatime/vim-wakatime' -- code stats

    use {
        "williamboman/mason.nvim", -- lang server installer
        config = function ()
          require('config.mason-nvim')
        end,
    }

    use {
      'jose-elias-alvarez/null-ls.nvim', -- formatter, diagnostics, etc
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('config.null-ls') end
    }

    use { "jayp0521/mason-null-ls.nvim" } -- bridge null-ls and mason-nvim 
    use {"williamboman/mason-lspconfig.nvim"}  -- bridge lspconfig and mason-nvim

    use {
      'nvim-telescope/telescope.nvim', -- file exploler
      branch = '0.1.x',
      requires = {
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { "nvim-telescope/telescope-file-browser.nvim" },
            -- 'nvim-tree/nvim-web-devicons',
            -- {'zane-/cder.nvim'}
            -- { 'kyazdani42/nvim-web-devicons', opt = true }
      },
      config = function ()
          require('config.telescope-nvim')
      end
    }

    use {
      'phaazon/hop.nvim', -- easymotion
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require('config.hop-nvim')
      end
    }

    use {
        'norcalli/nvim-colorizer.lua', -- color highlighter
        config = function()
            require 'colorizer'.setup({
             '*'; -- Highlight all files, but customize some others.
              -- html = {};
            }, {
                mode = 'background',
                css = true,
                css_fn = true,
                rgb_fn = true,
                hsl_fn = true
            })
        end
    }

    use {
        'mhartington/formatter.nvim', -- formatter
        config = function() require('config.formatter') end
    }

    use {
        'kevinhwang91/nvim-ufo', -- folding helper
        requires = 'kevinhwang91/promise-async',
        config = function() require('config.nvim-ufo') end
    }

    use {
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
        config = function() require('config.nvim-treesitter') end,
    }

    use {
        "kylechui/nvim-surround", -- vim surround
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function() require("nvim-surround").setup {} end -- Configuration here, or leave empty to use defaults
    }

    use {
        "numToStr/Comment.nvim", -- autocomment gcc, gc2j, etc
        config = function() require('config.comment-nvim') end
    }

    use {
        "windwp/nvim-autopairs", -- auto create closed bracket pair
        config = function() require("nvim-autopairs").setup {} end
    }


    use {
      'hrsh7th/nvim-cmp', -- Autocomplete plugin
      requires = {
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        {
          "L3MON4D3/LuaSnip",
          requires = { "rafamadriz/friendly-snippets" },
          config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
        },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }, -- Snippets source for nvim-cmp
      },
      config = function() require('config.cmp') end,
      event = 'InsertEnter *',
    }

    use {
        'onsails/lspkind-nvim', -- suggestion window
        config = function() require("lspkind").init() end,
    }

    use {
        'nvim-lualine/lualine.nvim', -- statusline
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('config.lualine') end,
    }

    use {
        'akinsho/bufferline.nvim', -- buffer
        config = function() require('config.bufferline') end,
    }

    use {
        'lewis6991/gitsigns.nvim', -- git
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('config.gitsigns') end,
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
