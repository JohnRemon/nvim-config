return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      kitty = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("config.rice").apply()
      end,
    },
  },
}
