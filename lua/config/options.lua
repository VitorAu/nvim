vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.bo.cindent = true
        vim.bo.indentexpr = ""
        vim.opt_local.cinoptions = "{0"
    end,
})
