-- refactoring.nvim (current master, requires Neovim 0.12) depends on
-- lewis6991/async.nvim for the `async` module. Tree-sitter is loaded earlier
-- via plugin/01-treesitter.lua.
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/ThePrimeagen/refactoring.nvim',
}

require('refactoring').setup()

local prompt_me = function()
  require('refactoring').select_refactor()
end
vim.keymap.set({ 'n', 'x' }, '<leader>rr', prompt_me, { desc = '[R]efacto[r] Prompt' })
