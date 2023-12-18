return {
  "prichrd/netrw.nvim",
  config = function()
    require("netrw").setup({
      -- Put your configuration here, or leave the object empty to take the default
      -- configuration.
      icons = {
        symlink = '', -- Symlink icon (directory and file)
        directory = '', -- Directory icon
        file = '', -- File icon
      },
      use_devicons = true -- Uses nvim-web-devicons if true, otherwise use the file icon specifie
    })
  end
}

--return {
-- "nvim-neo-tree/neo-tree.nvim",
-- version = "*",
-- dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
-- },
-- opts = {
--     filesystem = {
--         filtered_items = {
--             -- visible = true,
--             hide_dotfiles = false,
--             hide_gitignored = true,
--         }
--     }
-- },
-- config = function()
--     -- Unless you are still migrating, remove the deprecated commands from v1.x
--     vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--     require('neo-tree').setup({
--         window = {
--             position = "float",
--         }
--     })
-- end
--}

--This will install the tree plugin and add the command `:Neotree` for you. You can explore the documentation at [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) for more information.
