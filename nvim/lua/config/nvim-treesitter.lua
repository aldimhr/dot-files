require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        -- disable = { "html", "vue", "javascriptreact", "typescriptreact" }
    },

    indent = {
        enable = true,
    },

    playground = {
        enable = true,
        -- disable = {},
        -- updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        -- persist_queries = false, -- Whether the query persists across vim sessions
    },
})
