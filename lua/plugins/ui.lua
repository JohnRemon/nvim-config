return {
    "folke/noice.nvim",
    opts = {
        -- Definition Border
        presets = {
            lsp_doc_border = true,
        },

        -- Annoying Iniatlizing Message
        routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                },
                opts = { skip = true },
            },
        },
    },
}
