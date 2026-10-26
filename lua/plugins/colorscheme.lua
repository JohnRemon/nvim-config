return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- The active rice (see lua/config/rice.lua and `rice apply`) decides the
      -- colorscheme. Missing slot falls back to Gruvbox.
      colorscheme = function()
        require("config.rice").apply()
      end,
    },
  },
}
