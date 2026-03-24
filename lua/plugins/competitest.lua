return {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },

    opts = {
        template_file = "/mnt/g/CP/template.cpp",
        received_problems_path = "/mnt/g/CP/$(PROBLEM).$(FEXT)",
        received_contests_directory = "/mnt/g/CP",
        received_problems_prompt_path = true,
        received_contests_prompt_directory = true,
        received_contests_prompt_extension = true,
    },

    keys = {
        { "<leader>r", "<cmd>CompetiTest run<cr>", { desc = "Run tests" } },
        { "<leader>rr", "<cmd>CompetiTest receive problem<cr>", { desc = "Receive problem" } },
    },
}
