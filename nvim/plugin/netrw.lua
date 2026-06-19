vim.pack.add {
  'https://github.com/prichrd/netrw.nvim',
}

require('netrw').setup {
  icons = {
    symlink = '',
    directory = '',
    file = '',
  },
  use_devicons = true,
}
