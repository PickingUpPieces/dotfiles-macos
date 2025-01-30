local builtin = require("telescope.builtin")
return {
    'nvim-telescope/telescope.nvim', tag = '8.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { 
        -- parameter defined by telescope
        -- define keys for plugin itself
    },
    keys = {
        -- define keys for "entry point" 
        { "<leader>ff", mode = { "n" }, function() builtin.find_files({ hidden = true }) end, desc = 'Telescope: find files'},
        { "<leader>fg", mode = { "n" }, function() builtin.git_files({ hidden = true }) end, desc = 'Telescope: find only git registered files'},
        { "<leader>fs", mode = { "n" }, function() builtin.live_grep() end, desc = 'Telescope: find string' }
    }
}
