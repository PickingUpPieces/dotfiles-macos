return {
  "erichlf/devcontainer-cli.nvim",
  dependencies = { 'akinsho/toggleterm.nvim' },
  opts = {
        dotfiles_repository = "https://github.com/PickingUpPieces/dotfiles-macos.git",
        dotfiles_branch = "develop"
  },
  keys = {
    -- stylua: ignore
    {
      "<leader>cdu",
      ":DevcontainerUp<cr>",
      desc = "Up the DevContainer",
    },
    {
      "<leader>cdc",
      ":DevcontainerConnect<cr>",
      desc = "Connect to DevContainer",
    },
    {
      "<leader>cdd",
     ":DevcontainerDown<CR>",
      desc = "Kill the current DevContainer",
    },
    {
      "<leader>cde",
      ":DevcontainerExec direction='vertical' size='40'<CR>",
      desc = "Execute a command in DevContainer",
    }, 
    {
      "<leader>cdt",
      "<CMD>DevContainerToggle<CR>",
      desc = "Toggle the current DevContainer Terminal"
    },
  }
 }
