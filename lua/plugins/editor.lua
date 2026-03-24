return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        file_ignore_patterns = { "node_modules", ".git/", "target/" }, -- target = Java build
      },
    },
  },
}
