return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,  -- Load immediately at startup
    opts = {
        -- configuration goes here
        ---@type lc.lang
        lang = "rust",
        ---@type string
--      arg = "leetcode",
        --@type table<string, boolean>
--      plugins = {
--          non_standalone = false,
--      },
        storage = {
            home = vim.fn.stdpath("data") .. "/leetcode",
            cache = vim.fn.stdpath("cache") .. "/leetcode",
        },
    },
    keys = {
        { "<leader>lq", mode = { "n" }, "<cmd>Leet tabs<cr>" },
        { "<leader>lm", mode = { "n" }, "<cmd>Leet menu<cr>" },
        { "<leader>lc", mode = { "n" }, "<cmd>Leet console<cr>" },
        { "<leader>li", mode = { "n" }, "<cmd>Leet info<cr>" },
        { "<leader>ll", mode = { "n" }, "<cmd>Leet lang<cr>" },
        { "<leader>ld", mode = { "n" }, "<cmd>Leet desc<cr>" },
        { "<leader>lr", mode = { "n" }, "<cmd>Leet run<cr>" },
        { "<leader>ls", mode = { "n" }, "<cmd>Leet submit<cr>" },
        { "<leader>ly", mode = { "n" }, "<cmd>Leet yank<cr>" },
        { "<leader>lp", mode = { "n" }, "<cmd>Leet list<cr>" },
    },
    hooks = {
        -- Store the script where the leetcode questions are stored and make it executeable
--    #!/bin/sh
--
--    for f in *.rs; do
--        crates="${crates}${next}{\"root_module\": \"$f\",\"edition\": \"2021\",\"deps\": []}"
--        next=","
--    done
--    
--    sysroot_src="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
--    
--    echo "{\"sysroot_src\": \"$sysroot_src\", \"crates\": [$crates]}" | jq '.' >rust-project.json
--
    ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {
            function()
                -- os.execute "sleep 1"
                local file_extension = vim.fn.expand "%:e"
                if file_extension == "rs" then
                    local bash_script = tostring(vim.fn.stdpath "data" .. "/leetcode/rust_init.sh")
                    local success, error_message = os.execute(bash_script)
                    if success then
                        print "Successfully updated rust-project.json"
                        vim.cmd "LspRestart rust_analyzer"
                    else
                        print("Failed update rust-project.json. Error: " .. error_message)
                    end
                end
            end,
        }
    }
}
