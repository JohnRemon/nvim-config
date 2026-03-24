return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "jdtls",
        "lua-language-server",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      diagnostics = {
        underline = true,
        virtual_text = false,
        signs = true,
        float = { border = "rounded" },
      },
    },
  },
}
