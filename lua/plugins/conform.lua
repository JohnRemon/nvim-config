return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            prettier = {
                prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
            },
            clang_format = {
                prepend_args = {
                    "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
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
        },
    },
}
