return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp"
    },
    opts = {
        workspaces = {
            {
                name = "fall_semester_2025",
                path = "~/FallSemester2025/",
            },
        },
    },
}
