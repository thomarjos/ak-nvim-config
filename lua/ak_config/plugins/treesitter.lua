return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            "bash",
            "powershell",
            "c",
            "c_sharp",
            "java",
            "cmake",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "javascript",
            "typescript",
            "tsx",
        })
    end,
}
