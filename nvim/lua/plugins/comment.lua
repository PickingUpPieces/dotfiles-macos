return {
    'numToStr/Comment.nvim',
    opts = {
        padding = true,
        mappings = {
            basic = false, -- Disable default mappings
            extra = false
        }
    },
    keys = function()
        local comment = require("Comment.api")
        return {
            { "gcc", mode = "n", function() comment.toggle.linewise.current() end, desc = "Comment: Toggle linewise comment" },
            { "gbc", mode = "n", function() comment.toggle.blockwise.current() end, desc = "Comment: Toggle blockwise comment" },
            { "<leader>gc", mode = { "n", "x" }, function() comment.toggle.linewise(vim.fn.visualmode()) end, desc = "Comment: Toggle linewise comment (visual or motion)" },
            { "<leader>gb", mode = { "n", "x" }, function() comment.toggle.blockwise(vim.fn.visualmode()) end, desc = "Comment: Toggle blockwise comment (visual or motion)" },
            { "gc", mode = "x", function() comment.toggle.linewise(vim.fn.visualmode()) end, desc = "Comment: Toggle linewise comment (visual mode)" },
            { "gb", mode = "x", function() comment.toggle.blockwise(vim.fn.visualmode()) end, desc = "Comment: Toggle blockwise comment (visual mode)" },
        }
    end
}
