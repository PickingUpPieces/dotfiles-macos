local telescope = require("telescope")
local builtin = require("telescope.builtin")

return { 
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { 
            -- parameter defined by telescope
            -- define keys for plugin itself
        },
        keys = {
            -- define keys for "entry point" 
            --            { "<leader>ff", mode = { "n" }, function() builtin.find_files({ hidden = true }) end, desc = 'Telescope: find files'},
            { "<leader>fg", mode = { "n" }, function() builtin.git_files({ hidden = true }) end, desc = 'Telescope: find only git registered files'},
            { "<leader>fs", mode = { "n" }, function() builtin.live_grep() end, desc = 'Telescope: find string' },
        }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { 
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope.nvim",
                opts = {
                    extensions = {
                        file_browser = {
                            -- disables netrw and use telescope-file-browser in its place
                            hijack_netrw = true,
                            hidden = true,
                            sorting_strategy = "ascending",
                            layout_config = {
                                horizontal = {
                                    prompt_position = "top",
                                    preview_width = 0.3,
                                }
                            }
                        }
                    }
                }
            }
        },
        keys = {
            { "<leader>ff", mode = { "n" }, function() telescope.extensions.file_browser.file_browser() end, desc = "Telescope: file " }
        },
        config = function()
            -- To get telescope-file-browser loaded and working with telescope,
            -- you need to call load_extension, somewhere after setup function:
            telescope.load_extension("file_browser")
        end,
    }
}
