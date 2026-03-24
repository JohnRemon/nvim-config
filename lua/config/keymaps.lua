local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split Window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize Window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- CompetiTest
keymap.set("n", "<leader>r", "<cmd>CompetiTest run<cr>", { desc = "Run tests" })
keymap.set("n", "<leader>rr", "<cmd>CompetiTest receive problem<cr>", { desc = "Receive problem" })
