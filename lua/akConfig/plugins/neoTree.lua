return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-tree/nvim-web-devicons",
            enable = vim.g.have_nerd_font,
        },
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
        { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
            window = {
                mappings = {
                    ["\\"] = "close_window",
                },
            },
        },
    },
}
