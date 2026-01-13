return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local parsers = {
            "bash",
            "powershell",
            "c",
            "c_sharp",
            "java",
            "python",
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
            "json",
            -- "jsonc",
        }

        vim.defer_fn(function()
            ts.install(parsers)
        end, 1000)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("ak-treesitter-features", {}),
            callback = function(args)
                local buf = args.buf
                local filetype = args.match

                local language = vim.treesitter.language.get_lang(filetype) or filetype
                if not vim.treesitter.language.add(language) then
                    return
                end

                vim.treesitter.start(buf, language)

                vim.bo[buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            end,
        })
    end,
}
