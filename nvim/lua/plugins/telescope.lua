local telescope = require("telescope")
local builtin = require("telescope.builtin")

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                hidden = true,
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        width = 0.6,
                        height = 0.6,
                        preview_width = 0.3,
                    }
                }
            }
        },
        keys = {
            { "<leader>ff", mode = { "n" }, function() builtin.find_files() end, desc = 'Telescope: find files' },
            { "<leader>fg", mode = { "n" }, function() builtin.git_files() end, desc = 'Telescope: find only git registered files' },
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
                            -- disables netrw and uses telescope-file-browser in its place
                            hijack_netrw = true,
                            initial_mode = "normal",
                        }
                    }
                }
            },
        },
        config = function()
            telescope.load_extension("file_browser")
        end,
        keys = {
            { "<leader>fb", mode = { "n" }, function() require("telescope").extensions.file_browser.file_browser() end, desc = "Telescope: file browser" }
--  n = {
--    ["c"] = fb_actions.create,
--    ["r"] = fb_actions.rename,
--    ["m"] = fb_actions.move,
--    ["y"] = fb_actions.copy,
--    ["d"] = fb_actions.remove,
--    ["o"] = fb_actions.open,
--    ["g"] = fb_actions.goto_parent_dir,
--    ["e"] = fb_actions.goto_home_dir,
--    ["w"] = fb_actions.goto_cwd,
--    ["t"] = fb_actions.change_cwd,
--    ["f"] = fb_actions.toggle_browser,
--    ["h"] = fb_actions.toggle_hidden, 
--    ["s"] = fb_actions.toggle_all,
-- }
        }
    }
}
