return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            clang_format = {
                prepend_args = {
                    "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
            },
            prettier = {
                prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
            },
        },

        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            xml = { "xmlformatter" },
        },
    },
}
