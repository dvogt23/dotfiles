local highlight = {
    "CursorColumn",
    "Whitespace",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    -- event = { "BufReadPost", "BufNewFile" },
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
